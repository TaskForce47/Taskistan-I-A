////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Willard, v1.063, #Xuxewa)
////////////////////////////////////////////////////////
class tf47_umenu_ft_dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['tf47_core_umenu_ft_dialog_var',_this select 0]; [_this] call tf47_core_umenu_ft_fnc_onLoadFt;";
	onUnLoad = "uiNamespace setVariable ['tf47_core_umenu_ft_dialog_var',nil]";
	class ControlsBackground
	{
		class tf47_umenu_ft_background: tf47_umenu_base_rsctext
		{
			idc = 1000;
			x = 0.376249 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.27 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};

		class tf47_umenu_ft_title: tf47_umenu_base_rsctext
		{
			idc = 1001;
			text = "TF47 U-Menu"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.333 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
		};
	};
	class Controls 
	{
		class tf47_umenu_ft_frame: tf47_umenu_base_frame
		{
			idc = 1800;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.253 * safezoneH;
		};		
		class tf47_umenu_ft_listbox: tf47_umenu_base_listbox
		{
			idc = 1801;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class tf47_umenu_ft_typetext: tf47_umenu_base_rsctext
		{
			idc = 1002;
			text = "Type:"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_ft_callsigntext: tf47_umenu_base_rsctext
		{
			idc = 1003;
			text = "Callsign:"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_ft_callsginedit: tf47_umenu_base_rscedit
		{
			idc = 1400;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_ft_leadtext: tf47_umenu_base_rsctext
		{
			idc = 1004;
			text = "Leader:"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_ft_leadedit: tf47_umenu_base_rscedit
		{
			idc = 1401;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_ft_freqtext: tf47_umenu_base_rsctext
		{
			idc = 1005;
			text = "Internal channel:"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_ft_typecombo: tf47_umenu_base_combo
		{
			idc = 2100;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_ft_freqedit: tf47_umenu_base_rscedit
		{
			idc = 1402;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class tf47_umenu_ft_closebtn: tf47_umenu_base_rscbutton_main
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0;";
		};
		class tf47_umenu_ft_backbtn: tf47_umenu_base_rscbutton_main
		{
			idc = 1601;
			text = "Back"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "closeDialog 0; createDialog 'tf47_umenu_main_dialog';";
		};
		class tf47_umenu_ft_deletebtn: tf47_umenu_base_rscbutton_main
		{
			idc = 1602;
			text = "Delete"; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[] call tf47_core_umenu_ft_fnc_deleteTeam;";
		};
		class tf47_umenu_ft_applybtn: tf47_umenu_base_rscbutton_main
		{
			idc = 1603;
			text = "Create"; //--- ToDo: Localize;
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[] call tf47_core_umenu_ft_fnc_createTeam;";
		};
		class tf47_umenu_ft_callsigncombo: tf47_umenu_base_combo
		{
			idc = 2101;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
