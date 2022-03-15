<form id="frm_payfort_fort_payment" class="payfort-fort-confirmation-form form-horizontal" method="POST" action="">
    <div id="amazon_ps_installments_form">
        <fieldset>
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
                <?php 
                    if(isset($tokenization_view)){
                        echo $tokenization_view;
                    }
                ?>
            </div>
            <div class="col-sm-1"></div>
        </fieldset>
        <fieldset class="aps_hosted_form">
            <div class="form-group required">
                <label class="col-sm-2 control-label" for="aps_card_number"><?php echo $text_card_number; ?></label>
                <div class="col-sm-10 card-row">
                    <input type="text" id="aps_card_number" name="card_number" value="" placeholder="<?php echo $text_card_number; ?>" class="form-control aps_card_number onlynum" autocomplete="off" maxlength="19" />
                    <?php echo $card_inline_icon; ?>
                    <label class="aps_error aps_card_error"></label>
                </div>                
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="aps_card_holder_name"><?php echo $text_card_holder_name; ?></label>
                <div class="col-sm-10">
                    <input type="text" id="aps_card_holder_name" name="card_holder_name" value="" placeholder="<?php echo $text_card_holder_name; ?>" class="form-control aps_card_holder_name" autocomplete="off" maxlength="50" />
                    <label class="aps_error aps_card_name_error"></label>
                </div>                
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="aps_expiry_month"><?php echo $text_expiry_date; ?></label>
                <div class="col-sm-5">
                    <!---<select id="aps_expiry_month" class="form-control aps_expiry_month">
                        {% for month in months %}
                        <option value="<?php echo $month.value; ?>"><?php echo $month.value; ?>-<?php echo $month.text; ?></option>
                        {% endfor %}
                    </select>--->
                    <input id="aps_expiry_month" type="text" value="" autocomplete="off" maxlength="2" placeholder="MM" class="form-control input-text aps_expiry_month onlynum" size="2" />
                </div>
                <div class="col-sm-5">
                    <!---<select id="aps_expiry_year" class="form-control aps_expiry_year">
                        {% for year in year_expire %}
                        <option value="<?php echo $year.value; ?>"><?php echo $year.text; ?></option>
                        {% endfor %}
                    </select>-->
                    <input id="aps_expiry_year" type="text" autocomplete="off" maxlength="2" placeholder="YY"  class="form-control input-text aps_expiry_year onlynum" size="2" />
                </div>
                <input type="hidden" id="payfort_fort_expiry" name="expiry_date"/>
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <label class="aps_error aps_card_expiry_error"></label>
                </div>
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="aps_card_security_code"><span data-toggle="tooltip" title="<?php echo $help_cvc_code; ?>"><?php echo $text_cvc_code; ?></span></label>
                <div class="col-sm-10">
                    <input type="text" id="aps_card_security_code" name="aps_card_security_code" value="" placeholder="<?php echo $text_cvc_code; ?>" class="form-control aps_card_security_code onlynum" autocomplete="off" size="3" maxlength="4"  />
                    <label class="aps_error aps_card_cvv_error"></label>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <?php if ($is_enabled_tokenization == 1 and $has_recurring_products == 0 ){ ?>
                    <div class="radio">
                        <label>
                            <input type="checkbox" name="aps_card_remember_me" class="aps_card_remember_me input-checkbox" checked/>
                            <?php echo $remember_me; ?>
                        </label>
                    </div>
                    <?php } ?>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </fieldset>
    </div>
    <input type="hidden" id="aps_installment_plan_code" name="aps_installment_plan_code" />
    <input type="hidden" id="aps_installment_issuer_code" name="aps_installment_issuer_code" />
    <input type="hidden" id="aps_installment_confirmation_en" name="aps_installment_confirmation_en" />
    <input type="hidden" id="aps_installment_confirmation_ar" name="aps_installment_confirmation_ar" />

    <input type="hidden" id="aps_installment_interest" name="aps_installment_interest" />
    <input type="hidden" id="aps_installment_amount" name="aps_installment_amount" />

    <div id="installment_plans">
        <div class="issuer_info"></div>
        <div class="plans"></div>
        <label class="aps_error aps_plan_error"></label>
        <div class="plan_info"></div>
    </div>
</form>
<div class="buttons">
    <div class="pull-right">
        <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" data-loading-text="Loading..."/>
    </div>
</div>
<div class="aps-loader-background" id="div-aps-loader" style="display:none">
    <div class="loader">
         <i class="fa fa-spinner fa-spin pf-iframe-spin"></i>
    </div>
</div>
<script type="text/javascript"><!--
    var amazon_ps_error_js_msg = [];
    <?php echo $amazon_ps_error_js_msg; ?>
    var mada_bins = '<?php echo $mada_bins; ?>';
    var meeza_bins = '<?php echo $meeza_bins; ?>';
    var has_recurring_products = '<?php echo $has_recurring_products; ?>';
            //--></script> 
             
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function () {
        AmazonPSCall.makePayment('amazon_ps_installments', 'hosted_checkout');
    });
//--></script>

<script type="text/javascript" src="catalog/view/javascript/amazon_ps/amazon_ps_checkout.js"/>
<script type="text/javascript" src="catalog/view/javascript/amazon_ps/slick.js"/>
<style>

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

input.field-error {
    border: 2px solid red !important;
}

/* Carousel CSS */
.emi_carousel .emi_box {
    text-align: center;
    border: 1px solid #ccc;
    margin: 0 5px;
    border-radius: 3px;
    padding: 10px 0;
}
.emi_carousel .emi_box p {
    margin-bottom: 5px;
}
.emi_carousel .emi_box p.int_rate {
    color: #43bad4;
}
.emi_carousel .emi-carousel-left-arr,.emi_carousel .emi-carousel-right-arr {
    position: absolute;
    height: 100%;
    display: flex;
    align-items: center;
    top: 0;
    font-size:25px;
    opacity: 0.7;
}
.emi_carousel .emi-carousel-left-arr {
    left:0px;
}
.emi_carousel .emi-carousel-right-arr {
    right:0px;
}
.emi_carousel .slick-list {
    width:90%;
    margin:auto;
}
.emi_carousel .slick-disabled {
    opacity: 0.3;
}

.emi_box.selected {
    border: 2px solid #78cee1;
}
.plan_info {
    margin-top:5px;
    padding: 10px;
    border: 1px solid;
}
.plan_info:empty {
    display: none;
}
.card-row {
    position: relative;
}
.card-row img.card-icon.active {
    position: absolute !important;
    top: 7px;
    width: auto;
    height: 20px;
}
[dir='rtl'] .card-row img.card-icon.active {
    left: 30px;
}

[dir='ltr'] .card-row img.card-icon.active {
    right: 30px;
}

.card-row img.card-icon:not(.active) {
    display:none
}
.card-row .input-text {
    min-height: 30px;
    height: 30px;
    font-size: 14px;
    width: 100%;
}
img.payment-icons {
    float: none !important;
    margin: 5px !important;
}
label.aps_error {
    color: red;
    font-weight: 500;
    display:block;
}
plans:empty+label.aps_error {
    display: none;
}

img.issuer-logo {
    width: 100px;
    height: 30px;
    margin-right: 5px !important;
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


</style>
