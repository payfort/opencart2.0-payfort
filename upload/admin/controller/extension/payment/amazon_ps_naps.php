<?php
class ControllerExtensionPaymentAmazonPSNaps extends Controller {
	private $error = array();
	public function order(){

		/*$this->load->library('amazonpsconstant');*/
		$this->load->language('extension/payment/amazon_ps');
		$orderId = (int)$this->request->get['order_id'];
		$paymentMethod = AmazonPSConstant::AMAZON_PS_PAYMENT_METHOD_NAPS;

		$this->load->model('extension/payment/amazon_ps');
        $data = $this->model_extension_payment_amazon_ps->getOrderData($orderId, $paymentMethod);
        $response  = $this->model_extension_payment_amazon_ps->getLanguageVar();
        $data      = array_merge($data, $response);
		$data['order_id'] = $orderId;
		$data['token'] = $this->session->data['token'];
		$data['payment_method'] =$paymentMethod;
		return $this->load->view('extension/payment/amazon_ps_order', $data);
	}
}
?>