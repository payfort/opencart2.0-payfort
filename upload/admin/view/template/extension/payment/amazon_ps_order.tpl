<h2><?php //echo $text_payment_info; ?></h2>
<div class="alert alert-success" id="amazon_ps_transactions-msg" style="display:none;"></div>
<div class="text-center"><strong>Capture/Void Authorization & Refund</strong></div>
  <table class="table table-striped table-bordered">
    <tr>
    	<td><?php echo $text_order_total; ?></td>
    	<td><?php echo $formatted_order_total; ?></td>
    </tr>
  <?php if ($is_authorization ) {?>
    <tr>
    	<td><?php echo $text_total_capture; ?></td>
    	<td id="amazon_ps_total_captured"><?php echo $formatted_total_captured; ?></td>
    </tr>
      <tr>
      <td><?php echo $text_remaining_capture; ?></td>
      <td id="amazon_ps_remaining_captured"><?php echo $formatted_remain_capture; ?></td>
    </tr>
    <tr>
      <td><?php echo $text_void; ?></td>
      <td id="amazon_ps_total_void"><?php echo $formatted_total_void; ?></td>
    </tr>
    <?php if ($total_void == 0 and $remain_capture > 0 ) {?>
      <tr>
      	<td><?php echo $text_capture; ?></td>
      	<td id="capture_status">
    			  <input type="text" width="10" id="capture-amount" value="<?php echo $remain_capture; ?>"/>
    			  <a class="button btn btn-primary" id="button-capture"><?php echo $button_capture; ?></a>
    			  <span class="btn btn-primary" id="loading-capture" style="display:none;"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i></span>
        </td>
      </tr>
    <?php } ?>
    <?php if ($total_void == 0 and $total_captured == 0 ) {?>
      <tr>
        <td><?php echo $text_void; ?></td>
        <td id="void_status">            
              <input type="text" width="10" id="void-amount" value="<?php echo $order_total; ?>" style="display:none;"/>
              <a class="button btn btn-primary" id="button-void"><?php echo $button_void; ?></a>
              <span class="btn btn-primary" id="loading-void" style="display:none;"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i></span>          
        </td>
      </tr>
    <?php } ?>
  <?php } ?>
  <?php if ($payment_method != 'amazon_ps_knet' ) {?>
  <tr>
   <td><?php echo $text_refundable; ?></td>
   <td><?php echo $formatted_total_refundable; ?></td>
  </tr>
  <tr>
   <td><?php echo $text_refunded; ?></td>
   <td><?php echo $formatted_total_refunded; ?></td>
  </tr>
  <tr>
	<td><?php echo $text_refund; ?></td>
	<td id="refund_status">
	  <?php if ($total_refundable > 0 ) {?>
		  <input type="text" width="10" id="refund-amount" value="<?php echo $total_refundable; ?>"/>
			  <a class="button btn btn-primary" id="button-refund"><?php echo $button_refund; ?></a>
		  <span class="btn btn-primary" id="loading-refund" style="display: none;"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i></span>
	  <?php } ?>
	</td>
  </tr>
  <?php } ?>
  <tr>
	<td><?php echo $text_transactions; ?>:</td>
	<td>
	  <table class="table table-striped table-bordered" id="amazon_ps_transactions">
		<thead>
		  <tr>
			<td class="text-left"><strong><?php echo $text_column_date; ?></strong></td>
			<td class="text-left"><strong><?php echo $text_column_type; ?></strong></td>
			<td class="text-left"><strong><?php echo $text_column_amount; ?></strong></td>
		  </tr>
		</thead>
		<tbody>
		  <?php foreach ($transaction_history as $transaction ) {?>
			  <tr>
				<td class="text-left"><?php echo $transaction['date_added']; ?></td>
				<td class="text-left"><?php echo $transaction['meta_key']; ?></td>
				<td class="text-left"><?php echo $transaction['meta_value']; ?></td>
			  </tr>
		  <?php } ?>
		</tbody>
	  </table>
	</td>
  </tr>
</table>
<div class="text-center"><strong>APS Payment Information</strong></div>
<table class="table table-striped table-bordered" border="1px">
  <thead>
    <tr>
      <td class="text-left"><strong><?php echo $text_column_title; ?></strong></td>
      <td class="text-left"><strong><?php echo $text_column_value; ?></strong></td>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($order_extra_data as $data ) {?>
      <tr>
        <td class="text-left"><?php echo $data['label']; ?></td>
        <td class="text-left"><?php echo $data['value']; ?></td>      
      </tr>
    <?php } ?>
  </tbody>
</table>

