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
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for=""><?php echo $entry_language;; ?></label>
            <div class="col-sm-10">
             <select name="payfort_fort_entry_language" class="form-control">
                <?php if ($payfort_fort_entry_language == 'en') { ?>
                <option value="en" selected="selected"><?php echo $text_en; ?></option>
                <?php } else { ?>
                <option value="en"><?php echo $text_en; ?></option>
                <?php } ?>
                <?php if ($payfort_fort_entry_language == 'ar') { ?>
                <option value="ar" selected="selected"><?php echo $text_ar; ?></option>
                <?php } else { ?>
                <option value="ar"><?php echo $text_ar; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_merchant_identifier; ?>*</label>
                <div class="col-sm-10">
                  <tr>
                    <input type="text" size ="50" name="payfort_fort_entry_merchant_identifier" value="<?php echo $payfort_fort_entry_merchant_identifier; ?>" class="form-control" />
                      <?php if ($error_payfort_fort_entry_merchant_identifier) { ?>
                      <span style="color:red"><?php echo $error_payfort_fort_entry_merchant_identifier; ?></span>
                      <?php } ?>
                  </tr>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_access_code; ?>*</label>
                <div class="col-sm-10">
                  <tr>
                      <input type="text" size ="50" name="payfort_fort_entry_access_code" value="<?php echo $payfort_fort_entry_access_code; ?>" class="form-control"/>
                      <?php if ($error_payfort_fort_entry_merchant_identifier) { ?>
                      <span style="color:red"><?php echo $error_payfort_fort_entry_access_code; ?></span>
                      <?php } ?>
                  </tr>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_command;; ?></label>
                <div class="col-sm-10">
                 <select name="payfort_fort_entry_command" class="form-control">
                    <?php if ($payfort_fort_entry_command == 'PURCHASE') { ?>
                    <option value="PURCHASE" selected="selected"><?php echo $text_purchase; ?></option>
                    <?php } else { ?>
                    <option value="PURCHASE"><?php echo $text_purchase; ?></option>
                    <?php } ?>
                    <?php if ($payfort_fort_entry_command == 'AUTHORIZATION') { ?>
                    <option value="AUTHORIZATION" selected="selected"><?php echo $text_authorization; ?></option>
                    <?php } else { ?>
                    <option value="AUTHORIZATION"><?php echo $text_authorization; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_hash_algorithm;; ?></label>
                <div class="col-sm-10">
                 <select name="payfort_fort_entry_hash_algorithm" class="form-control">
                    <?php if ($payfort_fort_entry_hash_algorithm == 'sha1') { ?>
                    <option value="sha1" selected="selected"><?php echo $text_sha1; ?></option>
                    <?php } else { ?>
                    <option value="sha1"><?php echo $text_sha1 ?></option>
                    <?php } ?>
                    <?php if ($payfort_fort_entry_hash_algorithm == 'sha256') { ?>
                    <option value="sha256" selected="selected"><?php echo $text_sha256; ?></option>
                    <?php } else { ?>
                    <option value="sha256"><?php echo $text_sha256; ?></option>
                    <?php } ?>
                    <?php if ($payfort_fort_entry_hash_algorithm == 'sha512') { ?>
                    <option value="sha512" selected="selected"><?php echo $text_sha512; ?></option>
                    <?php } else { ?>
                    <option value="sha512"><?php echo $text_sha512; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_request_sha_phrase; ?>*</label>
                <div class="col-sm-10">
                  <tr>
                      <input type="text" size ="50" name="payfort_fort_entry_request_sha_phrase" value="<?php echo $payfort_fort_entry_request_sha_phrase; ?>" class="form-control"/>
                      <?php if ($error_payfort_fort_entry_merchant_identifier) { ?>
                      <span style="color:red"><?php echo $error_payfort_fort_entry_request_sha_phrase; ?></span>
                      <?php } ?>
                  </tr>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_response_sha_phrase; ?>*</label>
                <div class="col-sm-10">
                  <tr>
                      <input type="text" size ="50" name="payfort_fort_entry_response_sha_phrase" value="<?php echo $payfort_fort_entry_response_sha_phrase; ?>" class="form-control"/>
                      <?php if ($error_payfort_fort_entry_merchant_identifier) { ?>
                      <span style="color:red"><?php echo $error_payfort_fort_entry_response_sha_phrase; ?></span>
                      <?php } ?>
                  </tr>
                </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label" for=""><?php echo $entry_sandbox;; ?></label>
              <div class="col-sm-10">
                    <?php if ($payfort_fort_entry_sandbox_mode) { ?>
                    <label class="radio-inline">
                      <input type="radio" name="payfort_fort_entry_sandbox_mode" value="1" checked="checked" class=""/>
                      <?php echo $text_yes; ?>
                    </label>
                    <label class="radio-inline">
                      <input type="radio" name="payfort_fort_entry_sandbox_mode" value="0" class="" />
                      <?php echo $text_no; ?>
                    </label>
                    <?php } else { ?>
                    <label class="radio-inline">
                      <input type="radio" name="payfort_fort_entry_sandbox_mode" value="1" class="" />
                      <?php echo $text_yes; ?>
                    </label>
                    <label class="radio-inline">
                      <input type="radio" name="payfort_fort_entry_sandbox_mode" value="0" checked="checked"  class=""/>
                      <?php echo $text_no; ?>
                    </label>
                    <?php } ?>
              </div>
            </div>
          
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-debug"><span data-toggle="tooltip" title="<?php echo $help_debug; ?>"><?php echo $entry_debug; ?></span></label>
                <div class="col-sm-10">
                    <select name="payfort_fort_debug" id="input-debug" class="form-control">
                        <?php if ($payfort_fort_debug) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_credit_card; ?></label>
                <div class="col-sm-10">
                    <select name="payfort_fort_credit_card" class="form-control">
                        <?php if ($payfort_fort_credit_card) { ?>
                        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                        <option value="0"><?php echo $text_no; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_yes; ?></option>
                        <option value="0" selected="selected"><?php echo $text_no; ?></option>
                        <?php } ?>
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
                        <?php if ($payfort_fort_cc_integration_type == 'merchantPage') { ?>
                        <option value="redirection"><?php echo $text_redirection ?></option>
                        <option value="merchantPage" selected="selected"><?php echo $text_merchant_page ?></option>
                        <?php } else { ?>
                        <option value="redirection" selected="selected"><?php echo $text_redirection ?></option>
                        <option value="merchantPage"><?php echo $text_merchant_page ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_sadad; ?></label>
                <div class="col-sm-10">
                    <select name="payfort_fort_sadad" class="form-control">
                        <?php if ($payfort_fort_sadad) { ?>
                        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                        <option value="0"><?php echo $text_no; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_yes; ?></option>
                        <option value="0" selected="selected"><?php echo $text_no; ?></option>
                        <?php } ?>
                     </select>
                     <?php if ($payfort_fort_payment_method_required) { ?>
                    <span style="color:red"><?php echo $payfort_fort_payment_method_required; ?></span>
                    <?php } ?>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_naps; ?></label>
                <div class="col-sm-10">
                    <select name="payfort_fort_naps" class="form-control">
                        <?php if ($payfort_fort_naps) { ?>
                        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                        <option value="0"><?php echo $text_no; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_yes; ?></option>
                        <option value="0" selected="selected"><?php echo $text_no; ?></option>
                        <?php } ?>
                     </select>
                     <?php if ($payfort_fort_payment_method_required) { ?>
                    <span style="color:red"><?php echo $payfort_fort_payment_method_required; ?></span>
                    <?php } ?>
                </div>
            </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for=""><?php echo $entry_order_status;; ?></label>
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
                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <tr>
                      <input type="text" name="payfort_fort_sort_order" value="<?php echo $payfort_fort_sort_order; ?>" size="1" class="form-control"/>
                  </tr>
                </div>
            </div>
          
     
          <div class="form-group">
            <label class="col-sm-2 control-label" for=""><?php echo $entry_status;; ?></label>
            <div class="col-sm-10">
            <select name="payfort_fort_status" class="form-control">
                <?php if ($payfort_fort_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
            <?php $u = new Url('/');?>
            <?php $s = 'http'.((isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1')))?'s':'');?>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="">Host to Host URL:</label>
                <div class="col-sm-10">
                  <tr>
                      <input size="50" type="text" readonly="readonly" value="<?php echo str_replace('/admin/index.php', '', $s .'://'.$_SERVER['HTTP_HOST']. $_SERVER['PHP_SELF']) . $u->link('payment/payfort_fort/response');?>" class="form-control" readonly/>
                  </tr>
                </div>
            </div>

          
              
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 