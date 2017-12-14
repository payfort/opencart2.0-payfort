<?php
require_once DIR_SYSTEM . '/library/payfortFort/init.php';

class ControllerPaymentPayfortFortInstallments extends Controller {

    public $paymentMethod;
    public $integrationType;
    public $pfConfig;
    public $pfPayment;

    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->pfConfig        = Payfort_Fort_Config::getInstance($registry);
        $this->pfPayment       = Payfort_Fort_Payment::getInstance($registry);
        $this->integrationType = $this->pfConfig->getInstallmentsIntegrationType();
        $this->paymentMethod   = PAYFORT_FORT_PAYMENT_METHOD_INSTALLMENTS;
    }
    
    public function index() {
        $this->language->load('payment/payfort_fort');
        $data['button_confirm'] = $this->language->get('button_confirm');
        $data['text_general_error']  = $this->language->get('text_general_error');
        $data['text_error_card_decline'] = $this->language->get('text_error_card_decline');
        
        $data['payfort_fort_installments_integration_type'] = $this->integrationType;
        $this->load->model('payment/payfort_fort_installments');
        $data['payment_request_params'] = '';
        $template = 'payfort_fort_installments.tpl';
        if ($this->integrationType == PAYFORT_FORT_INTEGRATION_TYPE_MERCAHNT_PAGE) {
            $template                             = 'payfort_fort_merchant_page.tpl';
            $data['payment_request_params'] = $this->pfPayment->getPaymentRequestParams($this->paymentMethod, $this->integrationType);
        }
        
        
        if (version_compare(VERSION, '2.2.0.0') >= 0) {
            //$this->template = 'payment/payfort_fort_installments.tpl';
            $this->template = 'payment/'.$template;
        }
        else{
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/' . $template)) {
                $this->template = $this->config->get('config_template') . '/template/payment/' . $template;
            } else {
                $this->template = 'default/template/payment/' . $template;
            }
        }
        return $this->load->view($this->template, $data);

    }
    
    public function send()
    {
        $form = $this->pfPayment->getPaymentRequestForm($this->paymentMethod);

        $json = array('form' => $form);
        $this->response->setOutput(json_encode($json));
    }

    public function response()
    {
        $this->_handleResponse('offline');
    }

    public function responseOnline()
    {
        $this->_handleResponse('online');
    }

    public function merchantPageResponse()
    {
        $this->_handleResponse('online', $this->integrationType);
    }

    private function _handleResponse($response_mode = 'online', $integration_type = PAYFORT_FORT_INTEGRATION_TYPE_REDIRECTION)
    {
        $response_params = array_merge($this->request->get, $this->request->post); //never use $_REQUEST, it might include PUT .. etc

        $success = $this->pfPayment->handleFortResponse($response_params, $response_mode, $integration_type);
        if ($success) {
            $redirectUrl = 'payment/payfort_fort/success';
        }
        else {
            $redirectUrl = 'checkout/checkout';
        }
        header('location:' . $this->url->link($redirectUrl));
    }
}

