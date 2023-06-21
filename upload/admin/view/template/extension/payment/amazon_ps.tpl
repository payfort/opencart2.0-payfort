<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-payment" data-toggle="tooltip" title="" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel ?>" data-toggle="tooltip" title="" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <form action="<?php echo $action ?>" method="post" enctype="multipart/form-data" id="form-payment" class="form-horizontal">
          <input type="hidden" name="amazon_ps_card" value="1" />
          <ul class="nav nav-tabs" id="tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general ?></a></li>
            <li><a href="#tab-cc" data-toggle="tab"><?php echo $tab_credit_card ?></a></li>
            <li><a href="#tab-installments" data-toggle="tab"><?php echo $tab_installments ?></a></li>
            <li><a href="#tab-visa-checkout" data-toggle="tab"><?php echo $tab_visa_checkout ?></a></li>
            <li><a href="#tab-naps" data-toggle="tab"><?php echo $tab_naps ?></a></li>
            <li><a href="#tab-knet" data-toggle="tab"><?php echo $tab_knet ?></a></li>
            <li><a href="#tab-valu" data-toggle="tab"><?php echo $tab_valu ?></a></li>
            <li><a href="#tab-apple_pay" data-toggle="tab"><?php echo $tab_apple_pay ?></a></li>
            <li><a href="#tab-cron" data-toggle="tab"><?php echo $tab_cron ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="form-group">
              <?php if ($amazon_ps_payment_method_required) { ?>
                <div class="alert alert-danger alert-dismissible">
                   <i class="fa fa-exclamation-circle"></i> <?php echo $amazon_ps_payment_method_required ?>
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
              <?php } ?>
              
                <div>
                  <h4 class="col-sm-12"><?php echo $label_merchant_config?></h4>
                 </div>                
              </div>
              <div class="form-group">
                  <label class="col-sm-1 control-label"></label>
                   <h4><a href="https://paymentservices.amazon.com/" target="_blank"><?php echo $label_sign_up_url ?></a><h4>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_status ?></label>
                  <div class="col-sm-10">
                    <select name="amazon_ps_status" id="input-status" class="form-control">
                        <option value="1" <?php echo $amazon_ps_status == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_status == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                    </select>
                  </div>
              </div>
              <div class="form-group required">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_merchant_identifier ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_merchant_identifier" value="<?php echo $amazon_ps_merchant_identifier ?>" class="form-control" />
                      <?php if ($error_amazon_ps_merchant_identifier){ ?>
                        <span style="color:red"><?php echo $error_amazon_ps_merchant_identifier ?></span>
                      <?php } ?>
                  </div>
              </div>

              <div class="form-group required">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_access_code ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_access_code" value="<?php echo $amazon_ps_access_code ?>" class="form-control"/>
                      <?php if ($error_amazon_ps_access_code){ ?>
                        <span style="color:red"><?php echo $error_amazon_ps_access_code ?></span>
                      <?php } ?>
                  </div>
              </div>

              <div class="form-group required">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_request_sha_phrase ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_request_sha_phrase" value="<?php echo $amazon_ps_request_sha_phrase ?>" class="form-control"/>
                      <?php if ($error_amazon_ps_request_sha_phrase){ ?>
                        <span style="color:red"><?php echo $error_amazon_ps_request_sha_phrase ?></span>
                      <?php } ?>
                  </div>
              </div>

              <div class="form-group required">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_response_sha_phrase ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_response_sha_phrase" value="<?php echo $amazon_ps_response_sha_phrase ?>" class="form-control"/>
                      <?php if ($error_amazon_ps_response_sha_phrase){ ?>
                        <span style="color:red"><?php echo $error_amazon_ps_response_sha_phrase ?></span>
                      <?php } ?>
                  </div>
              </div>
              <div class="form-group"> 
                <h4 class="col-sm-12"><?php echo $label_global_config?></h4> 
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_sandbox ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_sandbox_mode" id="input-status" class="form-control">
                        <option value="1" <?php echo $amazon_ps_sandbox_mode == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_sandbox_mode == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_command ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_command" class="form-control">
                          <option value="PURCHASE" <?php echo $amazon_ps_command == 'PURCHASE' ? 'selected="selected"' : '' ?> > <?php echo $text_purchase ?></option>
                          <option value="AUTHORIZATION" <?php echo $amazon_ps_command == 'AUTHORIZATION' ? 'selected="selected"' : '' ?> > <?php echo $text_authorization ?></option>
                      </select>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_sha_type ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_sha_type" class="form-control">
                          <option value="sha256" <?php echo $amazon_ps_sha_type == 'sha256' ? 'selected="selected"' : '' ?> > <?php echo $text_sha256 ?></option>
                          <option value="sha512" <?php echo $amazon_ps_sha_type == 'sha512' ? 'selected="selected"' : '' ?> > <?php echo $text_sha512 ?></option>
                          <option value="hmac256" <?php echo $amazon_ps_sha_type == 'hmac256' ? 'selected="selected"' : '' ?> > <?php echo $text_hmac256 ?></option>
                          <option value="hmac512" <?php echo $amazon_ps_sha_type == 'hmac512' ? 'selected="selected"' : '' ?> > <?php echo $text_hmac512 ?></option>
                      </select>
                  </div>
              </div>


              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><span data-toggle="tooltip" title="<?php echo $help_gateway_currency ?>"><?php echo $entry_gateway_currency ?></span></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_gateway_currency" class="form-control">
                          <option value="base" <?php echo $amazon_ps_gateway_currency == 'base' ? 'selected="selected"' : '' ?> > <?php echo $text_base_currency ?></option>
                          <option value="front" <?php echo $amazon_ps_gateway_currency == 'front' ? 'selected="selected"' : '' ?> > <?php echo $text_front_currency ?> </option>
                      </select>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-debug"><span data-toggle="tooltip" title="<?php echo $help_debug ?>"><?php echo $entry_debug ?></span></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_debug" id="input-debug" class="form-control">
                        <option value="1" <?php echo $amazon_ps_debug == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_debug == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>
              
             <!--  <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php //echo $entry_order_status ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_order_status_id" class="form-control">
                          {% for order_status in order_statuses %}
                          {% if order_status.order_status_id == amazon_ps_order_status_id %}
                          <option value="<?php //echo $order_status.order_status_id ?>" selected="selected"> <?php //echo $order_status.name ?></option>
                          {% else %}
                          <option value="<?php //echo $order_status.order_status_id ?>"><?php //echo $order_status.name ?> </option>
                          {% endif %}
                          {% endfor %}
                      </select>
                  </div>
              </div>
              -->

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $label_host_to_host_url?></label>
                  <div class="col-sm-10">
                      <input size="50" type="text" readonly="readonly" value="<?php echo $host_to_host_url ?>" class="form-control" readonly/>
                  </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_tokenization ?></label>
                <div class="col-sm-10">
                  <select name="amazon_ps_cc_tokenization" class="form-control">
                    <option value="1" <?php echo $amazon_ps_cc_tokenization == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                    <option value="0" <?php echo $amazon_ps_cc_tokenization == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_hide_delete_token ?></label>
                <div class="col-sm-10">
                  <select name="amazon_ps_cc_hide_delete_token" class="form-control">
                    <option value="1" <?php echo $amazon_ps_cc_hide_delete_token == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                    <option value="0" <?php echo $amazon_ps_cc_hide_delete_token == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                  </select>
                </div>
              </div>
          </div>
            <div class="tab-pane " id="tab-cc">
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_status ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_cc_status" class="form-control">
                        <option value="1" <?php echo $amazon_ps_cc_status == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_cc_status == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-cc-integration-type"><?php echo $entry_integration_type ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_cc_integration_type" id="input-icc-integration-type" class="form-control">
                          <option value="redirection" <?php echo $amazon_ps_cc_integration_type == 'redirection' ? 'selected="selected"' : ''  ?> > <?php echo $text_redirection ?></option>
                          <option value="standard_checkout" <?php echo $amazon_ps_cc_integration_type == 'standard_checkout' ? 'selected="selected"' : '' ?> > <?php echo $text_standard_checkout ?> </option>
                          <option value="hosted_checkout" <?php echo $amazon_ps_cc_integration_type == 'hosted_checkout' ? 'selected="selected"' : '' ?> > <?php echo $text_hosted_checkout ?> </option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_show_mada_branding ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_cc_show_mada_branding" class="form-control">
                        <option value="1" <?php echo $amazon_ps_cc_show_mada_branding == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_cc_show_mada_branding == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_show_meeza_branding ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_cc_show_meeza_branding" class="form-control">
                        <option value="1" <?php echo $amazon_ps_cc_show_meeza_branding == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_cc_show_meeza_branding == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_mada_bins ?></label>
                  <div class="col-sm-10">
                    <textarea name="amazon_ps_cc_mada_bins"  rows="5"  class="form-control"><?php echo $amazon_ps_cc_mada_bins ?></textarea>
                    <span><?php echo $help_bins_text?></span>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_meeza_bins ?></label>
                  <div class="col-sm-10">
                      <textarea name="amazon_ps_cc_meeza_bins"  rows="5"  class="form-control"><?php echo $amazon_ps_cc_meeza_bins ?></textarea>
                      <span><?php echo $help_bins_text?></span>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="amazon_ps_cc_sort_order" value="<?php echo $amazon_ps_cc_sort_order ?>" size="1" class="form-control"/>
                  </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-visa-checkout">
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_status ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_visa_checkout_status" class="form-control">
                        <option value="1" <?php echo $amazon_ps_visa_checkout_status == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_visa_checkout_status == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-visa-checkout-integration-type"><?php echo $entry_integration_type ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_visa_checkout_integration_type" id="input-visa-checkot-integration-type" class="form-control">
                          <option value="redirection" <?php echo $amazon_ps_visa_checkout_integration_type == 'redirection' ? 'selected="selected"' : ''  ?> > <?php echo $text_redirection ?></option>
                          <option value="hosted_checkout" <?php echo $amazon_ps_visa_checkout_integration_type == 'hosted_checkout' ? 'selected="selected"' : '' ?> > <?php echo $text_hosted_checkout ?> </option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_api_key ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="amazon_ps_visa_checkout_api_key" value="<?php echo $amazon_ps_visa_checkout_api_key ?>" size="1" class="form-control"/>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_profile_name ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="amazon_ps_visa_checkout_profile_name" value="<?php echo $amazon_ps_visa_checkout_profile_name ?>" size="1" class="form-control"/>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="amazon_ps_visa_checkout_sort_order" value="<?php echo $amazon_ps_visa_checkout_sort_order ?>" size="1" class="form-control"/>
                  </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-installments">
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_status ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_installments_status" class="form-control">
                        <option value="1" <?php echo $amazon_ps_installments_status == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_installments_status == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-installments-integration-type"><?php echo $entry_integration_type ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_installments_integration_type" id="input-installments-integration-type" class="form-control">
                          <option value="redirection" <?php echo $amazon_ps_installments_integration_type == 'redirection' ? 'selected="selected"' : ''  ?> > <?php echo $text_redirection ?></option>
                          <option value="standard_checkout" <?php echo $amazon_ps_installments_integration_type == 'standard_checkout' ? 'selected="selected"' : '' ?> > <?php echo $text_standard_checkout ?> </option>
                          <option value="hosted_checkout" <?php echo $amazon_ps_installments_integration_type == 'hosted_checkout' ? 'selected="selected"' : '' ?> > <?php echo $text_hosted_checkout ?> </option>
                          <option value="embedded_hosted_checkout" <?php echo $amazon_ps_installments_integration_type == 'embedded_hosted_checkout' ? 'selected="selected"' : '' ?> > <?php echo $text_embedded_hosted_checkout ?> </option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_installments_sar_order_min_value ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="amazon_ps_installments_order_sar_min_value" value="<?php echo $amazon_ps_installments_sar_order_min_value ?>" size="1" class="form-control"/>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_installments_aed_order_min_value ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="amazon_ps_installments_aed_order_min_value" value="<?php echo $amazon_ps_installments_aed_order_min_value ?>" size="1" class="form-control"/>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_installments_egp_order_min_value ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="amazon_ps_installments_egp_order_min_value" value="<?php echo $amazon_ps_installments_egp_order_min_value ?>" size="1" class="form-control"/>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_installments_issuer_name ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_installments_issuer_name" class="form-control">
                        <option value="1" <?php echo $amazon_ps_installments_issuer_name == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_installments_issuer_name == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_installments_issuer_logo ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_installments_issuer_logo" class="form-control">
                        <option value="1" <?php echo $amazon_ps_installments_issuer_logo == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                        <option value="0" <?php echo $amazon_ps_installments_issuer_logo == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order ?></label>
                  <div class="col-sm-10">
                      <input type="text" name="amazon_ps_installments_sort_order" value="<?php echo $amazon_ps_installments_sort_order ?>" size="1" class="form-control"/>
                  </div>
              </div>
            </div>

            <div class="tab-pane " id="tab-naps">
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_status ?></label>
                <div class="col-sm-10">
                    <select name="amazon_ps_naps_status" class="form-control">
                      <option value="1" <?php echo $amazon_ps_naps_status == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                      <option value="0" <?php echo $amazon_ps_naps_status == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                    </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order ?></label>
                <div class="col-sm-10">
                    <input type="text" name="amazon_ps_naps_sort_order" value="<?php echo $amazon_ps_naps_sort_order ?>" size="1" class="form-control"/>
                </div>
              </div>
            </div>
            <div class="tab-pane " id="tab-knet">
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_status ?></label>
                <div class="col-sm-10">
                    <select name="amazon_ps_knet_status" class="form-control">
                      <option value="1" <?php echo $amazon_ps_knet_status == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                      <option value="0" <?php echo $amazon_ps_knet_status == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                    </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order ?></label>
                <div class="col-sm-10">
                    <input type="text" name="amazon_ps_knet_sort_order" value="<?php echo $amazon_ps_knet_sort_order ?>" size="1" class="form-control"/>
                </div>
              </div>
            </div>
            <div class="tab-pane " id="tab-valu">
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_status ?></label>
                <div class="col-sm-10">
                    <select name="amazon_ps_valu_status" class="form-control">
                      <option value="1" <?php echo $amazon_ps_valu_status == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                      <option value="0" <?php echo $amazon_ps_valu_status == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                    </select>
                </div>
              </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for=""><?php echo $entry_down_payment_status ?></label>
                    <div class="col-sm-10">
                        <select name="amazon_ps_valu_down_payment_status" class="form-control">
                            <option value="1" <?php echo $amazon_ps_valu_down_payment_status == 1 ? 'selected="selected"' : ''  ?> > <?php echo $text_enabled; ?></option>
                            <option value="0" <?php echo $amazon_ps_valu_down_payment_status == 0 ? 'selected="selected"' : '' ?> > <?php echo $text_disabled; ?></option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for=""><?php echo $entry_down_payment_value ?></label>
                    <div class="col-sm-10">
                        <input type="text" name="amazon_ps_valu_down_payment_value" value="<?php echo $amazon_ps_valu_down_payment_value > 0 ? $amazon_ps_valu_down_payment_value: 0 ?>" size="1" class="form-control"/>
                    </div>
                </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_valu_order_min_value ?></label>
                <div class="col-sm-10">
                    <input type="text" name="amazon_ps_valu_order_min_value" value="<?php echo $amazon_ps_valu_order_min_value ?>" size="1" class="form-control"/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order ?></label>
                <div class="col-sm-10">
                    <input type="text" name="amazon_ps_valu_sort_order" value="<?php echo $amazon_ps_valu_sort_order ?>" size="1" class="form-control"/>
                </div>
              </div>
            </div>
            <div class="tab-pane " id="tab-apple_pay">
              <div class="form-group">
                <label class="col-sm-1 control-label"></label>
                 <h4>
                    <a href="<?php echo $apple_pay_certificate_url?>" target="_blank"><?php echo $text_upload_certificate ?></a>
                <h4>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_status ?></label>
                <div class="col-sm-10">
                    <select name="amazon_ps_apple_pay_status" class="form-control">
                      <option value="1" <?php echo $amazon_ps_apple_pay_status == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                      <option value="0" <?php echo $amazon_ps_apple_pay_status == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                    </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_status_apple_pay_product_page; ?></label>
                <div class="col-sm-10">
                    <select name="amazon_ps_apple_pay_product_page" class="form-control">
                      <option value="1" <?php echo $amazon_ps_apple_pay_product_page == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                      <option value="0" <?php echo $amazon_ps_apple_pay_product_page == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                    </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_status_apple_pay_cart_page;?></label>
                <div class="col-sm-10">
                    <select name="amazon_ps_apple_pay_cart_page" class="form-control">
                      <option value="1" <?php echo $amazon_ps_apple_pay_cart_page == 1 ? 'selected="selected"' : '' ?>><?php echo $text_enabled; ?></option>
                      <option value="0" <?php echo $amazon_ps_apple_pay_cart_page == 0 ? 'selected="selected"' : '' ?>><?php echo $text_disabled; ?></option>
                    </select>
                </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_sha_type ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_apple_pay_sha_type" class="form-control">
                          <option value="sha256" <?php echo $amazon_ps_apple_pay_sha_type == 'sha256' ? 'selected="selected"' : '' ?> > <?php echo $text_sha256 ?></option>
                          <option value="sha512" <?php echo $amazon_ps_apple_pay_sha_type == 'sha512' ? 'selected="selected"' : '' ?> > <?php echo $text_sha512 ?></option>
                          <option value="hmac256" <?php echo $amazon_ps_apple_pay_sha_type == 'hmac256' ? 'selected="selected"' : '' ?> > <?php echo $text_hmac256 ?></option>
                          <option value="hmac512" <?php echo $amazon_ps_apple_pay_sha_type == 'hmac512' ? 'selected="selected"' : '' ?> > <?php echo $text_hmac512 ?></option>
                      </select>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_apple_pay_btn_type ?></label>
                  <div class="col-sm-10">
                      <select name="amazon_ps_apple_pay_btn_type" class="form-control">
                        <?php foreach ($apple_pay_button_types as $key => $value ) { ?>
                          <option value="<?php echo $key?>" <?php echo $amazon_ps_apple_pay_btn_type == $key ? 'selected="selected"' : '' ?>> <?php echo $value?></option>
                        <?php } ?>
                      </select>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_access_code ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_apple_pay_access_code" value="<?php echo $amazon_ps_apple_pay_access_code ?>" class="form-control"/>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_request_sha_phrase ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_apple_pay_request_sha_phrase" value="<?php echo $amazon_ps_apple_pay_request_sha_phrase ?>" class="form-control"/>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_response_sha_phrase ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_apple_pay_response_sha_phrase" value="<?php echo $amazon_ps_apple_pay_response_sha_phrase ?>" class="form-control"/>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_domain_name ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_apple_pay_domain_name" value="<?php echo $amazon_ps_apple_pay_domain_name ?>" class="form-control"/>
                  </div>
              </div>

              <div class="form-group">
                  <label class="col-sm-2 control-label" for=""><?php echo $entry_display_name ?></label>
                  <div class="col-sm-10">
                      <input type="text" size ="50" name="amazon_ps_apple_pay_display_name" value="<?php echo $amazon_ps_apple_pay_display_name ?>" class="form-control" maxlength="64"/>
                      <span><?php echo $help_display_name_text?></span>
                  </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_supported_network ?></label>
                <div class="col-sm-10">
                  <?php foreach ($cards as $key => $value ) { ?>
                    <div class="checkbox">
                      <label> <?php if(in_array($key, $amazon_ps_apple_pay_supported_network)) { ?>
                        <input type="checkbox" checked="checked" name="amazon_ps_apple_pay_supported_network[]" value="<?php echo $key ?>" />
                      <?php } else { ?>
                        <input type="checkbox" name="amazon_ps_apple_pay_supported_network[]" value="<?php echo $key ?>" />
                      <?php } ?>
                        <?php echo $value ?> 
                      </label>
                    </div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_production_key?></label>
                <div class="col-sm-10">
                    <input type="text" name="amazon_ps_apple_pay_production_key" value="<?php echo $amazon_ps_apple_pay_production_key ?>" size="1" class="form-control"/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_sort_order ?></label>
                <div class="col-sm-10">
                    <input type="text" name="amazon_ps_apple_pay_sort_order" value="<?php echo $amazon_ps_apple_pay_sort_order ?>" size="1" class="form-control"/>
                </div>
              </div>
            </div>

            <div class="tab-pane " id="tab-cron">
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_recurring_cron ?></label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" name="cron_recurring_url" value="<?php echo $cron_recurring_url ?>" size="1" class="form-control"/>
                    <span><?php echo $help_recurring_cron?></span>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_check_status_cron ?></label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" name="cron_check_status_url" value="<?php echo $cron_check_status_url ?>" size="1" class="form-control"/>
                    <span><?php echo $help_check_status_cron?></span>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for=""><?php echo $entry_check_status_cron_duration ?></label>
                <div class="col-sm-10">
                    <select name="amazon_ps_check_status_cron_duration" class="form-control">
                          <option value="15" <?php echo $amazon_ps_check_status_cron_duration == '15' ? 'selected="selected"' : '' ?> > <?php echo $text_15m ?></option>
                          <option value="30" <?php echo $amazon_ps_check_status_cron_duration == '30' ? 'selected="selected"' : '' ?> > <?php echo $text_30m ?></option>
                          <option value="45" <?php echo $amazon_ps_check_status_cron_duration == '45' ? 'selected="selected"' : '' ?> > <?php echo $text_45m ?></option>
                          <option value="60" <?php echo $amazon_ps_check_status_cron_duration == '60' ? 'selected="selected"' : '' ?> > <?php echo $text_1h ?></option>
                          <option value="120" <?php echo $amazon_ps_check_status_cron_duration == '120' ? 'selected="selected"' : '' ?> > <?php echo $text_2h ?></option>
                      </select>
                    <span><?php echo $help_check_status_cron_duration?></span>
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
