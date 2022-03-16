<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ( $success ){ ?>
    <div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ( $error ){ ?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $error; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
  <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
  <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
  <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
  <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h2><?php echo $heading_title; ?></h2>

        <?php if (! $cards ){ ?>
            <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $text_no_cards; ?></div>
        <?php } else { ?>
            <table class="table table-bordered">
                <thead>
                  <tr>
                    <th><?php echo $text_card_detail; ?> </th>
                    <th><?php echo $text_expire; ?> </th>
                    <?php if (! $hide_delete_token ){ ?>
                      <th><?php echo $text_delete; ?> </th>
                    <?php } ?>
                  </tr>
                <tbody>
                  <?php foreach($cards as $card ){ ?>
                    <tr>
                        <td>
                            <?php echo $card['text']; ?>
                        </td>
                        <td>
                            <?php echo $card['expire']; ?>
                        </td>
                        <?php if (! $hide_delete_token ){ ?>
                          <td class="text-right">
                              <a class="btn btn-danger remove_card" href="<?php echo $card['delete']; ?>"><?php echo $text_delete; ?></a>
                          </td>
                        <?php } ?>
                    </tr>
                  <?php } ?>
                </tbody>
            </table>
        <?php } ?>

        <div class="buttons">
            <a class="btn btn-default" href="<?php echo $back; ?>"><?php echo $text_back; ?></a>
        </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $('.remove_card').click(function(e) {
        return confirm('<?php echo $text_warning_card; ?>');
    });
});
</script>
<?php echo $footer; ?>