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
  var watermarkText = $j('#interest_empty_text').val();
  watermark('#interest_text', watermarkText, '#aaa', '#205791');
});