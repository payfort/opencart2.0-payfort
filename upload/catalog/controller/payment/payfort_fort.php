<?php

class ControllerPaymentPayfortFort extends Controller {

    public function index() {
        $this->language->load('payment/payfort_fort');
        $data['button_confirm'] = $this->language->get('button_confirm');
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/payfort_fort.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/payfort_fort.tpl';
        } else {
            $this->template = 'default/template/payment/payfort_fort.tpl';
        }
        return $this->load->view($this->template, $data);

    }
    
    public function response(){
        $fortParams = array_merge($_GET,$_POST); //never use $_REQUEST, it might include PUT .. etc
        if (isset($fortParams['response_code']) && isset($fortParams['merchant_reference'])){
            $this->language->load('payment/payfort_fort');
            $this->load->model('checkout/order');
            $order_id = $fortParams['merchant_reference'];
            $order_info = $this->model_checkout_order->getOrder($order_id);
            $success = false;
            $params = $fortParams;
            $hashString = '';
            $signature = $fortParams['signature'];
            
            unset($params['signature']);
            unset($params['route']);
            ksort($params);
            
            foreach ($params as $k=>$v){
                if ($v != ''){
                    $hashString .= strtolower($k).'='.$v;
                }
            }

            $hashString = $this->config->get('payfort_fort_entry_response_sha_phrase') . $hashString . $this->config->get('payfort_fort_entry_response_sha_phrase');
            $trueSignature = hash($this->config->get('payfort_fort_entry_hash_algorithm') ,$hashString);
            
            if ($trueSignature != $signature){
                $success = false;
            }
            else{
                $response_code      = $params['response_code'];
                $response_message   = $params['response_message'];
                $status             = $params['status'];
                
                if (substr($response_code, 2) != '000'){

                }
                else{
                    $success = true;
                    $this->model_checkout_order->addOrderHistory($order_id, $this->config->get('payfort_fort_order_status_id'), 'Paid: ' . $order_id, false);
                    header('location:'.$this->url->link('payment/payfort_fort/success'));
                }
            }
            
            if (!$success){
                //$this->model_checkout_order->confirm($order_id, 10, 'Payment Error', false);
                $this->model_checkout_order->addOrderHistory($order_id, 10, 'Payment Failed', false);
                $this->session->data['error'] = $this->language->get('text_payment_failed').$params['response_message'];
                header('location:'.$this->url->link('checkout/checkout'));
            }
            
        }
    }

    public function send() {

        $this->load->model('checkout/order');
        $order_id = $this->session->data['order_id'];
        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $postData = array(
            'amount'                => round($order_info['total'] * $order_info['currency_value'],2) * 100,
            'currency'              => strtoupper($order_info['currency_code']),
            'merchant_identifier'   => $this->config->get('payfort_fort_entry_merchant_identifier'),
            'access_code'           => $this->config->get('payfort_fort_entry_access_code'),
            'merchant_reference'    => $order_id,
            'customer_email'        => $order_info['email'],
            'command'               => $this->config->get('payfort_fort_entry_command'),
            'language'              => $this->config->get('payfort_fort_entry_language'),
            'return_url'            => $this->url->link('payment/payfort_fort/response'),
        );
        
        $isSADAD = isset($_POST['SADAD']) ? $_POST['SADAD'] : false;
        $isNaps = isset($_POST['NAPS']) ? $_POST['NAPS'] : false;

        $this->db->query("UPDATE `" . DB_PREFIX . "order` SET payment_method = 'Credit / Debit Card', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
        
        if ($isSADAD == "true"){
            $postData['payment_option'] = 'SADAD';
            $this->db->query("UPDATE `" . DB_PREFIX . "order` SET payment_method = 'SADAD', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
        }
        else if ($isNaps == "true"){
            $postData['payment_option'] = 'NAPS';
            $this->db->query("UPDATE `" . DB_PREFIX . "order` SET payment_method = 'NAPS', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
            $postData['order_description'] = $order_id;
        }
        
        //calculate request signature
        $shaString = '';
        ksort($postData);
        foreach ($postData as $k=>$v){
            $shaString .= "$k=$v";
        }

        $shaString = $this->config->get('payfort_fort_entry_request_sha_phrase') . $shaString . $this->config->get('payfort_fort_entry_request_sha_phrase');
        $signature = hash($this->config->get('payfort_fort_entry_hash_algorithm') ,$shaString);
        
        if ($this->config->get('payfort_fort_entry_sandbox_mode')){
            $gatewayUrl = 'https://sbcheckout.payfort.com/FortAPI/paymentPage';
        }
        else{
            $gatewayUrl = 'https://checkout.payfort.com/FortAPI/paymentPage';
        }
        
        $form =  '<form style="display:none" name="payfortpaymentform" id="payfortpaymentform" method="post" action="'.$gatewayUrl.'" id="form1" name="form1">';
        
        foreach ($postData as $k => $v){
            $form .= '<input type="hidden" name="'.$k.'" value="'.$v.'">';
        }
        
        $form .= '<input type="hidden" name="signature" value="'.$signature.'">';
        $form .= '<input type="submit" value="" id="submit" name="submit2">';
        
        $json = array();
        
        $json['form'] = $form;
        
        $this->model_checkout_order->addOrderHistory($order_id, 1, 'Pending Payment', false);

        $this->response->setOutput(json_encode($json));

    }
    
    public function success() {
		$this->load->language('checkout/success');
		$this->load->language('payment/payfort_fort');

		if (isset($this->session->data['order_id'])) {
			$this->cart->clear();

			// Add to activity log
			$this->load->model('account/activity');

			if ($this->customer->isLogged()) {
				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
					'order_id'    => $this->session->data['order_id']
				);

				$this->model_account_activity->addActivity('order_account', $activity_data);
			} else {
				$activity_data = array(
					'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
					'order_id' => $this->session->data['order_id']
				);

				$this->model_account_activity->addActivity('order_guest', $activity_data);
			}

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_p_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_success_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_success_customer'), $this->url->link('account/account', '', 'SSL'), $this->url->link('account/order', '', 'SSL'), $this->url->link('account/download', '', 'SSL'), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_success_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
		}
	}
}

