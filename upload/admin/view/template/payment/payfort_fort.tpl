<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-free-checkout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-free-checkout" class="form-horizontal">
                    <ul class="nav nav-tabs" id="tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-cc" data-toggle="tab"><?php echo $tab_credit_card; ?></a></li>
                        <li><a href="#tab-installments" data-toggle="tab"><?php echo $tab_installments; ?></a></li>
                        <li><a href="#tab-sadad" data-toggle="tab"><?php echo $tab_sadad; ?></a></li>
                        <li><a href="#tab-naps" data-toggle="tab"><?php echo $tab_naps; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_status" class="form-control">
                                        <option value="1" <?php echo ($payfort_fort_status) ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                                        <option value="0" <?php echo (!$payfort_fort_status) ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_language; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_entry_language" class="form-control">
                                        <option value="store" <?php echo ($payfort_fort_entry_language == 'store') ? 'selected="selected"' : '' ?>><?php echo $text_store_language; ?></option>
                                        <option value="en" <?php echo ($payfort_fort_entry_language == 'en') ? 'selected="selected"' : '' ?>><?php echo $text_en; ?></option>
                                        <option value="ar" <?php echo ($payfort_fort_entry_language == 'ar') ? 'selected="selected"' : '' ?>><?php echo $text_ar; ?></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_merchant_identifier; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" size ="50" name="payfort_fort_entry_merchant_identifier" value="<?php echo $payfort_fort_entry_merchant_identifier; ?>" class="form-control" />
                                    <?php if ($error_payfort_fort_entry_merchant_identifier) { ?>
                                    <span style="color:red"><?php echo $error_payfort_fort_entry_merchant_identifier; ?></span>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_access_code; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" size ="50" name="payfort_fort_entry_access_code" value="<?php echo $payfort_fort_entry_access_code; ?>" class="form-control"/>
                                    <?php if ($error_payfort_fort_entry_merchant_identifier) { ?>
                                    <span style="color:red"><?php echo $error_payfort_fort_entry_access_code; ?></span>
                                    <?php } ?>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_command; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_entry_command" class="form-control">
                                        <option value="PURCHASE" <?php echo ($payfort_fort_entry_command == 'PURCHASE') ? 'selected="selected"' : '' ?>><?php echo $text_purchase; ?></option>
                                        <option value="AUTHORIZATION" <?php echo ($payfort_fort_entry_command == 'AUTHORIZATION') ? 'selected="selected"' : '' ?>><?php echo $text_authorization; ?></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_hash_algorithm; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_entry_hash_algorithm" class="form-control">
                                        <option value="sha1" <?php echo ($payfort_fort_entry_hash_algorithm == 'sha1') ? 'selected="selected"' : '' ?>><?php echo $text_sha1; ?></option>
                                        <option value="sha256" <?php echo ($payfort_fort_entry_hash_algorithm == 'sha256') ? 'selected="selected"' : '' ?>><?php echo $text_sha256; ?></option>
                                        <option value="sha512" <?php echo ($payfort_fort_entry_hash_algorithm == 'sha512') ? 'selected="selected"' : '' ?>><?php echo $text_sha512; ?></option>                                    
                                    </select>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_request_sha_phrase; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" size ="50" name="payfort_fort_entry_request_sha_phrase" value="<?php echo $payfort_fort_entry_request_sha_phrase; ?>" class="form-control"/>
                                    <?php if ($error_payfort_fort_entry_merchant_identifier) { ?>
                                    <span style="color:red"><?php echo $error_payfort_fort_entry_request_sha_phrase; ?></span>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_response_sha_phrase; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" size ="50" name="payfort_fort_entry_response_sha_phrase" value="<?php echo $payfort_fort_entry_response_sha_phrase; ?>" class="form-control"/>
                                    <?php if ($error_payfort_fort_entry_merchant_identifier) { ?>
                                    <span style="color:red"><?php echo $error_payfort_fort_entry_response_sha_phrase; ?></span>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_sandbox; ?></label>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="payfort_fort_entry_sandbox_mode" value="1" <?php echo ($payfort_fort_entry_sandbox_mode) ? 'checked="checked"' : '' ?> class=""/>
                                        <?php echo $text_yes; ?>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="payfort_fort_entry_sandbox_mode" value="0" <?php echo (!$payfort_fort_entry_sandbox_mode) ? 'checked="checked"' : '' ?> class="" />
                                        <?php echo $text_no; ?>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><span data-toggle="tooltip" title="<?php echo $help_gateway_currency; ?>"><?php echo $entry_gateway_currency; ?></span></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_entry_gateway_currency" class="form-control">
                                        <option value="base" <?php echo ($payfort_fort_entry_gateway_currency == 'base') ? 'selected="selected"' : '' ?>><?php echo $text_base_currency; ?></option>
                                        <option value="front" <?php echo ($payfort_fort_entry_gateway_currency == 'front') ? 'selected="selected"' : '' ?>><?php echo $text_front_currency ?></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-debug"><span data-toggle="tooltip" title="<?php echo $help_debug; ?>"><?php echo $entry_debug; ?></span></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_debug" id="input-debug" class="form-control">
                                        <option value="1" <?php echo ($payfort_fort_debug) ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                                        <option value="0" <?php echo (!$payfort_fort_debug) ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_order_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_order_status_id" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $payfort_fort_order_status_id) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><span data-toggle="tooltip" title="<?php echo $help_order_placement; ?>"><?php echo $entry_order_placement; ?></span></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_order_placement" class="form-control">
                                        <option value="all" <?php echo ($payfort_fort_order_placement == 'all') ? 'selected="selected"' : '' ?>><?php echo $text_always; ?></option>
                                        <option value="success" <?php echo ($payfort_fort_order_placement == 'success') ? 'selected="selected"' : '' ?>><?php echo $text_on_success; ?></option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="">Host to Host URL:</label>
                                <div class="col-sm-10">
                                    <input size="50" type="text" readonly="readonly" value="<?php echo $host_to_host_url;?>" class="form-control" readonly/>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-cc">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_credit_card" class="form-control">
                                        <option value="1" <?php echo ($payfort_fort_credit_card) ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                                        <option value="0" <?php echo (!$payfort_fort_credit_card) ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                                    </select>
                                    <?php if ($payfort_fort_payment_method_required) { ?>
                                    <span style="color:red"><?php echo $payfort_fort_payment_method_required; ?></span>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-cc-integration-type"><span data-toggle="tooltip" title="<?php echo $help_cc_integration_type; ?>"><?php echo $entry_cc_integration_type ?></span></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_cc_integration_type" id="input-cc-integration-type" class="form-control">
                                        <option value="redirection" <?php echo ($payfort_fort_cc_integration_type == 'redirection') ? 'selected="selected"' : '' ?>><?php echo $text_redirection; ?></option>
                                        <option value="merchantPage" <?php echo ($payfort_fort_cc_integration_type == 'merchantPage') ? 'selected="selected"' : '' ?>><?php echo $text_merchant_page; ?></option>
                                        <option value="merchantPage2" <?php echo ($payfort_fort_cc_integration_type == 'merchantPage2') ? 'selected="selected"' : '' ?>><?php echo $text_merchant_page2; ?></option>
                                    </select>
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-cc-mada-option"><span data-toggle="tooltip" title="<?php echo $help_cc_mada_branding; ?>"><?php echo $entry_cc_mada_branding ?></span></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_cc_mada_branding" id="input-cc-mada-branding" class="form-control">                                      
                                        <option value="Disabled" <?php echo ($payfort_fort_cc_mada_branding == 'Disabled') ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                                        <option value="Enabled"  <?php echo ($payfort_fort_cc_mada_branding == 'Enabled') ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>                                        
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="payfort_fort_sort_order" value="<?php echo $payfort_fort_sort_order; ?>" size="1" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-installments">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_installments" class="form-control">
                                        <option value="1" <?php echo ($payfort_fort_installments) ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                                        <option value="0" <?php echo (!$payfort_fort_installments) ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                                    </select>
                                    <?php if ($payfort_fort_payment_method_required) { ?>
                                    <span style="color:red"><?php echo $payfort_fort_payment_method_required; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-installments-integration-type"><span data-toggle="tooltip" title="<?php echo $help_installments_integration_type; ?>"><?php echo $entry_installments_integration_type ?></span></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_installments_integration_type" id="input-installments-integration-type" class="form-control">
                                        <option value="redirection" <?php echo ($payfort_fort_installments_integration_type == 'redirection') ? 'selected="selected"' : '' ?>><?php echo $text_redirection; ?></option>
                                        <option value="merchantPage" <?php echo ($payfort_fort_installments_integration_type == 'merchantPage') ? 'selected="selected"' : '' ?>><?php echo $text_merchant_page; ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="payfort_fort_installments_sort_order" value="<?php echo $payfort_fort_installments_sort_order; ?>" size="1" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-sadad">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_sadad" class="form-control">
                                        <option value="1" <?php echo ($payfort_fort_sadad) ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                                        <option value="0" <?php echo (!$payfort_fort_sadad) ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                                    </select>
                                    <?php if ($payfort_fort_payment_method_required) { ?>
                                    <span style="color:red"><?php echo $payfort_fort_payment_method_required; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="payfort_fort_sadad_sort_order" value="<?php echo $payfort_fort_sadad_sort_order; ?>" size="1" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-naps">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="payfort_fort_naps" class="form-control">
                                        <option value="1" <?php echo ($payfort_fort_naps) ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                                        <option value="0" <?php echo (!$payfort_fort_naps) ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                                    </select>
                                    <?php if ($payfort_fort_payment_method_required) { ?>
                                    <span style="color:red"><?php echo $payfort_fort_payment_method_required; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="payfort_fort_qpay_sort_order" value="<?php echo $payfort_fort_qpay_sort_order; ?>" size="1" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?> 