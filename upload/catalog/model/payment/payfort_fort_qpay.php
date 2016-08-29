<?php

require_once DIR_SYSTEM . '/library/payfortFort/init.php';

class ModelPaymentPayfortFortQpay extends Model
{

    public $pfConfig;
    public $pfHelper;

    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->pfConfig = Payfort_Fort_Config::getInstance();
        $this->pfHelper = Payfort_Fort_Helper::getInstance();
    }

    public function getMethod($address, $total)
    {
        $this->language->load('payment/payfort_fort');
        $enabled = $this->config->get('payfort_fort_naps');

        $status = true;

        if (!$enabled) {
            $status = false;
        }

        $frontCurrency = $this->pfHelper->getFrontCurrency();
        $baseCurrency  = $this->pfHelper->getBaseCurrency();
        $currency      = $this->pfHelper->getFortCurrency($baseCurrency, $frontCurrency);
        if ($currency != 'QAR') {
            return false;
        }

        $method_data = array();

        if ($status) {
            $method_data = array(
                'code'       => PAYFORT_FORT_PAYMENT_METHOD_NAPS,
                'title'      => $this->language->get('text_naps'),
                'sort_order' => $this->config->get('payfort_fort_qpay_sort_order'),
                'terms'      => ''
            );
        }

        return $method_data;
    }

}

?>