<?php 
class ModelPaymentPayfortFortSadad extends Model {
	public function getMethod($address, $total) {
		$this->language->load('payment/payfort_fort');
                $sadad_enabled = $this->config->get('payfort_fort_sadad');
                
                $status = true;
                
                if(!$sadad_enabled) {
                    $status = false;
                }
                
                $method_data = array();
                
                if($status) {
                    $method_data = array(
                            'code'       => 'payfort_fort_sadad',
                            'title'      => $this->language->get('text_sadad'),
                            'sort_order' => $this->config->get('payfort_fort_sadad_sort_order'),
                            'terms'      => ''
                    );
                }
                
                return $method_data;
	}
}
?>