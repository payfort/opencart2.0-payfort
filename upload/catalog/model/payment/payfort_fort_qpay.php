<?php 
class ModelPaymentPayfortFortQpay extends Model {
	public function getMethod($address, $total) {
		$this->language->load('payment/payfort_fort');
                $naps_enabled = $this->config->get('payfort_fort_naps');
                
                $status = true;
                
                if(!$naps_enabled) {
                    $status = false;
                }
                
                $method_data = array();
                
                if($status) {
                    $method_data = array(
                            'code'       => 'payfort_fort_qpay',
                            'title'      => $this->language->get('text_naps'),
                            'sort_order' => $this->config->get('payfort_fort_qpay_sort_order'),
                            'terms'      => ''
                    );
                }
                
                return $method_data;
	}
}
?>