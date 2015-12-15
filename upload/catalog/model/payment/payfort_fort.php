<?php 
class ModelPaymentPayfortFort extends Model {
	public function getMethod($address, $total) {
		$this->language->load('payment/payfort_fort');
            $sadad_enabled = $this->config->get('payfort_fort_sadad');
            $naps_enabled = $this->config->get('payfort_fort_naps');
            $credit_card_enabled = $this->config->get('payfort_fort_credit_card');
            $extra_options = '<script>';
            if ($sadad_enabled){
                $extra_options .= '$("input[value=payfort_fort]").closest("div").after(\'<div class="radio"><label><input type="radio" name="payment_method" value="payfort_fort" id="payfort_sadad"> SADAD</div>\')';
            }
            // if ($naps_enabled){
                // $extra_options .= ';$("input[value=payfort_fort]").eq(0).closest("div").after(\'<div class="radio"><label><input type="radio" name="payment_method" value="payfort_fort" id="payfort_naps"> NAPS</div>\')';
            // }
            if (!$credit_card_enabled){
                $extra_options .= ';$("[value=payfort_fort]").eq(0).parent().parent().remove()';
            }
            $extra_options .= '</script>';
			$method_data = array(
				'code'       => 'payfort_fort',
				'title'      => $this->language->get('text_title') . $extra_options,
				'sort_order' => $this->config->get('payfort_fort_sort_order'),
                'terms'      => ''
			);

		return $method_data;
	}
}
?>