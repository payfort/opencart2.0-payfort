<?php

class ControllerPaymentPayfortFortQpay extends Controller {

    private $_gatewayHost        = 'https://checkout.payfort.com/';
    private $_gatewaySandboxHost = 'https://sbcheckout.payfort.com/';
    public function index() {
        $this->language->load('payment/payfort_fort');
        $data['button_confirm'] = $this->language->get('button_confirm');
        $data['text_general_error']  = $this->language->get('text_general_error');
        $data['text_error_card_decline'] = $this->language->get('text_error_card_decline');
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/payfort_fort_qpay.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/payfort_fort_qpay.tpl';
        } else {
            $this->template = 'default/template/payment/payfort_fort_qpay.tpl';
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
            'amount'                => $this->_convertFortAmount($order_info['total'], $order_info['currency_value'], $order_info['currency_code']),
            'currency'              => strtoupper($order_info['currency_code']),
            'merchant_identifier'   => $this->config->get('payfort_fort_entry_merchant_identifier'),
            'access_code'           => $this->config->get('payfort_fort_entry_access_code'),
            'merchant_reference'    => $order_id,
            'customer_email'        => $order_info['email'],
            'command'               => $this->config->get('payfort_fort_entry_command'),
            'language'              => $this->config->get('payfort_fort_entry_language'),
            'return_url'            => $this->_getUrl('payment/payfort_fort/response'),
        );
        $postData['payment_option'] = 'NAPS';
        $postData['order_description'] = $order_id;

        $this->db->query("UPDATE `" . DB_PREFIX . "order` SET payment_method = 'Credit / Debit Card', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");
        
        
        //calculate request signature
        $signature = $this->_calculateSignature($postData, 'request');
        $postData['signature'] = $signature;
        
        if ($this->config->get('payfort_fort_entry_sandbox_mode')){
            $gatewayUrl = $this->_gatewaySandboxHost.'FortAPI/paymentPage';
        }
        else{
            $gatewayUrl = $this->_gatewayHost.'FortAPI/paymentPage';
        }
        
        $form =  '<form style="display:none" name="payfortpaymentform" id="payfortpaymentform" method="post" action="'.$gatewayUrl.'" id="form1" name="form1">';
        
        foreach ($postData as $k => $v){
            $form .= '<input type="hidden" name="'.$k.'" value="'.$v.'">';
        }
        
        $form .= '<input type="submit" value="" id="submit" name="submit2">';
        
        $json = array();
        
        $json['form'] = $form;
        
        //$this->model_checkout_order->addOrderHistory($order_id, 1, 'Pending Payment', false);

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
        
        /**
         * calculate fort signature
         * @param array $arr_data
         * @param sting $sign_type request or response
         * @return string fort signature
         */
        private function _calculateSignature($arr_data, $sign_type = 'request') {

            $shaString = '';

            ksort($arr_data);
            foreach ($arr_data as $k=>$v){
                $shaString .= "$k=$v";
            }

            if($sign_type == 'request') {
                $shaString = $this->config->get('payfort_fort_entry_request_sha_phrase') . $shaString . $this->config->get('payfort_fort_entry_request_sha_phrase');
            }
            else{
                $shaString = $this->config->get('payfort_fort_entry_response_sha_phrase') . $shaString . $this->config->get('payfort_fort_entry_response_sha_phrase');
            }
            $signature = hash($this->config->get('payfort_fort_entry_hash_algorithm') ,$shaString);

            return $signature;
        }
        
        /**
         * Convert Amount with dicemal points
         * @param decimal $amount
         * @param decimal $currency_value
         * @param string  $currency_code
         * @return decimal
         */
        private function _convertFortAmount($amount, $currency_value, $currency_code) {
            $new_amount = 0;
            //$decimal_points = $this->currency->getDecimalPlace();
            $decimal_points = $this->getCurrencyDecimalPoints($currency_code);
            $new_amount = round($amount * $currency_value, $decimal_points) * (pow(10, $decimal_points));
            return $new_amount;
        }
        
        private function _getUrl($path) {
            $url = $this->url->link($path, '', 'SSL');
            return $url;
        }
        
        /**
         * 
         * @param string $currency
         * @param integer 
         */
        private function getCurrencyDecimalPoints($currency) {
            $decimalPoint  = 2;
            $arrCurrencies = array(
                'JOD' => 3,
                'KWD' => 3,
                'OMR' => 3,
                'TND' => 3,
                'BHD' => 3,
                'LYD' => 3,
                'IQD' => 3,
            );
            if (isset($arrCurrencies[$currency])) {
                $decimalPoint = $arrCurrencies[$currency];
            }
            return $decimalPoint;
        }
}

