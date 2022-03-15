<div class="form-group token-box">
	<?php if(isset($tokens) && ! empty($tokens)) { ?>
		<?php foreach ($tokens as $token_row) { ?>
			<div class="radio aps_token_group">
				<label class="aps_token_row">
					<span class="aps-card-num">
						<input type="radio" name="aps_payment_token_cc" class="aps-radio" value="<?php echo $token_row['token']; ?>" data-cardbin="<?php echo substr($token_row['extras']['masking_card'], 0, 6); ?>" data-cardtype="<?php echo $token_row['extras']['card_type']; ?>"/>
						<img class="card-icon" src="<?php echo $tokenization_card_icons[$token_row['extras']['card_type']] ?>"/>
						<strong><?php echo ($token_row['extras']['card_type'] == 'mada') ? strtolower($token_row['extras']['card_type'] ): strtoupper($token_row['extras']['card_type']); ?> <?php echo $token_row['extras']['last4']; ?></strong> 
					</span>
					<span class="aps-card-expiry">
						<?php echo $text_exp; ?> <?php echo $token_row['extras']['expiry_month']; ?>/<?php echo $token_row['extras']['expiry_year']; ?>
					</span>
				</label>
				<label class="aps_error aps_install_token_error"></label>
			</div>
		<?php }?>
	<?php } ?>
	<div class="radio" <?php echo $display_add_new_card; ?>>
		<label>
			<input type="radio" name="aps_payment_token_cc" class="aps_token_radio" value="" data-cardbin="" required checked /> 
			<?php echo $add_new_card; ?>
		</label>
	</div>
</div>
