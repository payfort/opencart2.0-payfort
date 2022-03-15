<?php 
if(isset($tokenization_view)){
    echo $tokenization_view;
}
?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div> 
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function () {
    var checkout_data = {};
    var aps_token     = $('input[name="aps_payment_token_cc"]:checked');
    if( aps_token.length == 1 ) {
      checkout_data.aps_payment_token_cc = aps_token.val();
    }
    $.ajax({
        url: 'index.php?route=extension/payment/<?php echo $payment_method;?>/send',
        type: 'post',
        dataType: 'json',
        data: checkout_data,
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
                $('#frm_payfort_fort_payment input[type=submit]').click();
            }

            else{
                alert('<?php echo $text_general_error; ?>');
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n");
        }
    });
});
//--></script>
