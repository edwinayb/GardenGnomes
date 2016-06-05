package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/HVD_Comic_Serif_Pro.otf", "assets/HVD_Comic_Serif_Pro.otf");
			type.set ("assets/HVD_Comic_Serif_Pro.otf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/images/DecorTabBtn.png", "assets/images/DecorTabBtn.png");
			type.set ("assets/images/DecorTabBtn.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Dirt.png", "assets/images/Dirt.png");
			type.set ("assets/images/Dirt.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Gnome1.png", "assets/images/Gnome1.png");
			type.set ("assets/images/Gnome1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/GnomeTab.png", "assets/images/GnomeTab.png");
			type.set ("assets/images/GnomeTab.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Grass.png", "assets/images/Grass.png");
			type.set ("assets/images/Grass.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/House.png", "assets/images/House.png");
			type.set ("assets/images/House.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sheet_button.png", "assets/images/sheet_button.png");
			type.set ("assets/images/sheet_button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Sky.png", "assets/images/Sky.png");
			type.set ("assets/images/Sky.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/StoreManager.png", "assets/images/StoreManager.png");
			type.set ("assets/images/StoreManager.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/UpgradesTabBtn.png", "assets/images/UpgradesTabBtn.png");
			type.set ("assets/images/UpgradesTabBtn.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/WindowBox.png", "assets/images/WindowBox.png");
			type.set ("assets/images/WindowBox.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/locales/en-GB/aui.csv", "assets/locales/en-GB/aui.csv");
			type.set ("assets/locales/en-GB/aui.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/en-GB/fonts.xml", "assets/locales/en-GB/fonts.xml");
			type.set ("assets/locales/en-GB/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/en-GB/ui.txt", "assets/locales/en-GB/ui.txt");
			type.set ("assets/locales/en-GB/ui.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/es-ES/fonts.xml", "assets/locales/es-ES/fonts.xml");
			type.set ("assets/locales/es-ES/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/es-ES/ui.csv", "assets/locales/es-ES/ui.csv");
			type.set ("assets/locales/es-ES/ui.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/famfamfam_flag_icons.zip", "assets/locales/famfamfam_flag_icons.zip");
			type.set ("assets/locales/famfamfam_flag_icons.zip", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/locales/index.xml", "assets/locales/index.xml");
			type.set ("assets/locales/index.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/it-IT/fonts.xml", "assets/locales/it-IT/fonts.xml");
			type.set ("assets/locales/it-IT/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/it-IT/ui.csv", "assets/locales/it-IT/ui.csv");
			type.set ("assets/locales/it-IT/ui.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/nl-NL/fonts.xml", "assets/locales/nl-NL/fonts.xml");
			type.set ("assets/locales/nl-NL/fonts.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/nl-NL/ui.csv", "assets/locales/nl-NL/ui.csv");
			type.set ("assets/locales/nl-NL/ui.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/locales/_flags/en-GB.png", "assets/locales/_flags/en-GB.png");
			type.set ("assets/locales/_flags/en-GB.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/locales/_flags/es-ES.png", "assets/locales/_flags/es-ES.png");
			type.set ("assets/locales/_flags/es-ES.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/locales/_flags/it-IT.png", "assets/locales/_flags/it-IT.png");
			type.set ("assets/locales/_flags/it-IT.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/locales/_flags/nl-NL.png", "assets/locales/_flags/nl-NL.png");
			type.set ("assets/locales/_flags/nl-NL.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/box.png", "flixel/flixel-ui/img/box.png");
			type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button.png", "flixel/flixel-ui/img/button.png");
			type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_arrow_down.png", "flixel/flixel-ui/img/button_arrow_down.png");
			type.set ("flixel/flixel-ui/img/button_arrow_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_arrow_left.png", "flixel/flixel-ui/img/button_arrow_left.png");
			type.set ("flixel/flixel-ui/img/button_arrow_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_arrow_right.png", "flixel/flixel-ui/img/button_arrow_right.png");
			type.set ("flixel/flixel-ui/img/button_arrow_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_arrow_up.png", "flixel/flixel-ui/img/button_arrow_up.png");
			type.set ("flixel/flixel-ui/img/button_arrow_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_thin.png", "flixel/flixel-ui/img/button_thin.png");
			type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/button_toggle.png", "flixel/flixel-ui/img/button_toggle.png");
			type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/check_box.png", "flixel/flixel-ui/img/check_box.png");
			type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/check_mark.png", "flixel/flixel-ui/img/check_mark.png");
			type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/chrome.png", "flixel/flixel-ui/img/chrome.png");
			type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/chrome_flat.png", "flixel/flixel-ui/img/chrome_flat.png");
			type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/chrome_inset.png", "flixel/flixel-ui/img/chrome_inset.png");
			type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/chrome_light.png", "flixel/flixel-ui/img/chrome_light.png");
			type.set ("flixel/flixel-ui/img/chrome_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/dropdown_mark.png", "flixel/flixel-ui/img/dropdown_mark.png");
			type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/finger_big.png", "flixel/flixel-ui/img/finger_big.png");
			type.set ("flixel/flixel-ui/img/finger_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/finger_small.png", "flixel/flixel-ui/img/finger_small.png");
			type.set ("flixel/flixel-ui/img/finger_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/hilight.png", "flixel/flixel-ui/img/hilight.png");
			type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/invis.png", "flixel/flixel-ui/img/invis.png");
			type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/minus_mark.png", "flixel/flixel-ui/img/minus_mark.png");
			type.set ("flixel/flixel-ui/img/minus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/plus_mark.png", "flixel/flixel-ui/img/plus_mark.png");
			type.set ("flixel/flixel-ui/img/plus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/radio.png", "flixel/flixel-ui/img/radio.png");
			type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/radio_dot.png", "flixel/flixel-ui/img/radio_dot.png");
			type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/swatch.png", "flixel/flixel-ui/img/swatch.png");
			type.set ("flixel/flixel-ui/img/swatch.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/tab.png", "flixel/flixel-ui/img/tab.png");
			type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/tab_back.png", "flixel/flixel-ui/img/tab_back.png");
			type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/img/tooltip_arrow.png", "flixel/flixel-ui/img/tooltip_arrow.png");
			type.set ("flixel/flixel-ui/img/tooltip_arrow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/flixel-ui/xml/defaults.xml", "flixel/flixel-ui/xml/defaults.xml");
			type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/flixel-ui/xml/default_loading_screen.xml", "flixel/flixel-ui/xml/default_loading_screen.xml");
			type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/flixel-ui/xml/default_popup.xml", "flixel/flixel-ui/xml/default_popup.xml");
			type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
