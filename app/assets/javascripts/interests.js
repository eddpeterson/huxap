var $j = jQuery.noConflict();
function watermark(id, watermarkText, watermarkColor, activeColor) {
	$j(id).val(watermarkText).css('color', watermarkColor).focus( function() {
		if($j(this).val() == watermarkText) {
			$j(this).val('');
			$j(this).css('color', activeColor);
		}
	}).blur( function() {
		if(!$j(this).val()) {
			$j(this).val(watermarkText).css('color', watermarkColor);
		}
	});
}


jQuery(document).ready( function() {
  watermark('#interest_text', 'leave email or phone, we contact you', '#ccc', 'green');
});