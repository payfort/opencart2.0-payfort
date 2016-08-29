<div id="payfort_fort_msg" class="alert alert-danger" style="display:none"></div>
<form id="frm_payfort_fort_payment" class="payfort-fort-confirmation-form form-horizontal" method="POST" action="<?php echo $payment_request_params['url']; ?>">
    <fieldset>
        <?php foreach ($payment_request_params['params'] as $k => $v): ?>
            <input type="hidden" name="<?php echo $k?>" value="<?php echo $v?>">
        <?php endforeach; ?>
        <legend><?php echo $text_credit_card; ?></legend>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="payfort_fort_card_holder_name"><?php echo $text_card_holder_name; ?></label>
            <div class="col-sm-10">
                <input type="text" id="payfort_fort_card_holder_name" name="card_holder_name" value="" placeholder="<?php echo $text_card_holder_name; ?>" class="form-control" autocomplete="off" maxlength="50" />
            </div>
        </div>
        <div class="form-group required">
            <label class="col-sm-2 control-label" for="payfort_fort_card_number"><?php echo $text_card_number; ?></label>
            <div class="col-sm-10">
                <input type="text" id="payfort_fort_card_number" name="card_number" value="" placeholder="<?php echo $text_card_number; ?>" class="form-control" autocomplete="off" maxlength="16" />
            </div>
        </div>
        <div class="form-group required">
            <label class="col-sm-2 control-label" for="payfort_fort_expiry_month"><?php echo $text_expiry_date; ?></label>
            <div class="col-sm-3">
                <select id="payfort_fort_expiry_month" class="form-control">
                    <?php foreach ($months as $month) { ?>
                    <option value="<?php echo $month['value']; ?>"><?php echo $month['value'].' - '.$month['text']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="col-sm-3">
                <select id="payfort_fort_expiry_year" class="form-control">
                    <?php foreach ($year_expire as $year) { ?>
                    <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <input type="hidden" id="payfort_fort_expiry" name="expiry_date"/>
        </div>
        <div class="form-group required">
            <label class="col-sm-2 control-label" for="payfort_fort_card_security_code"><span data-toggle="tooltip" title="<?php echo $help_cvc_code; ?>"><?php echo $text_cvc_code; ?></span></label>
            <div class="col-sm-10">
                <input type="text" id="payfort_fort_card_security_code" name="card_security_code" value="" placeholder="<?php echo $text_cvc_code; ?>" class="form-control" autocomplete="off" size="3" maxlength="4"  />
            </div>
        </div>
    </fieldset>
</form>
<div class="buttons">
    <div class="pull-right">
        <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
    </div>
</div>
<script type="text/javascript"><!--
    var arr_messages = [];
    <?php echo "$arr_js_messages"; ?>
            //--></script>   
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function () {
        var isValid = payfortFortMerchantPage2.validateCcForm();
        if (isValid) {
            $('#frm_payfort_fort_payment').submit();
        }
    });
//--></script>

<script type="text/javascript" src="catalog/view/javascript/payfort_fort/jquery.creditCardValidator.js"/>
<script type="text/javascript" src="catalog/view/javascript/payfort_fort/payfort_fort.js"/>