<?php if($payfort_fort_cc_integration_type == "redirection"): ?>
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
                showError('<?php echo $text_general_error;?>');
            }
        }
    });
});

function showError(msg){
    $('input[name="payment_method"][value="payfort_fort"]').parent().parent().find('td:last-child').append("<span class='error'><br/><?php echo $text_error_card_decline;?><span>");
    $('#payment-method>.checkout-heading').find('a:first-child').trigger('click');
}
//--></script>

<?php else: //display iframe?>

<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>

<form style="display:none" name="payfort_payment_form" id="payfort_payment_form" method="post">
    <?php foreach ($merchant_page_data['params'] as $k => $v): ?>
        <input type="hidden" name="<?php echo $k?>" value="<?php echo $v?>">
    <?php endforeach; ?>
</form>

<div class="pf-iframe-background" id="div-pf-iframe" style="display:none">
<div class="pf-iframe-container">
    <span class="pf-close-container">
    <i class="fa fa-times-circle pf-iframe-close" onclick="pfClosePopup()"></i>
    </span>
    <i class="fa fa-spinner fa-spin pf-iframe-spin"></i>
    <div class="pf-iframe" id="pf_iframe_content">
    </div>
</div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function () {
    if($("#payfort_merchant_page").size()) {
        $( "#payfort_merchant_page" ).remove();
    }
    $('<iframe  name="payfort_merchant_page" id="payfort_merchant_page"height="550px" frameborder="0" scrolling="no" onload="pfIframeLoaded(this)" style="display:none"></iframe>').appendTo('#pf_iframe_content');
    $('.pf-iframe-spin').show();
    $('.pf-iframe-close').hide();
    $( "#payfort_merchant_page" ).attr("src", "<?php echo $merchant_page_data['url']?>");
    $( "#payfort_payment_form" ).attr("action","<?php echo $merchant_page_data['url']?>");
    $( "#payfort_payment_form" ).attr("target","payfort_merchant_page");
    $( "#payfort_payment_form" ).submit();
    //fix for touch devices
    if (fn_payfort_fort_is_touch_device()) {
        setTimeout(function() {
            $("html, body").animate({ scrollTop: 0 }, "slow");
        }, 1);
    }
    $( "#div-pf-iframe" ).show();
});
function pfClosePopup() {
    $( "#div-pf-iframe" ).hide();
    $( "#payfort_merchant_page" ).remove();
    window.location = 'index.php?route=payment/payfort_fort/merchantPageCancel';
}
function pfIframeLoaded(ele) {
    $('.pf-iframe-spin').hide();
    $('.pf-iframe-close').show();
    $('#payfort_merchant_page').show();
}
function fn_payfort_fort_is_touch_device() {
  return 'ontouchstart' in window        // works on most browsers 
      || navigator.maxTouchPoints;       // works on IE10/11 and Surface
}
//--></script>
<?php endif; ?>
<style>
.pf-iframe-background{
    position: fixed;
    z-index: 999;
    width: 100%;
    height: 100%;
    text-align: center;
    top: 0;
    left: 0;
    background: rgba(0,0,0,0.8);
    z-index: 99999
}
.pf-iframe-container{
    position: relative;
    z-index: 99999999
}
iframe#payfort_merchant_page {
    width:80% !important;
    min-height:100% !important;
}
.pf-close-container{
    display:block;
    text-align:center;
    margin:1em auto;
}
.pf-iframe-close{
    font-size: 1.7em;
    color: #fff;
    cursor: pointer
}
.pf-iframe-spin{
    font-size: 3em;
    color: #fff;
    display: block;
    margin: 1em auto;
    cursor: default
}
</style>
