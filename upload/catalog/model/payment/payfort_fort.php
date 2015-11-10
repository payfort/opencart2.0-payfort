<?php 
class ModelPaymentPayfortFort extends Model {
	public function getMethod($address, $total) {
		$this->language->load('payment/payfort_fort');

			$method_data = array(
				'code'       => 'payfort_fort',
				'title'      => $this->language->get('text_title'),
                'terms'      => '',
				'sort_order' => $this->config->get('payfort_fort_sort_order')
			);


		return $method_data;
	}
}
?>