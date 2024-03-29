<form id="frm_payfort_fort_payment" class="payfort-fort-confirmation-form form-horizontal" method="POST" action="">
<section id="request_otp_sec" class="valu_form active">
    <?php if($amazon_ps_valu_down_payment_status){ ?>
    <div class="valu_optional">
        <div class="aps col-sm-4 aps-pad-none">
            <span><?php echo $enter_valu_downpayment; ?></span>
        </div>
        <div class="aps col-sm-4 aps-pad-none">
            <input type="text" value="<?php echo $amazon_ps_valu_down_payment_value ?>" autocomplete="off" maxlength="19" id="valu_down" name="valu_down" class="input-text aps_valu_down_payment onlynum" />
        </div>
    </div>
    <?php }?>
    <div class="valu_optional">
        <div class="aps col-sm-4 aps-pad-none">
            <span><?php echo $enter_valu_tou; ?></span>
        </div>
        <div class="aps col-sm-4 aps-pad-none">
            <input type="text" value="0" autocomplete="off" maxlength="19" id="valu_tou" name="valu_tou" class="input-text aps_valu_tou onlynum" />
        </div>
    </div>
    <div class="valu_optional">
        <div class="aps col-sm-4 aps-pad-none">
            <span><?php echo $enter_valu_cashback; ?></span>
        </div>
        <div class="aps col-sm-4 aps-pad-none">
            <input type="text" value="0" autocomplete="off" maxlength="19" id="valu_cashback" name="valu_cashback" class="input-text aps_valu_cashback onlynum" />
        </div>
    </div>
    <div class="aps-row">
        <div class="aps col-sm-1 aps-pad-none">
            <span class="country_code"><?php echo $country_code; ?></span>
        </div>
        <div class="aps col-sm-8 aps-pad-none">
            <input type="text" value="" autocomplete="off" maxlength="19" placeholder="<?php echo $text_field_mobile_no; ?>" class="input-text aps_valu_mob_number onlynum" />
        </div>
        <div class="buttons">
          <div class="pull-right">
            <button type="button" class="valu_customer_verify btn btn-primary"><?php echo $button_request_otp; ?></button>
          </div>
        </div>
    </div>
</section>

<section id="verfiy_otp_sec" class="valu_form">
    <div class="otp_generation_msg aps_success"></div>
    <div class="aps-row">
        <div class="aps col-sm-9 aps-pad-none">
            <input type="password" class="form-control no-outline input-text aps_valu_otp" placeholder="<?php echo $text_field_otp; ?>" onKeyPress="return keyLimit(this,10)" autocomplete="off"/>
        </div>
    </div>
</section>

<section id="tenure_sec" class="valu_form">
    <input type="hidden" id="aps_active_tenure" name="active_tenure" />
    <input type="hidden" id="aps_tenure_amount" name="tenure_amount" />
    <input type="hidden" id="aps_tenure_interest" name="tenure_interest" />
    <input type="hidden" id="aps_otp" name="otp" />
    <p id="aps_valu_otp_field" class="form-row">
        <div class="install-line"><?php echo $text_valu_select_plan; ?></div>
        <div class="tenure">
        </div>
        <div class="termRow mt-1">
            <input type="checkbox" name="valu_terms" id="valu_terms" /><?php echo $text_valu_agree; ?>
        </div>
        <div class="tenure_term_error aps_error"></div>
    </p>
</section>
<label class="valu_process_error aps_error"></label>

<div class="aps-loader-background" id="div-aps-loader" style="display:none">
    <div class="loader">
         <i class="fa fa-spinner fa-spin pf-iframe-spin"></i>
    </div>
</div>

<div class="buttons">
    <div class="pull-right">
        <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
    </div>
</div>
</form>
<script type="text/javascript"><!--
    var amazon_ps_error_js_msg = [];
    <?php echo $amazon_ps_error_js_msg; ?>
    var language = '<?php echo $language; ?>';
            //--></script> 
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function () {
        $( '#div-aps-loader' ).show();
        AmazonPSCall.makePayment('amazon_ps_valu', '');
    });
//--></script>

<script type="text/javascript" src="catalog/view/javascript/amazon_ps/amazon_ps_checkout.js"/>
<script type="text/javascript" src="catalog/view/javascript/amazon_ps/slick.js"/>

