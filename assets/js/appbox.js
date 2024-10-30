if(jQuery('select[select-current-value]').length) {
	jQuery.each(jQuery('select[select-current-value]'),function() {
		jQuery(this).val(jQuery(this).attr('select-current-value'));
	});
}

if(jQuery('input[default-empty]').length) {
	jQuery('input[default-empty]').val(null);
}

jQuery(".image-input").on('change',function() {
	if(!this.files || !this.files[0] || typeof jQuery(this).data === "undefined" || typeof jQuery(this).data('preview') === "undefined" || !jQuery(this).data('preview'))
		return false;

	var prevContainer = jQuery(jQuery(this).data('preview'));
    var reader = new FileReader();
    reader.onload = function(e) {
      prevContainer.attr('src', e.target.result);
      prevContainer.hide();
      prevContainer.fadeIn(650);
    }
    reader.readAsDataURL(this.files[0]);
  return true;
});

jQuery('.wp-image-upload-btn').on('click',function(e) {
		e.preventDefault();
		var mainController = jQuery(this);
		var image = wp.media({
				title: 'Change Logo',
				multiple: false
		}).open()
		.on('select', function(e){
				var uploaded_image = image.state().get('selection').first();
				console.log(uploaded_image);
				var image_url = uploaded_image.toJSON().url;
				var imageURLInput = mainController.attr('image-url-input');
				if(typeof imageURLInput !== "undefined" && imageURLInput) {
					if(jQuery(imageURLInput).length)
						jQuery(imageURLInput).val(image_url);
				}
				var imagePreviewPort = mainController.attr('image-url-preview');
				if(typeof imagePreviewPort !== "undefined" && imagePreviewPort) {
					if(jQuery(imagePreviewPort).length)
						jQuery(imagePreviewPort).attr('src',image_url);
				}
				return true;
		});
	return true;
});

jQuery('.title-hide-control').on('change',function(e) {
	var controlREF = jQuery(this).attr('input-control-ref');
	if(typeof controlREF === "undefined" || !controlREF || !jQuery(controlREF).length) {
		e.preventDefault();
		return false;
	}
	if(jQuery(this).attr('checked')) {
			jQuery(controlREF).val(null);
			jQuery(controlREF).attr('readonly',true);
	} else {
			var defaultVAL = jQuery(this).attr('input-control-default');
			if(typeof defaultVAL === "undefined" || !defaultVAL) defaultVAL = null;
			jQuery(controlREF).val(defaultVAL);
		  jQuery(controlREF).attr('readonly',false);
	}
return true;
});

jQuery('#custom_menu_items_add').on('click',function(e) {
	var defaultTEMPLATE = jQuery('#default_menu_item_template');
	var itemContainer = jQuery('#custom_menu_items_container');
	if(!defaultTEMPLATE.length || !itemContainer.length) return false;
	var newTEMPLATE = defaultTEMPLATE.clone().attr('id', null).show();
	newTEMPLATE.find('.custom-menu-item-select,.custom-menu-item-title').prop('required',true);
	newTEMPLATE.find('.custom-menu-item-icon').selectpicker();
	newTEMPLATE.appendTo("#custom_menu_items_container");
return true;
});

jQuery('#custom_menu_items_container').on('click','.custom-menu-item-remove',function(e) {
	var parentGroup = jQuery(this).parents('.custom-menu-item-group').first();
	if(!parentGroup) return false;
	parentGroup.remove();
return true;
});

jQuery('#custom_menu_items_container').on('change','.custom-menu-item-select',function(e) {
	var parentGroup = jQuery(this).parents('.custom-menu-item-group').first();
	if(typeof parentGroup === "undefined" || !parentGroup.length) return true;
	var inputTitle = parentGroup.find('input.custom-menu-item-title').first();
	if(typeof inputTitle === "undefined" || !inputTitle.length) return true;
	inputTitle.val(jQuery(this).find("option:selected").text());
return true;
});


jQuery("select.select").selectpicker();
jQuery('select.colorpicker_select').simplecolorpicker();
jQuery('.spectrum-input-empty').spectrum({preferredFormat: "hex",showInput: true,allowEmpty:true});
jQuery('.spectrum-input-default').spectrum({preferredFormat: "hex",showInput: true,allowEmpty:false});
