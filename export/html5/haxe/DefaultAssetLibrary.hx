package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_hvd_comic_serif_pro_otf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_oxygen_bold_ttf);
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_oxygen_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/HVD_Comic_Serif_Pro.otf", __ASSET__assets_hvd_comic_serif_pro_otf);
		type.set ("assets/HVD_Comic_Serif_Pro.otf", AssetType.FONT);
		className.set ("assets/images/blue_button07.png", __ASSET__assets_images_blue_button07_png);
		type.set ("assets/images/blue_button07.png", AssetType.IMAGE);
		className.set ("assets/images/blue_button08.png", __ASSET__assets_images_blue_button08_png);
		type.set ("assets/images/blue_button08.png", AssetType.IMAGE);
		className.set ("assets/images/green_button07.png", __ASSET__assets_images_green_button07_png);
		type.set ("assets/images/green_button07.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/sheet_button.png", __ASSET__assets_images_sheet_button_png);
		type.set ("assets/images/sheet_button.png", AssetType.IMAGE);
		className.set ("assets/images/Simple_Button.png", __ASSET__assets_images_simple_button_png);
		type.set ("assets/images/Simple_Button.png", AssetType.IMAGE);
		className.set ("assets/locales/en-GB/aui.csv", __ASSET__assets_locales_en_gb_aui_csv);
		type.set ("assets/locales/en-GB/aui.csv", AssetType.TEXT);
		className.set ("assets/locales/en-GB/fonts.xml", __ASSET__assets_locales_en_gb_fonts_xml);
		type.set ("assets/locales/en-GB/fonts.xml", AssetType.TEXT);
		className.set ("assets/locales/en-GB/ui.txt", __ASSET__assets_locales_en_gb_ui_txt);
		type.set ("assets/locales/en-GB/ui.txt", AssetType.TEXT);
		className.set ("assets/locales/es-ES/fonts.xml", __ASSET__assets_locales_es_es_fonts_xml);
		type.set ("assets/locales/es-ES/fonts.xml", AssetType.TEXT);
		className.set ("assets/locales/es-ES/ui.csv", __ASSET__assets_locales_es_es_ui_csv);
		type.set ("assets/locales/es-ES/ui.csv", AssetType.TEXT);
		className.set ("assets/locales/famfamfam_flag_icons.zip", __ASSET__assets_locales_famfamfam_flag_icons_zip);
		type.set ("assets/locales/famfamfam_flag_icons.zip", AssetType.BINARY);
		className.set ("assets/locales/index.xml", __ASSET__assets_locales_index_xml);
		type.set ("assets/locales/index.xml", AssetType.TEXT);
		className.set ("assets/locales/it-IT/fonts.xml", __ASSET__assets_locales_it_it_fonts_xml);
		type.set ("assets/locales/it-IT/fonts.xml", AssetType.TEXT);
		className.set ("assets/locales/it-IT/ui.csv", __ASSET__assets_locales_it_it_ui_csv);
		type.set ("assets/locales/it-IT/ui.csv", AssetType.TEXT);
		className.set ("assets/locales/nl-NL/fonts.xml", __ASSET__assets_locales_nl_nl_fonts_xml);
		type.set ("assets/locales/nl-NL/fonts.xml", AssetType.TEXT);
		className.set ("assets/locales/nl-NL/ui.csv", __ASSET__assets_locales_nl_nl_ui_csv);
		type.set ("assets/locales/nl-NL/ui.csv", AssetType.TEXT);
		className.set ("assets/locales/_flags/en-GB.png", __ASSET__assets_locales__flags_en_gb_png);
		type.set ("assets/locales/_flags/en-GB.png", AssetType.IMAGE);
		className.set ("assets/locales/_flags/es-ES.png", __ASSET__assets_locales__flags_es_es_png);
		type.set ("assets/locales/_flags/es-ES.png", AssetType.IMAGE);
		className.set ("assets/locales/_flags/it-IT.png", __ASSET__assets_locales__flags_it_it_png);
		type.set ("assets/locales/_flags/it-IT.png", AssetType.IMAGE);
		className.set ("assets/locales/_flags/nl-NL.png", __ASSET__assets_locales__flags_nl_nl_png);
		type.set ("assets/locales/_flags/nl-NL.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_light_small.png", __ASSET__styles_gradient_cross_light_small_png);
		type.set ("styles/gradient/cross_light_small.png", AssetType.IMAGE);
		className.set ("styles/gradient/gradient.css", __ASSET__styles_gradient_gradient_css);
		type.set ("styles/gradient/gradient.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient.min.css", __ASSET__styles_gradient_gradient_min_css);
		type.set ("styles/gradient/gradient.min.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient_mobile.css", __ASSET__styles_gradient_gradient_mobile_css);
		type.set ("styles/gradient/gradient_mobile.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient_mobile.min.css", __ASSET__styles_gradient_gradient_mobile_min_css);
		type.set ("styles/gradient/gradient_mobile.min.css", AssetType.TEXT);
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/hsplitter_gripper.png", __ASSET__styles_gradient_hsplitter_gripper_png);
		type.set ("styles/gradient/hsplitter_gripper.png", AssetType.IMAGE);
		className.set ("styles/gradient/vsplitter_gripper.png", __ASSET__styles_gradient_vsplitter_gripper_png);
		type.set ("styles/gradient/vsplitter_gripper.png", AssetType.IMAGE);
		className.set ("styles/windows/accordion.css", __ASSET__styles_windows_accordion_css);
		type.set ("styles/windows/accordion.css", AssetType.TEXT);
		className.set ("styles/windows/accordion.min.css", __ASSET__styles_windows_accordion_min_css);
		type.set ("styles/windows/accordion.min.css", AssetType.TEXT);
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		className.set ("styles/windows/buttons.css", __ASSET__styles_windows_buttons_css);
		type.set ("styles/windows/buttons.css", AssetType.TEXT);
		className.set ("styles/windows/buttons.min.css", __ASSET__styles_windows_buttons_min_css);
		type.set ("styles/windows/buttons.min.css", AssetType.TEXT);
		className.set ("styles/windows/calendar.css", __ASSET__styles_windows_calendar_css);
		type.set ("styles/windows/calendar.css", AssetType.TEXT);
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/listview.css", __ASSET__styles_windows_listview_css);
		type.set ("styles/windows/listview.css", AssetType.TEXT);
		className.set ("styles/windows/listview.min.css", __ASSET__styles_windows_listview_min_css);
		type.set ("styles/windows/listview.min.css", AssetType.TEXT);
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		className.set ("styles/windows/menus.css", __ASSET__styles_windows_menus_css);
		type.set ("styles/windows/menus.css", AssetType.TEXT);
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		className.set ("styles/windows/popups.css", __ASSET__styles_windows_popups_css);
		type.set ("styles/windows/popups.css", AssetType.TEXT);
		className.set ("styles/windows/rtf.css", __ASSET__styles_windows_rtf_css);
		type.set ("styles/windows/rtf.css", AssetType.TEXT);
		className.set ("styles/windows/scrolls.css", __ASSET__styles_windows_scrolls_css);
		type.set ("styles/windows/scrolls.css", AssetType.TEXT);
		className.set ("styles/windows/scrolls.min.css", __ASSET__styles_windows_scrolls_min_css);
		type.set ("styles/windows/scrolls.min.css", AssetType.TEXT);
		className.set ("styles/windows/sliders.css", __ASSET__styles_windows_sliders_css);
		type.set ("styles/windows/sliders.css", AssetType.TEXT);
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		className.set ("styles/windows/tabs.css", __ASSET__styles_windows_tabs_css);
		type.set ("styles/windows/tabs.css", AssetType.TEXT);
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/windows.css", __ASSET__styles_windows_windows_css);
		type.set ("styles/windows/windows.css", AssetType.TEXT);
		className.set ("fonts/Oxygen-Bold.eot", __ASSET__fonts_oxygen_bold_eot);
		type.set ("fonts/Oxygen-Bold.eot", AssetType.BINARY);
		className.set ("fonts/Oxygen-Bold.svg", __ASSET__fonts_oxygen_bold_svg);
		type.set ("fonts/Oxygen-Bold.svg", AssetType.TEXT);
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		className.set ("fonts/Oxygen-Bold.woff", __ASSET__fonts_oxygen_bold_woff);
		type.set ("fonts/Oxygen-Bold.woff", AssetType.BINARY);
		className.set ("fonts/Oxygen-Bold.woff2", __ASSET__fonts_oxygen_bold_woff2);
		type.set ("fonts/Oxygen-Bold.woff2", AssetType.BINARY);
		className.set ("fonts/Oxygen.eot", __ASSET__fonts_oxygen_eot);
		type.set ("fonts/Oxygen.eot", AssetType.BINARY);
		className.set ("fonts/Oxygen.svg", __ASSET__fonts_oxygen_svg);
		type.set ("fonts/Oxygen.svg", AssetType.TEXT);
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		className.set ("fonts/Oxygen.woff", __ASSET__fonts_oxygen_woff);
		type.set ("fonts/Oxygen.woff", AssetType.BINARY);
		className.set ("fonts/Oxygen.woff2", __ASSET__fonts_oxygen_woff2);
		type.set ("fonts/Oxygen.woff2", AssetType.BINARY);
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/HVD_Comic_Serif_Pro.otf";
		className.set (id, __ASSET__assets_hvd_comic_serif_pro_otf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/blue_button07.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/blue_button08.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/green_button07.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/sheet_button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Simple_Button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/en-GB/aui.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/en-GB/fonts.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/en-GB/ui.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/es-ES/fonts.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/es-ES/ui.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/famfamfam_flag_icons.zip";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/locales/index.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/it-IT/fonts.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/it-IT/ui.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/nl-NL/fonts.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/nl-NL/ui.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/locales/_flags/en-GB.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/es-ES.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/it-IT.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/nl-NL.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/circle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/collapse.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/cross.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/expand.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/up_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/circle_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_light_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gradient.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient_mobile.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient_mobile.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gripper_horizontal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_horizontal_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/hsplitter_gripper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/vsplitter_gripper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/accordion.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/accordion.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/buttons.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/buttons.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/calendar.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/checkbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/container.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/down_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/left_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/right_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/up_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/listview.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/listview.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/listview.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/menus.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/optionbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popup.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popups.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/rtf.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/scrolls.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/scrolls.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/sliders.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/tabs.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/textinput.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/windows.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen-Bold.eot";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen-Bold.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen-Bold.ttf";
		className.set (id, __ASSET__fonts_oxygen_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Oxygen-Bold.woff";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen-Bold.woff2";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen.eot";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen.ttf";
		className.set (id, __ASSET__fonts_oxygen_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Oxygen.woff";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "fonts/Oxygen.woff2";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "flixel/flixel-ui/img/box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_thin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_toggle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_flat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_inset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_light.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/dropdown_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_big.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/hilight.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/invis.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/minus_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/plus_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio_dot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/swatch.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tooltip_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/xml/defaults.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_loading_screen.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_popup.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/HVD_Comic_Serif_Pro.otf", __ASSET__assets_hvd_comic_serif_pro_otf);
		type.set ("assets/HVD_Comic_Serif_Pro.otf", AssetType.FONT);
		
		className.set ("assets/images/blue_button07.png", __ASSET__assets_images_blue_button07_png);
		type.set ("assets/images/blue_button07.png", AssetType.IMAGE);
		
		className.set ("assets/images/blue_button08.png", __ASSET__assets_images_blue_button08_png);
		type.set ("assets/images/blue_button08.png", AssetType.IMAGE);
		
		className.set ("assets/images/green_button07.png", __ASSET__assets_images_green_button07_png);
		type.set ("assets/images/green_button07.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/sheet_button.png", __ASSET__assets_images_sheet_button_png);
		type.set ("assets/images/sheet_button.png", AssetType.IMAGE);
		
		className.set ("assets/images/Simple_Button.png", __ASSET__assets_images_simple_button_png);
		type.set ("assets/images/Simple_Button.png", AssetType.IMAGE);
		
		className.set ("assets/locales/en-GB/aui.csv", __ASSET__assets_locales_en_gb_aui_csv);
		type.set ("assets/locales/en-GB/aui.csv", AssetType.TEXT);
		
		className.set ("assets/locales/en-GB/fonts.xml", __ASSET__assets_locales_en_gb_fonts_xml);
		type.set ("assets/locales/en-GB/fonts.xml", AssetType.TEXT);
		
		className.set ("assets/locales/en-GB/ui.txt", __ASSET__assets_locales_en_gb_ui_txt);
		type.set ("assets/locales/en-GB/ui.txt", AssetType.TEXT);
		
		className.set ("assets/locales/es-ES/fonts.xml", __ASSET__assets_locales_es_es_fonts_xml);
		type.set ("assets/locales/es-ES/fonts.xml", AssetType.TEXT);
		
		className.set ("assets/locales/es-ES/ui.csv", __ASSET__assets_locales_es_es_ui_csv);
		type.set ("assets/locales/es-ES/ui.csv", AssetType.TEXT);
		
		className.set ("assets/locales/famfamfam_flag_icons.zip", __ASSET__assets_locales_famfamfam_flag_icons_zip);
		type.set ("assets/locales/famfamfam_flag_icons.zip", AssetType.BINARY);
		
		className.set ("assets/locales/index.xml", __ASSET__assets_locales_index_xml);
		type.set ("assets/locales/index.xml", AssetType.TEXT);
		
		className.set ("assets/locales/it-IT/fonts.xml", __ASSET__assets_locales_it_it_fonts_xml);
		type.set ("assets/locales/it-IT/fonts.xml", AssetType.TEXT);
		
		className.set ("assets/locales/it-IT/ui.csv", __ASSET__assets_locales_it_it_ui_csv);
		type.set ("assets/locales/it-IT/ui.csv", AssetType.TEXT);
		
		className.set ("assets/locales/nl-NL/fonts.xml", __ASSET__assets_locales_nl_nl_fonts_xml);
		type.set ("assets/locales/nl-NL/fonts.xml", AssetType.TEXT);
		
		className.set ("assets/locales/nl-NL/ui.csv", __ASSET__assets_locales_nl_nl_ui_csv);
		type.set ("assets/locales/nl-NL/ui.csv", AssetType.TEXT);
		
		className.set ("assets/locales/_flags/en-GB.png", __ASSET__assets_locales__flags_en_gb_png);
		type.set ("assets/locales/_flags/en-GB.png", AssetType.IMAGE);
		
		className.set ("assets/locales/_flags/es-ES.png", __ASSET__assets_locales__flags_es_es_png);
		type.set ("assets/locales/_flags/es-ES.png", AssetType.IMAGE);
		
		className.set ("assets/locales/_flags/it-IT.png", __ASSET__assets_locales__flags_it_it_png);
		type.set ("assets/locales/_flags/it-IT.png", AssetType.IMAGE);
		
		className.set ("assets/locales/_flags/nl-NL.png", __ASSET__assets_locales__flags_nl_nl_png);
		type.set ("assets/locales/_flags/nl-NL.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_light_small.png", __ASSET__styles_gradient_cross_light_small_png);
		type.set ("styles/gradient/cross_light_small.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gradient.css", __ASSET__styles_gradient_gradient_css);
		type.set ("styles/gradient/gradient.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient.min.css", __ASSET__styles_gradient_gradient_min_css);
		type.set ("styles/gradient/gradient.min.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient_mobile.css", __ASSET__styles_gradient_gradient_mobile_css);
		type.set ("styles/gradient/gradient_mobile.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient_mobile.min.css", __ASSET__styles_gradient_gradient_mobile_min_css);
		type.set ("styles/gradient/gradient_mobile.min.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/hsplitter_gripper.png", __ASSET__styles_gradient_hsplitter_gripper_png);
		type.set ("styles/gradient/hsplitter_gripper.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/vsplitter_gripper.png", __ASSET__styles_gradient_vsplitter_gripper_png);
		type.set ("styles/gradient/vsplitter_gripper.png", AssetType.IMAGE);
		
		className.set ("styles/windows/accordion.css", __ASSET__styles_windows_accordion_css);
		type.set ("styles/windows/accordion.css", AssetType.TEXT);
		
		className.set ("styles/windows/accordion.min.css", __ASSET__styles_windows_accordion_min_css);
		type.set ("styles/windows/accordion.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		
		className.set ("styles/windows/buttons.css", __ASSET__styles_windows_buttons_css);
		type.set ("styles/windows/buttons.css", AssetType.TEXT);
		
		className.set ("styles/windows/buttons.min.css", __ASSET__styles_windows_buttons_min_css);
		type.set ("styles/windows/buttons.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/calendar.css", __ASSET__styles_windows_calendar_css);
		type.set ("styles/windows/calendar.css", AssetType.TEXT);
		
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/listview.css", __ASSET__styles_windows_listview_css);
		type.set ("styles/windows/listview.css", AssetType.TEXT);
		
		className.set ("styles/windows/listview.min.css", __ASSET__styles_windows_listview_min_css);
		type.set ("styles/windows/listview.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		
		className.set ("styles/windows/menus.css", __ASSET__styles_windows_menus_css);
		type.set ("styles/windows/menus.css", AssetType.TEXT);
		
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popups.css", __ASSET__styles_windows_popups_css);
		type.set ("styles/windows/popups.css", AssetType.TEXT);
		
		className.set ("styles/windows/rtf.css", __ASSET__styles_windows_rtf_css);
		type.set ("styles/windows/rtf.css", AssetType.TEXT);
		
		className.set ("styles/windows/scrolls.css", __ASSET__styles_windows_scrolls_css);
		type.set ("styles/windows/scrolls.css", AssetType.TEXT);
		
		className.set ("styles/windows/scrolls.min.css", __ASSET__styles_windows_scrolls_min_css);
		type.set ("styles/windows/scrolls.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/sliders.css", __ASSET__styles_windows_sliders_css);
		type.set ("styles/windows/sliders.css", AssetType.TEXT);
		
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		
		className.set ("styles/windows/tabs.css", __ASSET__styles_windows_tabs_css);
		type.set ("styles/windows/tabs.css", AssetType.TEXT);
		
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/windows.css", __ASSET__styles_windows_windows_css);
		type.set ("styles/windows/windows.css", AssetType.TEXT);
		
		className.set ("fonts/Oxygen-Bold.eot", __ASSET__fonts_oxygen_bold_eot);
		type.set ("fonts/Oxygen-Bold.eot", AssetType.BINARY);
		
		className.set ("fonts/Oxygen-Bold.svg", __ASSET__fonts_oxygen_bold_svg);
		type.set ("fonts/Oxygen-Bold.svg", AssetType.TEXT);
		
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		
		className.set ("fonts/Oxygen-Bold.woff", __ASSET__fonts_oxygen_bold_woff);
		type.set ("fonts/Oxygen-Bold.woff", AssetType.BINARY);
		
		className.set ("fonts/Oxygen-Bold.woff2", __ASSET__fonts_oxygen_bold_woff2);
		type.set ("fonts/Oxygen-Bold.woff2", AssetType.BINARY);
		
		className.set ("fonts/Oxygen.eot", __ASSET__fonts_oxygen_eot);
		type.set ("fonts/Oxygen.eot", AssetType.BINARY);
		
		className.set ("fonts/Oxygen.svg", __ASSET__fonts_oxygen_svg);
		type.set ("fonts/Oxygen.svg", AssetType.TEXT);
		
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		
		className.set ("fonts/Oxygen.woff", __ASSET__fonts_oxygen_woff);
		type.set ("fonts/Oxygen.woff", AssetType.BINARY);
		
		className.set ("fonts/Oxygen.woff2", __ASSET__fonts_oxygen_woff2);
		type.set ("fonts/Oxygen.woff2", AssetType.BINARY);
		
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_hvd_comic_serif_pro_otf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_blue_button07_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_blue_button08_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_green_button07_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_sheet_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_simple_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_locales_en_gb_aui_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_en_gb_fonts_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_en_gb_ui_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_es_es_fonts_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_es_es_ui_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_famfamfam_flag_icons_zip extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_index_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_it_it_fonts_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_it_it_ui_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_nl_nl_fonts_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales_nl_nl_ui_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_locales__flags_en_gb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_locales__flags_es_es_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_locales__flags_it_it_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_locales__flags_nl_nl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_collapse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_cross_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_expand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_up_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_left_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_up_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_circle_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_dark_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_light_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_min_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_mobile_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_mobile_min_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_horizontal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_vertical_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_vertical_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_hsplitter_gripper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_vsplitter_gripper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_accordion_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_accordion_min_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_buttons_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_buttons_min_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_calendar_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_checkbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_container_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_down_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_left_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_right_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_up_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_hprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_hscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_min_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_menus_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_optionbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_popup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_popups_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_rtf_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_scrolls_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_scrolls_min_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_sliders_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_tabs_css extends null { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_textinput_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_vprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_vscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_windows_css extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_eot extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_svg extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_woff extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_woff2 extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_eot extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_svg extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_woff extends null { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_woff2 extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }


#elseif html5


@:keep #if display private #end class __ASSET__assets_hvd_comic_serif_pro_otf extends lime.text.Font { public function new () { super (); name = "HVD Comic Serif Pro"; } } 

























@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 






































































@:keep #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends lime.text.Font { public function new () { super (); name = "Oxygen Bold"; } } 




@:keep #if display private #end class __ASSET__fonts_oxygen_ttf extends lime.text.Font { public function new () { super (); name = "Oxygen Regular"; } } 


































#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:font("assets/HVD_Comic_Serif_Pro.otf") #if display private #end class __ASSET__assets_hvd_comic_serif_pro_otf extends lime.text.Font {}
@:image("assets/images/blue_button07.png") #if display private #end class __ASSET__assets_images_blue_button07_png extends lime.graphics.Image {}
@:image("assets/images/blue_button08.png") #if display private #end class __ASSET__assets_images_blue_button08_png extends lime.graphics.Image {}
@:image("assets/images/green_button07.png") #if display private #end class __ASSET__assets_images_green_button07_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/sheet_button.png") #if display private #end class __ASSET__assets_images_sheet_button_png extends lime.graphics.Image {}
@:image("assets/images/Simple_Button.png") #if display private #end class __ASSET__assets_images_simple_button_png extends lime.graphics.Image {}
@:file("assets/locales/en-GB/aui.csv") #if display private #end class __ASSET__assets_locales_en_gb_aui_csv extends lime.utils.Bytes {}
@:file("assets/locales/en-GB/fonts.xml") #if display private #end class __ASSET__assets_locales_en_gb_fonts_xml extends lime.utils.Bytes {}
@:file("assets/locales/en-GB/ui.txt") #if display private #end class __ASSET__assets_locales_en_gb_ui_txt extends lime.utils.Bytes {}
@:file("assets/locales/es-ES/fonts.xml") #if display private #end class __ASSET__assets_locales_es_es_fonts_xml extends lime.utils.Bytes {}
@:file("assets/locales/es-ES/ui.csv") #if display private #end class __ASSET__assets_locales_es_es_ui_csv extends lime.utils.Bytes {}
@:file("assets/locales/famfamfam_flag_icons.zip") #if display private #end class __ASSET__assets_locales_famfamfam_flag_icons_zip extends lime.utils.Bytes {}
@:file("assets/locales/index.xml") #if display private #end class __ASSET__assets_locales_index_xml extends lime.utils.Bytes {}
@:file("assets/locales/it-IT/fonts.xml") #if display private #end class __ASSET__assets_locales_it_it_fonts_xml extends lime.utils.Bytes {}
@:file("assets/locales/it-IT/ui.csv") #if display private #end class __ASSET__assets_locales_it_it_ui_csv extends lime.utils.Bytes {}
@:file("assets/locales/nl-NL/fonts.xml") #if display private #end class __ASSET__assets_locales_nl_nl_fonts_xml extends lime.utils.Bytes {}
@:file("assets/locales/nl-NL/ui.csv") #if display private #end class __ASSET__assets_locales_nl_nl_ui_csv extends lime.utils.Bytes {}
@:image("assets/locales/_flags/en-GB.png") #if display private #end class __ASSET__assets_locales__flags_en_gb_png extends lime.graphics.Image {}
@:image("assets/locales/_flags/es-ES.png") #if display private #end class __ASSET__assets_locales__flags_es_es_png extends lime.graphics.Image {}
@:image("assets/locales/_flags/it-IT.png") #if display private #end class __ASSET__assets_locales__flags_it_it_png extends lime.graphics.Image {}
@:image("assets/locales/_flags/nl-NL.png") #if display private #end class __ASSET__assets_locales__flags_nl_nl_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,0,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/default/circle.png") #if display private #end class __ASSET__styles_default_circle_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/default/collapse.png") #if display private #end class __ASSET__styles_default_collapse_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/default/cross.png") #if display private #end class __ASSET__styles_default_cross_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/default/expand.png") #if display private #end class __ASSET__styles_default_expand_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/default/up_down.png") #if display private #end class __ASSET__styles_default_up_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_down.png") #if display private #end class __ASSET__styles_gradient_arrow_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_down_dark.png") #if display private #end class __ASSET__styles_gradient_arrow_down_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_down_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_down_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_left.png") #if display private #end class __ASSET__styles_gradient_arrow_left_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_left_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_left_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_right.png") #if display private #end class __ASSET__styles_gradient_arrow_right_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_right2.png") #if display private #end class __ASSET__styles_gradient_arrow_right2_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_right_dark.png") #if display private #end class __ASSET__styles_gradient_arrow_right_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_right_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_right_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_up.png") #if display private #end class __ASSET__styles_gradient_arrow_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/arrow_up_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_up_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/circle_dark.png") #if display private #end class __ASSET__styles_gradient_circle_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/cross_dark.png") #if display private #end class __ASSET__styles_gradient_cross_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/cross_dark_disabled.png") #if display private #end class __ASSET__styles_gradient_cross_dark_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/cross_light_small.png") #if display private #end class __ASSET__styles_gradient_cross_light_small_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/gradient.css") #if display private #end class __ASSET__styles_gradient_gradient_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/gradient.min.css") #if display private #end class __ASSET__styles_gradient_gradient_min_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/gradient_mobile.css") #if display private #end class __ASSET__styles_gradient_gradient_mobile_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/gradient_mobile.min.css") #if display private #end class __ASSET__styles_gradient_gradient_mobile_min_css extends lime.utils.Bytes {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/gripper_horizontal.png") #if display private #end class __ASSET__styles_gradient_gripper_horizontal_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/gripper_horizontal_disabled.png") #if display private #end class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/gripper_vertical.png") #if display private #end class __ASSET__styles_gradient_gripper_vertical_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/gripper_vertical_disabled.png") #if display private #end class __ASSET__styles_gradient_gripper_vertical_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/hsplitter_gripper.png") #if display private #end class __ASSET__styles_gradient_hsplitter_gripper_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/gradient/vsplitter_gripper.png") #if display private #end class __ASSET__styles_gradient_vsplitter_gripper_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/accordion.css") #if display private #end class __ASSET__styles_windows_accordion_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/accordion.min.css") #if display private #end class __ASSET__styles_windows_accordion_min_css extends lime.utils.Bytes {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/button.png") #if display private #end class __ASSET__styles_windows_button_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/buttons.css") #if display private #end class __ASSET__styles_windows_buttons_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/buttons.min.css") #if display private #end class __ASSET__styles_windows_buttons_min_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/calendar.css") #if display private #end class __ASSET__styles_windows_calendar_css extends lime.utils.Bytes {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/checkbox.png") #if display private #end class __ASSET__styles_windows_checkbox_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/container.png") #if display private #end class __ASSET__styles_windows_container_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/down_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_down_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/left_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_left_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/right_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_right_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/up_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_up_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/hprogress.png") #if display private #end class __ASSET__styles_windows_hprogress_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/hscroll.png") #if display private #end class __ASSET__styles_windows_hscroll_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/listview.css") #if display private #end class __ASSET__styles_windows_listview_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/listview.min.css") #if display private #end class __ASSET__styles_windows_listview_min_css extends lime.utils.Bytes {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/listview.png") #if display private #end class __ASSET__styles_windows_listview_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/menus.css") #if display private #end class __ASSET__styles_windows_menus_css extends lime.utils.Bytes {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/optionbox.png") #if display private #end class __ASSET__styles_windows_optionbox_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/popup.png") #if display private #end class __ASSET__styles_windows_popup_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/popups.css") #if display private #end class __ASSET__styles_windows_popups_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/rtf.css") #if display private #end class __ASSET__styles_windows_rtf_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/scrolls.css") #if display private #end class __ASSET__styles_windows_scrolls_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/scrolls.min.css") #if display private #end class __ASSET__styles_windows_scrolls_min_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/sliders.css") #if display private #end class __ASSET__styles_windows_sliders_css extends lime.utils.Bytes {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/tab.png") #if display private #end class __ASSET__styles_windows_tab_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/tabs.css") #if display private #end class __ASSET__styles_windows_tabs_css extends lime.utils.Bytes {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/textinput.png") #if display private #end class __ASSET__styles_windows_textinput_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/vprogress.png") #if display private #end class __ASSET__styles_windows_vprogress_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/vscroll.png") #if display private #end class __ASSET__styles_windows_vscroll_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/styles/windows/windows.css") #if display private #end class __ASSET__styles_windows_windows_css extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen-Bold.eot") #if display private #end class __ASSET__fonts_oxygen_bold_eot extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen-Bold.svg") #if display private #end class __ASSET__fonts_oxygen_bold_svg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen-Bold.ttf") #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends lime.text.Font {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen-Bold.woff") #if display private #end class __ASSET__fonts_oxygen_bold_woff extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen-Bold.woff2") #if display private #end class __ASSET__fonts_oxygen_bold_woff2 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen.eot") #if display private #end class __ASSET__fonts_oxygen_eot extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen.svg") #if display private #end class __ASSET__fonts_oxygen_svg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen.ttf") #if display private #end class __ASSET__fonts_oxygen_ttf extends lime.text.Font {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen.woff") #if display private #end class __ASSET__fonts_oxygen_woff extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,8,18/assets/fonts/Oxygen.woff2") #if display private #end class __ASSET__fonts_oxygen_woff2 extends lime.utils.Bytes {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_arrow_down.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_arrow_left.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_arrow_right.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_arrow_up.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_thin.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/button_toggle.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/check_box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/check_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/chrome.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/chrome_flat.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/chrome_inset.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/chrome_light.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/dropdown_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/finger_big.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/finger_small.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/hilight.png") #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/invis.png") #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/minus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/plus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/radio.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/radio_dot.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/swatch.png") #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/tab.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/tab_back.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/images/tooltip_arrow.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/xml/defaults.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/xml/default_loading_screen.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,0,0/assets/xml/default_popup.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends lime.utils.Bytes {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_hvd_comic_serif_pro_otf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_hvd_comic_serif_pro_otf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_oxygen_bold_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_oxygen_bold_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_oxygen_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__fonts_oxygen_ttf (); src = font.src; name = font.name; super (); }}

#end

#end