<style>
/* Valu CSS */

.aps-loader-background{
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

.loader {
    position: relative;
    left: 50%;
    top: 50%;
    border: 0px;
    width: 50px;
    height: 50px;
    -webkit-animation: spin 2s linear infinite; /* Safari */
    animation: spin 2s linear infinite;
}
.loader .fa {
    font-size : 40px;
}

.valu_form:not(.active) {
    display: none;
}
section.valu_form {
    overflow: hidden;
}

.tenure_carousel .tenureBox {
    text-align: center;
    border: 1px solid #ccc;
    margin: 0 5px;
    border-radius: 3px;
    padding: 10px 0;
}
.tenure_carousel .tenureBox p {
    margin-bottom: 5px;
}
.tenure_carousel .tenureBox p.int_rate {
    color: #43bad4;
}
.tenure_carousel .tenure-carousel-left-arr,.tenure_carousel .tenure-carousel-right-arr {
    position: absolute;
    height: 100%;
    display: flex;
    align-items: center;
    top: 0;
    font-size:25px;
    opacity: 0.7;
}
.tenure_carousel .tenure-carousel-left-arr {
    left:0px;
}
.tenure_carousel .tenure-carousel-right-arr {
    right:0px;
}
.tenure_carousel .slick-list {
    width:90%;
    margin:auto;
}
.tenure_carousel .slick-disabled {
    opacity: 0.3;
}

.tenureBox.selected {
    border: 2px solid #78cee1;
}


.valu_form .input-text {
    width: 100%;
    line-height: 1.25 !important;
    padding: .5rem 1rem !important;
    height: 35px;
}
.valu_form .aps-btn {
    width: 100%;
    font-size: 13px;
    display: flex;
    font-weight: 400;
    height: 35px;
    line-height: inherit;
    text-decoration: none;
    justify-content: center;
    align-items: center;
    padding: 0px;
}
.valu_form .aps-pad-none {
    padding:0;
}
.valu_form span.country_code {
    height: 35px;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid #f5f5f5;
    padding: 5px 10px;
    background-color: #f5f5f5;
    border-color: #c7c1c6;
    border-top-color: #bbb3b9;
}

@-webkit-keyframes rotateValuLoader {
    /* 100% keyframe for  clockwise.
       use 0% instead for anticlockwise */
    100% {
      -webkit-transform: rotate(360deg);
    }
}
div.aps_error,
label.aps_error {
    color: red;
    font-weight: 500;
}

.slick-slider
{
    position: relative;

    display: block;
    box-sizing: border-box;

    -webkit-user-select: none;
       -moz-user-select: none;
        -ms-user-select: none;
            user-select: none;

    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
        touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}

.slick-list
{
    position: relative;

    display: block;
    overflow: hidden;

    margin: 0;
    padding: 0;
}
.slick-list:focus
{
    outline: none;
}
.slick-list.dragging
{
    cursor: pointer;
    cursor: hand;
}

.slick-slider .slick-track,
.slick-slider .slick-list
{
    -webkit-transform: translate3d(0, 0, 0);
       -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
         -o-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
}

.slick-track
{
    position: relative;
    top: 0;
    left: 0;

    display: block;
    margin-left: auto;
    margin-right: auto;
}
.slick-track:before,
.slick-track:after
{
    display: table;

    content: '';
}
.slick-track:after
{
    clear: both;
}
.slick-loading .slick-track
{
    visibility: hidden;
}

.slick-slide
{
    display: none;
    float: left;

    height: 100%;
    min-height: 1px;
}
[dir='rtl'] .slick-slide
{
    float: right;
}
.slick-slide img
{
    display: block;
}
.slick-slide.slick-loading img
{
    display: none;
}
.slick-slide.dragging img
{
    pointer-events: none;
}
.slick-initialized .slick-slide
{
    display: block;
}
.slick-loading .slick-slide
{
    visibility: hidden;
}
.slick-vertical .slick-slide
{
    display: block;

    height: auto;

    border: 1px solid transparent;
}
.slick-arrow.slick-hidden {
    display: none;
}

.valu_optional{
    width:100%;
    display: grid;
}


</style>