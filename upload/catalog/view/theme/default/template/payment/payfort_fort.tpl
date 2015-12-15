<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function () {
        $.ajax({
            url: 'index.php?route=payment/payfort_fort/send',
            type: 'post',
            data: {SADAD:$('#payfort_sadad').is(':checked'), NAPS:$('#payfort_naps').is(':checked')},
            dataType: 'json',
            beforeSend: function () {
                $('#button-confirm').attr('disabled', true);
            },
            complete: function () {
                $('#button-confirm').attr('disabled', false);
                $('.attention').remove();
            },
            success: function (json) {

                if (json['form']) {
                    $('body').append(json['form']);
                    $('#payfortpaymentform input[type=submit]').click();
                }
                
                else{
                    showError('An error occured, please try again later.');
                }
            }
        });
    });

function showError(msg){
    $('input[name="payment_method"][value="payfort_fort"]').parent().parent().find('td:last-child').append("<span class='error'><br/>Card declined. Please use another card<span>");
    $('#payment-method>.checkout-heading').find('a:first-child').trigger('click');
}
//--></script>
