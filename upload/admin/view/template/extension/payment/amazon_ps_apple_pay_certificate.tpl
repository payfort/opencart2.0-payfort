<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-payment" data-toggle="tooltip" title="" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if($error_warning){ ?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if($upload_success){ ?>
      <div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $upload_success?>
      <button type="button" class="close" data-dismiss="alert">×</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-upload"></i> <?php echo $text_upload_certificate; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-payment" class="form-horizontal">
          <div class="tab-content">
            <div class="form-group required">
              <label class="col-sm-2 control-label" for=""><?php echo $text_certificate_file; ?></label>
              <div class="col-sm-10">
                  <input type="file" name="certificate_file" required/>
                  <?php if($amazon_ps_apple_pay_certificate_file){ ?>
                    <span> <?php echo $existing_file?> : <?php echo $amazon_ps_apple_pay_certificate_file; ?></span>
                  <?php } ?>
                   
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for=""><?php echo $text_certificate_key_file; ?></label>
              <div class="col-sm-10">
                  <input type="file" name="certificate_key_file" required/>
                  <?php if($amazon_ps_apple_pay_certificate_key_file ){ ?>
                    <span> <?php echo $existing_file; ?> <?php echo $amazon_ps_apple_pay_certificate_key_file; ?></span>
                  <?php } ?>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>