<script type="text/javascript"><!--
    $("#button-capture").click(function () {
      if (confirm('<?php echo $text_confirm_capture; ?>')) {
        $.ajax({
          type: 'POST',
          dataType: 'json',
          data: {'order_id': '<?php echo $order_id; ?>', 'amount': $('#capture-amount').val(),
          'payment_method':'<?php echo $payment_method; ?>'},
          url: 'index.php?route=extension/payment/amazon_ps/capture&token=<?php echo $token; ?>',
          beforeSend: function () {
            $('#button-capture').hide();
            $('#capture-amount').hide();
            $('#loading-capture').show();
            $('#amazon_ps_transactions-msg').hide();

            $('#button-void').hide();
            $('#void-amount').hide();
            $('#button-refund').hide();
          },
          success: function (data) {
            if (data.error == false) {
              var html = '';
              html += '<tr>';
              html += '<td class="text-left">' + data.data.date_added + '</td>';
              html += '<td class="text-left">' + data.data.meta_key + '</td>';
              html += '<td class="text-left">' + data.data.meta_value + '</td>';
              html += '</tr>';

              $('#amazon_ps_transactions').prepend(html);
              $('#amazon_ps_total_captured').text(data.data.formatted_total_captured);
              $('#amazon_ps_remaining_captured').text(data.data.formatted_remain_capture);
              $('#amazon_ps_total_void').text(data.data.formatted_total_void);

              $('#button-capture, #capture-amount').show();
              $('#capture-amount').val(data.data.remain_capture);
              

              if (data.msg != '') {
                $('#amazon_ps_transactions-msg').empty().html('<i class="fa fa-check-circle"></i> ' + data.msg).fadeIn();
              }

              $('#button-refund').show();
              $('#refund-amount').val(0.00).show();
            }
            if (data.error == true) {
              alert(data.msg);
              $('#button-capture').show();
              $('#capture-amount').show();
              $('#button-void').show();
              $('#button-refund').show();
            }

            $('#loading-capture').hide();
            url = 'index.php?route=sale/order/info&order_id=<?php echo $order_id; ?>&token=<?php echo $token; ?>';
            window.top.location.href = url;
          }
        });
      }
    });

    $("#button-void").click(function () {
      if (confirm('<?php echo $text_confirm_void; ?>')) {
        $.ajax({
          type: 'POST',
          dataType: 'json',
          data: {'order_id': '<?php echo $order_id; ?>', 'amount': $('#void-amount').val(),
          'payment_method':'<?php echo $payment_method; ?>'},
          url: 'index.php?route=extension/payment/amazon_ps/void&token=<?php echo $token; ?>',
          beforeSend: function () {
            $('#button-void').hide();
            $('#void-amount').hide();
            $('#loading-void').show();
            $('#amazon_ps_transactions-msg').hide();

            $('#button-capture').hide();
            $('#capture-amount').hide();
            $('#button-refund').hide();
          },
          success: function (data) {
            if (data.error == false) {
              var html = '';
              html += '<tr>';
              html += '<td class="text-left">' + data.data.date_added + '</td>';
              html += '<td class="text-left">' + data.data.meta_key + '</td>';
              html += '<td class="text-left">' + data.data.meta_value + '</td>';
              html += '</tr>';

              $('#amazon_ps_transactions').prepend(html);
              $('#amazon_ps_total_captured').text(data.data.formatted_total_captured);
              $('#amazon_ps_remaining_captured').text(data.data.formatted_remain_capture);
              $('#amazon_ps_total_void').text(data.data.formatted_total_void);

              if (data.msg != '') {
                $('#amazon_ps_transactions-msg').empty().html('<i class="fa fa-check-circle"></i> ' + data.msg).fadeIn();
              }

              $('#button-refund').hide();
              $('#refund-amount').val(0.00).hide();
            }
            if (data.error == true) {
              alert(data.msg);
              $('#button-capture').show();
              $('#capture-amount').show();
              $('#button-void').show();
              $('#button-refund').show();
            }

            $('#loading-void').hide();
            url = 'index.php?route=sale/order/info&order_id=<?php echo $order_id; ?>&token=<?php echo $token; ?>';
            window.top.location.href = url;
          }
        });
      }
    });

    $("#button-refund").click(function () {
      if (confirm('<?php echo $text_confirm_refund; ?>')) {
        $.ajax({
          type: 'POST',
          dataType: 'json',
          data: {'order_id': '<?php echo $order_id; ?>', 'amount': $('#refund-amount').val(), 'payment_method':'<?php echo $payment_method; ?>'},
          url: 'index.php?route=extension/payment/amazon_ps/refund&token=<?php echo $token; ?>',
          beforeSend: function () {
            $('#button-refund').hide();
            $('#refund-amount').hide();
            $('#loading-refund').show();
            $('#amazon_ps_transactions-msg').hide();

            $('#button-void').hide();
            $('#button-capture').hide();
          },
          success: function (data) {
            if (data.error == false) {
              var html = '';
              html += '<tr>';
              html += '<td class="text-left">' + data.data.date_added + '</td>';
              html += '<td class="text-left">' + data.data.meta_key + '</td>';
              html += '<td class="text-left">' + data.data.meta_value + '</td>';
              html += '</tr>';

              $('#amazon_ps_transactions').prepend(html);
              $('#amazon_ps_total_captured').text(data.data.formatted_total_captured);
              $('#amazon_ps_remaining_captured').text(data.data.formatted_remain_capture);
              $('#amazon_ps_total_void').text(data.data.formatted_total_void);

              if (data.msg != '') {
                $('#amazon_ps_transactions-msg').empty().html('<i class="fa fa-check-circle"></i> ' + data.msg).fadeIn();
              }

              $('#button-refund').show();
              $('#button-capture').show();
              $('#refund-amount').val(0.00).hide();
            }
            if (data.error == true) {
              alert(data.msg);
              $('#button-refund').show();
              $('#button-capture').show();
              $('#capture-amount').show();
              $('#button-void').show();
            }

            $('#loading-refund').hide();
            url = 'index.php?route=sale/order/info&order_id=<?php echo $order_id; ?>&token=<?php echo $token; ?>';
            window.top.location.href = url;
          }
        });
      }
    });
//--></script>
