<?php if(isset( $title) && !empty($order_data)){ ?>
    <div class="aps_order_data">
        <div>
            <h2><?php echo $title; ?> </h2>
        </div>
        <div>
        <?php foreach ($order_data as $data) {?>
            <h5> <?php echo $data['label']; ?> :  <?php echo $data['value']; ?> </h5>
        <?php } ?>
        </div>
    </div>
<?php } ?>
<script type="text/javascript"><!--
$( document ).ready(function() {        
        $(".aps_order_data").appendTo("#content");
    });
//--></script>