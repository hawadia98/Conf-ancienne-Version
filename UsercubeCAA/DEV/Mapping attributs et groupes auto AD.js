var IAMADIntegration = Class.create();
IAMADIntegration.prototype = {
	initialize: function () {},

	//Define the mapping field from Identity table field to AD property
	FIELD_MAPPING: {
		"cn": "u_preferred_login",
		"name": "u_preferred_login",
		"givenname": "u_first_name",
		"sn": "u_last_name",
		"displayname": "name",
		"userprincipalname": "u_preferred_login",
		"samaccountname": "u_preferred_login",
		"User Name": "u_preferred_login",
		"department": "department",
		"mobile": "u_mobile_phone",
		"mail": "u_email_address",
		"businesscategory": "department",
		"pacmatricule": "u_pacmatricule",
		"paciup": "u_paciup",
		"pacugs": "location",
		"ipphone": "u_short_phone",
		"company": "u_pacpartnercompany",
		"employeenumber": "u_business_phone",
		"initials": "u_trigram",
		"physicaldeliveryofficename": "u_office_number",
		"telephonenumber": "u_business_phone",
		"extensionattribute1": "company",
		"extensionattribute2": "u_function", //"u_contract_type",
		"mdboverhardquotalimit": "location",
		"mdboverquotalimit": "location",
		"mdbstoragequota": "location",
		//"flags": "u_contract_type",
		"gcaattribute1": "u_contract_type",
		"title": "u_contract_type",
		"pacaffichintra": "u_displayed_in_phone_book", //"u_pacaffichintra",
		"extensionattribute3" : "u_otpsms",
		"extensionattribute14" : "ORG4",
		"proxyaddresses": "mail", //SMTP: <mail>
	},

	LOCATION_GROUP_MAPPING: {
		"R01": "CN=G_viaren,OU=VIAREN,OU=Pacifica,OU=Groupes Globaux,OU=Groupes",
		"R02": "CN=G_viaren,OU=VIAREN,OU=Pacifica,OU=Groupes Globaux,OU=Groupes",
		"T01": "CN=G_Viavita,OU=VIAVITA,OU=Pacifica,OU=Groupes Globaux,OU=Groupes",
		"S00": "CN=GS_EZOPTIMA_S00,OU=Groupes",
		"N01": "CN=GS_EZOPTIMA_S00,OU=Groupes",
		"F01": "CN=GS_EZOPTIMA_S00,OU=Groupes",
		"S01": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S02": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S03": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S04": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S05": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S06": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S07": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S08": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S09": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S10": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S11": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S12": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S13": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S14": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S15": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"SE1": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S80": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"C02": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"PG0": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"PG1": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S80_Lyon": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S80_LRY": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"S80_Arras": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		//"S80_Arras": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		//"S80_LRY": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		//"S80_Lyon": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"SJ1": "CN=GS_EZOPTIMA_PJ,OU=Groupes",
		"SJ2": "CN=GS_EZOPTIMA_PJ,OU=Groupes",
		"SJ3": "CN=GS_EZOPTIMA_PJ,OU=Groupes",
		"SJ4": "CN=GS_EZOPTIMA_PJ,OU=Groupes",
		"SJ5": "CN=GS_EZOPTIMA_PJ,OU=Groupes",
		"SJ6": "CN=GS_EZOPTIMA_PJ,OU=Groupes",
		"SR1": "CN=GS_EZOPTIMA_SR,OU=Groupes",
		"SR2": "CN=GS_EZOPTIMA_SR,OU=Groupes"
	},

	DEFAULT_OU: "OU=Utilisateurs",
	ADM_OU: "OU=Comptes,OU=Production,OU=Tier2,OU=ADMINISTRATION",

	SPECIAL_GROUPS: {
		"GS_PACIFICA_INTERNES_S00": "CN=GS_PACIFICA_INTERNES_S00,OU=Groupes",	
		"GS_PACIFICA_INTERNES_SXX": "CN=GS_PACIFICA_INTERNES_SXX,OU=Groupes",
		"G_USR_Commun_UtilisateursW7": "CN=G_USR_Commun_UtilisateursW7,OU=Windows7,OU=Groupes Globaux,OU=Groupes",
		"groupe_internet": "CN=groupe_internet,OU=Pacifica,OU=Utilisateurs",
		"G_viaren": "CN=G_viaren,OU=VIAREN,OU=Pacifica,OU=Groupes Globaux,OU=Groupes",
		"G_Viavita": "CN=G_Viavita,OU=VIAVITA,OU=Pacifica,OU=Groupes Globaux,OU=Groupes",
		"GS_EZOPTIMA_S00": "CN=GS_EZOPTIMA_S00,OU=Groupes",
		"GS_EZOPTIMA_IARD": "CN=GS_EZOPTIMA_IARD,OU=Groupes",
		"GS_EZOPTIMA_PJ": "CN=GS_EZOPTIMA_PJ,OU=Groupes",
		"GS_EZOPTIMA_SR": "CN=GS_EZOPTIMA_SR,OU=Groupes",
		"G_SPC_VDI_UtilisateursW7": "CN=G_SPC_VDI_UtilisateursW7,OU=Windows7,OU=Groupes Globaux,OU=Groupes",
		"Nomades_SSL": "CN=Nomades_SSL,OU=Profils applicatifs,OU=Groupes",
		"GS_A_CA-PACIFICA_PACIFICA_Licence_Seattle_AudioConference": "CN=GS_A_CA-PACIFICA_PACIFICA_Licence_Seattle_AudioConference,OU=AZURE,OU=Groupes",
		"GS_A_CA-PACIFICA_PACIFICA_Licence_Teams_R1": "CN=GS_A_CA-PACIFICA_PACIFICA_Licence_Teams_R1,OU=AZURE,OU=Groupes",
	},

	// Mailbox Quota
	DIRECTOR_MAILBOXQUOTA_CODE: ["2", "3", "8", "13", "14", "18", "20", "22", "24", "28", "30"],
	DIRECTOR_MAILBOXQUOTA: {
		"warning": "2.5gb",
		"send": "2.75gb",
		"receive": "3gb"
	},
	DEFAULT_MAILBOXQUOTA: {
		"warning": "900mb",
		"send": "950mb",
		"receive": "1gb"
	},


	////////////////////////
	// User ADM
	////////////////////////

	setupADMPayload: function (identity, outputs) {
		/*
        "cn": "u_preferred_login",
        "name": "u_preferred_login",
        "samaccountname": "u_preferred_login",
        "givenname": "u_first_name",
        "sn": "u_last_name",
        "displayname": "name",
        "userprincipalname": "u_email_address",
        "department": "department",
        "businesscategory": "department",
        */

		var adm = ("T2_A" + identity.getValue("u_paciup")).slice(0, 20);

		outputs.cn = adm;
		outputs.name = adm;
		outputs.samaccountname = adm;
		outputs.userprincipalname = adm + "@ca-pacifica.fr";
		outputs.givenname = this._defaultPolicy(identity, "u_first_name");
		outputs.sn = this._defaultPolicy(identity, "u_last_name");
		outputs.displayname = this._defaultPolicy(identity, "name");
		outputs.department = this._getDepartment(identity, "department");
		outputs.businesscategory = this._getBusinessCategory(identity, "department");
		// And finally the OU
		outputs.path = this.ADM_OU + "," + this.getDC();

		return outputs;

	},


	/*
     * Build ouputs from record fields. All field used default policy (copie) except some.
     */
	setupPayload: function (identity, outputs) {
		var inputs = {};
		var MAPPING = this.FIELD_MAPPING;
		Object.keys(MAPPING).forEach(function (key) {
			var field = MAPPING[key];
			switch (key) {
				case "department":
					inputs[key] = this._getDepartment(identity, field);
					break;
				case "pacugs":
					inputs[key] = this._getLocationTrigramm(identity, field);
					break;
				case "employeenumber":
					inputs[key] = this._getEmployeeNumber(identity, field);
					break;
				case "businesscategory":
					inputs[key] = this._getBusinessCategory(identity, field);
					break;
				case "extensionattribute1":
					inputs[key] = this._getextensionAttribute1(identity, field);
					break;
				case "extensionattribute2":
					inputs[key] = this._getextensionAttribute2(identity, field);
					break;
				case "extensionattribute14":
					inputs[key] = this._getextensionAttribute14(identity, field);
					break;
				case "title":
					inputs[key] = this._getTitle(identity, field);
					break;
				case "flags":
					var flags = this._getFlags(identity, field);
					if (flags)
						inputs[key] = flags;
					break;
				case "gcaattribute1":
					inputs[key] = this._getgCAAttribute1(identity, field);
					break;
				case "pacaffichintra":
					inputs[key] = this._getPacaffichintra(identity, field);
					break;
				case "mdboverhardquotalimit":
				case "mdboverquotalimit":
				case "mdbstoragequota":
					//inputs[key] = this._getQuotaLimit(identity, key);
					inputs[key] = "";
					break;
				case "userprincipalname":
					inputs[key] = this._getUserprincipalname(identity, field);
					break;
				default:
					inputs[key] = this._defaultPolicy(identity, field);
			}
		}, this);


		var userInfo = {};
		var key;
		var error = new sn_ad_spoke.PacificaADErrorHandler();

		error.verifyInput(inputs.userprincipalname, "User Name");
		userInfo = new sn_ad_spoke.PacificaADUtil().cleanseInputObject(inputs, userInfo);

		for (key in userInfo)
			outputs[key] = userInfo[key];

		// And finally the OU
		outputs.path = this._getUserOU(identity, 'location');

		return outputs;
	},

	_defaultPolicy: function (identity, field) {
		return this._getValue(identity, field);
	},

	_getValue: function (identity, field) {
		var val = identity.getValue(field) || "";
		return val;
	},

	_getFlags: function (identity, field) {
		var flags = "";
		var internal = identity.getValue("u_internal") || "";

		if (internal == "1") {
			var loc = identity.location.u_code + "";
			if (loc == "S00" || loc == "F01" || loc == "N01") {
				var company = identity.getValue("u_pacpartnercompany") || "";
				if (company != "VIAREN" && company != "VIAVITA") {
					flags = 5;
				}
			}
		}
		return flags;
	},

	_getextensionAttribute14: function (identity, field) {  // O365
		return "ORG04";
	},

	_getMailDomain: function (identity) {
		var mail = this._defaultPolicy(identity, "u_email_address") || "";
		var arobasePosition = mail.lastIndexOf("@");
		var domain = "";
		if(arobasePosition > 0) {
			domain = mail.slice(mail.lastIndexOf("@"), mail.length);
		}
		return domain;
	},

	_getgCAAttribute1: function (identity, field) {  // Application Team
		var gcaattribute1 = "";
		var company = identity.getValue("u_pacpartnercompany") || "";
		var internal = identity.getValue("u_internal") || "";
		var location = identity.location.u_code || "";
		var ufunction = identity.getValue("u_function") || "";
		var company_dep = identity.company.getDisplayValue() + "";
		var status = identity.getValue("install_status") || "";

		var domain = this._getMailDomain(identity);
		if(domain == "@ca-assurances.fr") {
			gcaattribute1 = 2;
		} else if (company != "VIAVITA" && company_dep != "CAAS") {
			if (!(internal != "1" && location == "S80" && (ufunction == "7" || ufunction == "17" || ufunction == "23" || ufunction == "27"))) { // Exclude S80 GECO
				if(status == "1") { // Actif
					gcaattribute1 = 1;
				} else {
					gcaattribute1 = 2;
				}
			}
		}
		return gcaattribute1;
	},

	_getUserprincipalname: function (identity, field) {
		var upn = identity.getValue(field) || "" ; // equal to the samaccountname, already truncated at 20 char
		var domain = this._getMailDomain(identity);
		if(domain != '@viaren.fr') {  // domain to exclude
			upn = upn + "@ca-pacifica.fr";
		} else {
			upn = upn + domain;
		}
		
		return upn;
	},

	_getPacaffichintra: function (identity, field) {
		var res = "";
		var val = identity.getValue(field) || "";
		if (val == "0") {
			res = "N";
		} else {
			res = "O";
		}
		return res;
	},

	_getDisplayValue: function (identity, field) {
		var val = identity.getDisplayValue(field);
		return val;
	},

	// Special policies
	_getManager: function (identity, field) {
		// DONE in flow
		return "TODO";
	},

	_getextensionAttribute1: function (identity, field) {
		var r = '';
		var t = identity.getValue("u_pacpartnercompany") || "";
		if (t == "VIAVITA")
			r = "viavita.fr";
		else if (t == "VIAREN")
			r = "viaren.fr";
		return r;
	},

	_getextensionAttribute2: function (identity, field) {
		return this._getTitle(identity, field);
	},

	_getTitle: function (identity, field) {
		var r = identity.getValue("u_function") || "";
		return r;
	},

	_getProxyAddresses: function (identity, field) {
		return this._defaultPolicy(identity, field);
	},

	_getQuotaLimit: function (identity, field) {
		var r;
		var t = this._getLocationTrigramm(identity, 'location');
		switch (field) {
			case "mdboverhardquotalimit":
				r = (t == "S00" ? "380000" : "204800");
				break;
			case "mdboverquotalimit":
				r = (t == "S00" ? "400000" : "194560");
				break;
			case "mdbstoragequota":
				r = (t == "S00" ? "350000" : "184320");
				break;
			default:
				r = "N/A";
		}
		return r;
	},

	_getLocationTrigramm: function (identity, field) {
		var val = identity.location.u_code.getDisplayValue() + "";
		return val;
	},

	_getUserOU: function (identity, field) {
		var val = identity.location.u_ou + "";
		if (val)
			return val + "," + this.DEFAULT_OU + "," + this.getDC();
		else
			return this.DEFAULT_OU + "," + this.getDC();
	},

	_getBusinessCategory: function (identity, field) {
		var val = identity.department.u_iam_sigle.getDisplayValue() + "";
		return val;
	},

	_getDepartment: function (identity, field) {
		var val = "";
		var dep = identity.department.getDisplayValue() + "";
		val = dep.split("/")[0];
		return val;
	},

	_getEmployeeNumber: function (identity, field) {
		var n = "";
		var t = identity.location.u_code + "";
		if (t == "S00") {
			n = identity.getValue(field) || "";
			n = n.slice(-6);
		}
		return n;
	},

	errorHandler: function (inputs, outputs) {
		if (inputs.error_message || inputs.error_code) {
			outputs.status = "Error";
			outputs.error_message = "Error Code: " + inputs.errorCode + " Message: " + inputs.errorMessage;
		} else {
			outputs.status = "Success";
		}
		return outputs;
	},

	////////////////////////
	// End User AD
	////////////////////////


	////////////////////////////
	// User Group AD Mapping
	////////////////////////////

	getProfile: function (name) {

		if (name.indexOf("undefined") > -1) {
			return;
		}

		var profile = new GlideRecord("u_cmdb_ci_iam_access_profile");
		if (profile.get("name", name)) {
			return profile;
		}
	},

	/*
     * take two list of sys_id and we "calculate" what need to be remove and add from the first list to have thez second list. ex:
     *
     * start = [1,7,9,0]
     * end = [9,6,1,4,8]
     * diffProfiles = { "remove":[7,0],"add":[6,4,8]
     * So if we remove 7 and 0 from start and add 6,4,8 we get end = [9,6,1,4,8]
     */
	diffProfiles: function (start, end) {
		var r = {};
		var remove = this._diffProfiles(start, end);
		var add = this._diffProfiles(end, start);
		r.remove = remove;
		r.add = add;
		return r;
	},

	_diffProfiles: function (start, end) {
		var r = [];
		for (var i = 0; i < start.length; i++) {
			var keep = true;
			for (var j = 0; j < end.length; j++) {
				if (start[i] == end[j]) {
					keep = false;
				}
			}
			if (keep == true) {
				r.push(start[i]);
			}
		}
		return r;
	},

	/*
     * return a sys_id list of group or application profile
     *
     * To add a rule create a function _getProfile_RuleXX returning a Profile sys_id
     * and add the call to the function _getProfile_RuleXX in getSpecialProfiles
     * like below:
     *  profiles.push(this._getProfile_RuleXX(identity));
     */
	getSpecialProfiles: function (identity) {
		var profiles = [];

		profiles.push(this._getProfile_Rule1(identity));
		profiles.push(this._getProfile_Rule2(identity));
		profiles.push(this._getProfile_Rule3(identity));
		profiles.push(this._getProfile_Rule4(identity));
		profiles.push(this._getProfile_Rule5(identity));
		profiles.push(this._getProfile_Rule6(identity));
		profiles.push(this._getProfile_Rule7(identity));
		//profiles.push(this._getProfile_Rule8(identity));
		profiles.push(this._getProfile_Rule9(identity));
		profiles.push(this._getProfile_Rule10(identity));
		profiles.push(this._getProfile_Rule11(identity));
		profiles.push(this._getProfile_Rule12(identity));
		profiles.push(this._getProfile_Rule13(identity));
		// SCRCRE0001034
		//		profiles.push(this._getProfile_Rule16(identity));

		this._getProfile_Rule_Teams(identity).forEach(function (item) {
			profiles.push(item);
		});
		profiles.push(this._getProfile_Rule_G_VIAREN(identity));
		profiles.push(this._getProfile_Rule_ORG_DSIN_POLSPE_SIEGE(identity));
		profiles.push(this._getProfile_Rule_Dir_Transfo_NAS_N(identity));
		profiles.push(this._getProfile_Rule_Oracle_for_internals(identity));
		//profiles.push(this._getProfile_Rule_MyWorkSpace_Manager(identity));
		this._getProfile_Rule_MyPlace(identity).forEach(function (item) {
			profiles.push(item);
		});
		this._getProfile_Rule_CustomerRoom(identity).forEach(function (item) {
			profiles.push(item);
		});
		profiles.push(this._getProfile_Rule_PeopleAssist(identity));
		profiles.push(this._getProfile_Rule_PowerBiClientAuto(identity));
		profiles.push(this._getProfile_Rule_WINCHAPPS(identity));
		
		var profileIDs = [];
		profiles.forEach(function (p) {
			if (p) {
				profileIDs.push(p.sys_id + "");
			}
		});

		profileIDs = new global.ArrayUtil().unique(profileIDs);
		return profileIDs;
	},

	// Rule 1: Department ORG rule
	_getProfile_Rule1: function (identity) {
		var dep = '';
		dep = identity.department.name + '';
		if (dep != '') {
			dep = dep.replaceAll('/', '_');
			dep = "ORG_" + dep;
			return this.getProfile(dep);
		}
	},

	// Rule 2: Department @ rule
	_getProfile_Rule2: function (identity) {
		var suffix = '';
		var internal = identity.getValue("u_internal") || "";
		if (internal == "1") {
			suffix = "-Pacifica";
		} else {
			suffix = "-Externes";
		}
		var dep = '';
		dep = identity.department.name + '';

		// Exclude S80 GECO	
		var location = identity.location.u_code || "";
		if (internal != "1" && location == "S80") {
			dep = '';
		}

		if (dep != '') {
			//var name = dep.getValue("name");
			dep = dep.replaceAll('/', '.');
			dep = "@" + dep + suffix;
			return this.getProfile(dep);
		}
	},

	// Rule 3: Everyone get G_USR_Commun_UtilisateursW7
	_getProfile_Rule3: function (identity) {
		return this.getProfile("G_USR_Commun_UtilisateursW7");
	},

	// Rule 4: Everyone get groupe_internet
	_getProfile_Rule4: function (identity) {
		return this.getProfile("groupe_internet");
	},

	// Rule 5: Everyone get G_USR_Commun_UtilisateursW7_<site>
	_getProfile_Rule5: function (identity) {
		var loc = identity.location.u_code + '';
		if(loc == "N01" || loc == "F01") {  // Sieges
			loc = "S00";
		}
		return this.getProfile("G_USR_Commun_UtilisateursW7_" + loc);
	},

	// Rule 6: user internal -> GS_PACIFICA_INTERNES_SXX
	_getProfile_Rule6: function (identity) {
		var internal = identity.getValue("u_internal") || "";
		if (internal == "1") {
			return this.getProfile("GS_PACIFICA_INTERNES_SXX");
		}
	},

	// Rule 7: user internal & Pacifica -> GS_PACIFICA_INTERNES_S00
	_getProfile_Rule7: function (identity) {
		var internal = identity.getValue("u_internal") || "";
		if (internal == "1" && identity.location.u_code == "S00") {
			return this.getProfile("GS_PACIFICA_INTERNES_S00");
		}
	},

	// Rule 9: Special Group from location: G_viavita, G_Viaren, GS_EZOPTIMA_S00 ...
	// cf LOCATION_GROUP_MAPPING
	_getProfile_Rule9: function (identity) {
		var group = this.getGroupLocation(identity);
		return this.getProfile(group);
	},


	// Rule 10: Partner -> G_SPC_VDI_UtilisateursW7
	_getProfile_Rule10: function (identity) {
		var internal = identity.getValue("u_internal") || "";
		if (internal == "0" && identity.u_contract_type == "Partner") {
			return this.getProfile("G_SPC_VDI_UtilisateursW7");
		}
	},

	// Rule 11: Partner -> G_USR_Commun_UtilisateursW7_S00
	_getProfile_Rule11: function (identity) {
		var internal = identity.getValue("u_internal") || "";
		if (internal == "0" && identity.u_contract_type == "Partner") {
			return this.getProfile("G_USR_Commun_UtilisateursW7_S00");
		}
	},

	// Rule 12: Assistant -> Assistant<site>
	_getProfile_Rule12: function (identity) {
		var internal = identity.getValue("u_internal") || "";
		var loc = identity.location.u_code + '';
		if (!(loc == "S00" || loc == "F01" || (internal != "1" && loc == "S80"))) {
			return this.getProfile("Assistant" + loc);
		}
	},

	// Rule 13: Everyone get Nomades_SSL
	_getProfile_Rule13: function (identity) {
		return this.getProfile("Nomades_SSL"); 
	},

	// Rule for Teams: RITM0092548 application teams
	_getProfile_Rule_Teams: function (identity) {
		var teamProfiles = [];
		var company = identity.getValue("u_pacpartnercompany") || "";
		var internal = identity.getValue("u_internal") || "";
		var location = identity.location.u_code || "";
		var ufunction = identity.getValue("u_function") || "";
		var company_dep = identity.company.getDisplayValue() + "";

		var domain = this._getMailDomain(identity);
		if(domain == '@viaren.fr' || domain == '@ca-pacifica.fr') {
			teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_M365_AIP_defaultC2"));
			teamProfiles.push(this.getProfile("G_O365_USERS"));
		}

		if (company != "VIAVITA" && company_dep != "CAAS" && location != "S80") {
			teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_Licence_Seattle_R1_E3"));
			teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_Licence_Seattle_AudioConference_E3"));
			teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_Licence_Seattle_R2_E3"));
			teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_Licence_Seattle_AIP_E3"));	
			teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_NEWTEAM"));
			teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_Hautement_Confidentiel"));	
		}
		else if (location == "S80") {
			if (!(internal != "1" && (ufunction == "7" || ufunction == "17" || ufunction == "23" || ufunction == "27"))) { // Exclude S80 GECO non managers
				teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_Licence_Seattle_R1_E3"));
				teamProfiles.push(this.getProfile("GS_A_CA-PACIFICA_PACIFICA_Licence_Seattle_AudioConference_E3"));	
			}
		}		
		return teamProfiles;
	},	


	// Rule for G VIAREN
	_getProfile_Rule_G_VIAREN: function (identity) {
		var loc = identity.location.u_code + '';
		if (loc == "R01" || loc == "R02") {
			return this.getProfile("G_COMMUN_VIAREN");
		}
	},

	// Rule for ORG_DSIN_POLSPE_SIEGE
	_getProfile_Rule_ORG_DSIN_POLSPE_SIEGE: function (identity) {
		var val = identity.department.u_iam_sigle.getDisplayValue() + "";
		if (val == "DSIN/POLSPE") {
			return this.getProfile("ORG_DSIN_POLSPE_SIEGE");
		}
	},
	
	// Rule for Direction TRANSFO users which need access to the N: NAS
	_getProfile_Rule_Dir_Transfo_NAS_N: function (identity) {
		// var val = identity.department.name.getDisplayValue() + "";
		var val = this._getDepartment(identity, "department");
		if (val == "TRANSFO") {
			return this.getProfile("Lecteur N Transformation RW");
		}
	},

	// Rules for Oracle Note de frais for internals
	_getProfile_Rule_Oracle_for_internals: function (identity) {
		var internal = identity.getValue("u_internal") || "";
		var company = identity.company.getDisplayValue() || "";
		if (internal == "1") {
			if (company == "PACIFICA") {
				return this.getProfile("P_Oracle R12_Comptabilité Pacifica-Production-Utilisateur Notes de frais");
			} else if (company == "SIRCA") {
				return this.getProfile("P_Oracle R12_Comptabilité Sirca-Production-Utilisateur Notes de frais");
			} else if (company == "VIAVITA") {
				return this.getProfile("P_Oracle R12_Comptabilité Viavita-Production-Utilisateur Notes de frais");
			}
		}
	},
	
	// Rules for MyWorkSpace Managers
	_getProfile_Rule_MyWorkSpace_Manager: function (identity) {
		//gs.info("Zoubab u_preferred_login " + identity.u_preferred_login.toString());
		var grSNow = new GlideRecord("sys_user");
		grSNow.addQuery("active", true);
		grSNow.addQuery("user_name", identity.u_preferred_login.toString());
		grSNow.query();
		if (grSNow.next()) {
			
			// Search by identity's managed_by for SIRCA managers
			var sysid_user = grSNow.sys_id;
			var grManager = new GlideRecord("u_cmdb_ci_iam_identity");
			grManager.addEncodedQuery('managed_by='+sysid_user);
			grManager.addEncodedQuery('u_active=true');
			grManager.setLimit(1);
			grManager.query();
			if (grManager.next()) {
				return this.getProfile("GS_A_CA-PACIFICA_PACIFICA_CreationTeams_E3");
			}

			// Search by ORGA - in case of empty organisations
			var grManagerdept = new GlideRecord("cmn_department");
			grManagerdept.addEncodedQuery('dept_head='+sysid_user+'^ORu_assistantLIKE'+sysid_user+'^ORu_managersLIKE'+sysid_user);
			grManagerdept.setLimit(1);
			grManagerdept.query();
			if (grManagerdept.next()) {
				return this.getProfile("GS_A_CA-PACIFICA_PACIFICA_CreationTeams_E3");
			}
		}
	},
	
	// Rules for MyPlace
	_getProfile_Rule_MyPlace: function (identity) {
		var loc = identity.location.u_code + '';
		var val = identity.department.u_iam_sigle.getDisplayValue() + "";
		var company = identity.company.getDisplayValue() || "";
		var internal = identity.getValue("u_internal") || "";

		var MyPlacesProfiles = [];
		
		if (company == "CAAS") {
			return MyPlacesProfiles;
		}
		
		if (internal == "1") {
			if (company == "PACIFICA") {
				MyPlacesProfiles.push(this.getProfile("MyPlace_Pacifica-Internes"));
			} else if (company == "SIRCA") {
				MyPlacesProfiles.push(this.getProfile("MyPlace_Sirca-Internes"));
			} else if (company == "VIAREN") {
				MyPlacesProfiles.push(this.getProfile("MyPlace_VRN-Visiteurs"));
			}
		} else if (internal == "0") {
			if (company == "PACIFICA") {
				MyPlacesProfiles.push(this.getProfile("MyPlace_Pacifica-Externes"));
			} else if (company == "SIRCA") {
				MyPlacesProfiles.push(this.getProfile("MyPlace_Sirca-Externes"));
			} else if (company == "VIAREN") {
				MyPlacesProfiles.push(this.getProfile("MyPlace_VRN-Visiteurs"));
			}
		}
		
		if (loc != "S00" && loc != "F01" && loc != "N01") { // Non siege
			MyPlacesProfiles.push(this.getProfile("MyPlace_" + loc + "-Visiteurs"));
		}
		// Search for an organisationnal match
		var valSpe = ["DGL", "DFI", "SGL", "RCP", "DDP", "DSIN", "PID", "DPART", "DMAP", "DEP", "DSA", "DCDEV", "CIRM"];
		var valMatched = "";

		for(var i = 0 ; i<valSpe.length ; i++) {
			var yourRegex = new RegExp(valSpe[i], 'g');
			if(yourRegex.test(val))	{  // loop valSpe regex on departements
				//Founded
				valMatched = valSpe[i];
				break;
			}
		}
		if (valMatched != "") {
			MyPlacesProfiles.push(this.getProfile("MyPlace_" + valMatched + "-Visiteurs"));
			if(valMatched == "DSIN" && loc == "S00") {  // DSIN SIEGE
				MyPlacesProfiles.push(this.getProfile("MyPlace_DSIN-SIEGE"));
			}
		}		

		return MyPlacesProfiles;
	},
	
	// CustomerRoom application rule
	_getProfile_Rule_CustomerRoom: function (identity) {
		var internal = identity.getValue("u_internal") || "";
		var CustomerRoom = [];
		if (internal == "1") {
			CustomerRoom.push(this.getProfile("CustomerRoom-Production-Utilisateur"));
			// CustomerRoom.push(this.getProfile("CustomerRoom-HorsProduction-Utilisateur"));
		}
		return CustomerRoom;
	},

	_getProfile_Rule_PeopleAssist: function (identity) {
		var internal = identity.getValue("u_internal") || "";
		if (internal == "1") {
			return this.getProfile("PeopleAssist utilisateur");
		}
	},
	
	_getProfile_Rule_PowerBiClientAuto: function (identity) { // Droit PowerBi pour les internes de certains départements
		var internal = identity.getValue("u_internal") || "";
		var loc = identity.location.u_code + '';
		var val = identity.department.u_iam_sigle.getDisplayValue() + "";
		var depStarts = val.split("/")[0];
		if (internal == "1" && (depStarts == "DCDEV" || (depStarts == "DSIN" && loc == "S00") || depStarts == "DPART" || depStarts == "DMAP" || depStarts == "DEP")) {
			return this.getProfile("Consultation - Tableau de bord Equipement Client");
		}
	},	
	
	_getProfile_Rule_WINCHAPPS: function (identity) { // Droit WINCHAPPS pour les internes
		var internal = identity.getValue("u_internal") || "";
		if (internal == "1" ) {
			return this.getProfile("WINCHAPPS-PACIFICA-Production-Utilisateur");
		}
	},	

	
	/////////////////////////////
	// MailBox
	/////////////////////////////

	getMailBoxQuota: function (identity) {
		var code = identity.getValue("u_function") || "";
		if (this.DIRECTOR_MAILBOXQUOTA_CODE.indexOf(code) >= 0) {
			return this.DIRECTOR_MAILBOXQUOTA;
		} else {
			return this.DEFAULT_MAILBOXQUOTA;
		}
	},


	////////////////////////////
	// IAM Policy Rules
	///////////////////////////

	/*
     Generate Profile
    */
	generateGroupProfile: function () {
		this._generateGroupProfileORG();
		this._generateGroupProfileArrobas();
		this._generateGroupProfileW7();
		this._generateGroupProfileSpecials();
		this._generateGroupProfileAssistant();
	},


	_generateGroupProfileORG: function () {
		// ORG
		var dep = new GlideRecord("cmn_department");
		dep.query();
		while (dep.next()) {
			var name = dep.getValue("name") || "";
			name = name.replaceAll('/', '_');
			name = "ORG_" + name;
			if (!this.ProfileExist(name)) {
				var _id = "CN=" + name;
				this.createGroupProfile(name, _id);
			}
		}
	},

	_generateSingleGroupProfileORG: function (dep) {
		var name = dep.getValue("name") || "";
		name = name.replaceAll('/', '_');
		name = "ORG_" + name;
		if (!this.ProfileExist(name)) {
			var _id = "CN=" + name;
			this.createGroupProfile(name, _id);
		}
	},

	_generateGroupProfileArrobas: function () {
		//Arrobas
		var _pacifica = "-Pacifica";
		var _extern = "-Externes";
		var dep = new GlideRecord("cmn_department");
		dep.query();
		while (dep.next()) {
			var name = dep.getValue("name") || "";
			name = name.replaceAll('/', '.');
			pacifica = "@" + name + _pacifica;
			extern = "@" + name + _extern;
			if (!this.ProfileExist(pacifica)) {
				var pacifica_dn = "CN=" + pacifica + ",OU=Distribution,OU=Groupes," + this.getDC();
				this.createGroupProfile(pacifica, pacifica_dn);
			}
			if (!this.ProfileExist(extern)) {
				var extern_dn = "CN=" + extern + ",OU=Distribution,OU=Groupes," + this.getDC();
				this.createGroupProfile(extern, extern_dn);
			}
		}
	},

	_generateSingleGroupProfileArrobas: function (dep) {
		var _pacifica = "-Pacifica";
		var _extern = "-Externes";
		var name = dep.getValue("name") || "";
		name = name.replaceAll('/', '.');
		pacifica = "@" + name + _pacifica;
		extern = "@" + name + _extern;
		if (!this.ProfileExist(pacifica)) {
			var pacifica_dn = "CN=" + pacifica;
			this.createGroupProfile(pacifica, pacifica_dn);
		}
		if (!this.ProfileExist(extern)) {
			var extern_dn = "CN=" + extern;
			this.createGroupProfile(extern, extern_dn);
		}

	},

	_generateGroupProfileW7: function () {
		// G_USR_Commun_UtilisateursW7_<site>
		var locations = new GlideRecord("cmn_location");
		locations.query();
		while (locations.next()) {
			var code = locations.getValue("u_code") || "";
			var name = "G_USR_Commun_UtilisateursW7_" + code;
			if (!this.ProfileExist(name)) {
				var _id = "cn=G_USR_Commun_UtilisateursW7_" + code + ",OU=Windows7,OU=Groupes Globaux,OU=Groupes," + this.getDC();
				this.createGroupProfile(name, _id);
			}
		}
	},

	_generateGroupProfileSpecials: function () {
		for (var name in this.SPECIAL_GROUPS) {
			var id = this.SPECIAL_GROUPS[name];
			if (!this.ProfileExist(name)) {
				var _id = id + "," + this.getDC();
				this.createGroupProfile(name, _id);
			}
		}
	},

	_generateGroupProfileAssistant: function () {
		// Assistant<site>
		var locations = new GlideRecord("cmn_location");
		locations.query();
		while (locations.next()) {
			var code = locations.getValue("u_code") || "";
			var name = "Assistant" + code;
			if (!this.ProfileExist(name)) {
				var id = "CN=" + name + ",OU=" + code + ",OU=Utilisateurs," + this.getDC();
				this.createGroupProfile(name, id);
			}
		}
	},

	// 
	//Generate Policy Rules
	//
	generateGroupPolicyRules: function () {
		this._generateGroupPolicyRulesAssistant();
		this._generateGroupPolicyRulesOrg();
		this._generateGroupPolicyRulesArrobas();
		this._generateGroupPolicyRulesW7Site();
		this._generateGroupPolicyRulesSpecials();
	},

	getProfilesWithoutPolicyRule: function () {
		var profiles = [];
		var profileGR = new GlideRecord("u_cmdb_ci_iam_access_profile");
		profileGR.query();
		while (profileGR.next()) {
			var ruleGR = new GlideRecord("x_pacifica_iam_iam_policy_rules");
			ruleGR.addQuery("application_profile", profileGR.sys_id);
			ruleGR.setLimit(1);
			ruleGR.query();
			if (!ruleGR.hasNext()) {
				profiles.push(profileGR.name + "");
			}
		}
		return profiles;
	},

	_generateGroupPolicyRulesAssistant: function () {
		// Assistant<site>
		var locations = new GlideRecord("cmn_location");
		locations.query();
		while (locations.next()) {
			var code = locations.getValue("u_code") || "";
			var name = "Assistant" + code;
			if (this.ProfileExist(name)) {
				if (!this.PolicyRuleExist(name, name)) {
					var group_dn = "CN=" + name + ",OU=" + code + ",OU=Utilisateurs," + this.getDC();
					this.createPolicyRule(name, name, group_dn);
				}
			}
		}
	},

	_generateGroupPolicyRulesOrg: function () {
		// Org
		var dep = new GlideRecord("cmn_department");
		dep.query();
		while (dep.next()) {
			var name = dep.getValue("name") || "";
			name = name.replaceAll('/', '_');
			name = "ORG_" + name;

			if (this.ProfileExist(name)) {
				if (!this.PolicyRuleExist(name, name)) {
					var group_dn = "CN=" + name + ",OU=Bureautique,OU=Groupes Globaux,OU=Groupes," + this.getDC();
					this.createPolicyRule(name, name, group_dn);
				}
			}
		}
	},

	_generateSingleGroupPolicyRulesOrg: function (dep) {
		var name = dep.getValue("name") || "";
		name = name.replaceAll('/', '_');
		name = "ORG_" + name;
		if (this.ProfileExist(name)) {
			if (!this.PolicyRuleExist(name, name)) {
				var group_dn = "NULL";
				this.createPolicyRule(name, name, group_dn);
			}
		}
	},

	_generateGroupPolicyRulesArrobas: function () {
		// Arrobase
		var _pacifica = "-Pacifica";
		var _extern = "-Externes";
		var dep = new GlideRecord("cmn_department");
		dep.query();
		while (dep.next()) {
			var name = dep.getValue("name") || "";
			name = name.replaceAll('/', '.');
			pacifica = "@" + name + _pacifica;
			extern = "@" + name + _extern;
			if (this.ProfileExist(pacifica)) {
				if (!this.PolicyRuleExist(pacifica, pacifica)) {
					var pacifica_dn = "CN=" + pacifica + ",OU=Distribution,OU=Groupes," + this.getDC();
					this.createPolicyRule(pacifica, pacifica, pacifica_dn);
				}
			}
			if (this.ProfileExist(extern)) {
				if (!this.PolicyRuleExist(extern, extern)) {
					var extern_dn = "CN=" + extern + ",OU=Distribution,OU=Groupes," + this.getDC();
					this.createPolicyRule(extern, extern, extern_dn);
				}
			}
		}
	},

	_generateSingleGroupPolicyRulesArrobas: function (dep) {
		var _pacifica = "-Pacifica";
		var _extern = "-Externes";
		var name = dep.getValue("name") || "";
		name = name.replaceAll('/', '.');
		pacifica = "@" + name + _pacifica;
		extern = "@" + name + _extern;
		if (this.ProfileExist(pacifica)) {
			if (!this.PolicyRuleExist(pacifica, pacifica)) {
				var pacifica_dn = "NULL";
				this.createPolicyRule(pacifica, pacifica, pacifica_dn);
			}
		}
		if (this.ProfileExist(extern)) {
			if (!this.PolicyRuleExist(extern, extern)) {
				var extern_dn = "NULL";
				this.createPolicyRule(extern, extern, extern_dn);
			}
		}
	},

	_generateGroupPolicyRulesW7Site: function () {
		// G_USR_Commun_UtilisateursW7_<site>
		var locations = new GlideRecord("cmn_location");
		locations.query();
		while (locations.next()) {
			var code = locations.getValue("u_code") || "";
			var name = "G_USR_Commun_UtilisateursW7_" + code;
			if (this.ProfileExist(name)) {
				if (!this.PolicyRuleExist(name, name)) {
					var group_dn = "cn=G_USR_Commun_UtilisateursW7_" + code + ",OU=Windows7,OU=Groupes Globaux,OU=Groupes," + this.getDC();
					this.createPolicyRule(name, name, group_dn);
				}
			}
		}
	},

	_generateGroupPolicyRulesSpecials: function () {
		for (var profile in this.SPECIAL_GROUPS) {
			var dn = this.SPECIAL_GROUPS[profile] + "," + this.getDC();
			var name = dn.split(",")[0].split("=")[1];

			if (this.ProfileExist(profile)) {
				if (!this.PolicyRuleExist(profile, name)) {
					this.createPolicyRule(profile, name, dn);
				}
			}
		}
	},

	PolicyRuleExist: function (name, group) {
		//group=G_USR_Commun_UtilisateursW7_S00^application_profile.name=Droit au téléchargement
		var rules = new GlideRecord("x_pacifica_iam_iam_policy_rules");
		rules.addEncodedQuery("group=" + group + "^application_profile.name=" + name);
		rules.query();
		if (rules.next())
			return true;
		return false;
	},

	createPolicyRule: function (name, group, group_dn) {
		var profile = new GlideRecord("u_cmdb_ci_iam_access_profile");
		profile.get("name", name);
		var rule = new GlideRecord("x_pacifica_iam_iam_policy_rules");
		rule.initialize();
		rule.setValue("application_profile", profile.sys_id + '');
		rule.setValue("group", group);
		rule.setValue("group_dn", group_dn);
		rule.setValue("active", "true");
		rule.insert();
	},

	ProfileExist: function (name) {
		var profile = new GlideRecord("u_cmdb_ci_iam_access_profile");
		return profile.get("name", name);
	},

	createGroupProfile: function (n, _id) {
		var profile = new GlideRecord("u_cmdb_ci_iam_access_profile");
		profile.initialize();
		profile.setValue("name", n);
		profile.setValue("active", "true");
		profile.setValue("u_iam_id", _id);
		profile.setValue("u_resource_type", "cmdb_ci_group");
		profile.setValue("install_status", 5);
		profile.insert();
	},

	getGroupFullName: function (group_name) {
		return group_name + ',' + this.getDC();
	},

	getGroupDNOrg: function (identity) {
		gs.log("Debut de ma fonction GroupDNOrg");
		var department = identity.department.name + '';
		var fonction = identity.getValue("u_function") || "";
		department = department.replaceAll('/', '_');
		gs.log(fonction, ": valeur fonction GroupDNOrg");
		return "CN=ORG_" + department + ",OU=Bureautique,OU=Groupes Globaux,OU=Groupes," + this.getDC();

	},

	getGroupOrg: function (identity) {
		gs.log("Debut de ma fonction GroupOrg");
		var department = identity.department.name + '';
		var fonction = identity.getValue("u_function") || "";
		department = department.replaceAll('/', '_');
		gs.log(fonction, ": valeur fonction GroupOrg");
		return "ORG_" + department ;

	},

	getGroupDNArrobe: function (identity) {
		gs.log("Debut de ma fonction GroupDNArrobe");
		var internal = identity.getValue("u_internal") || "";
		var fonction = identity.getValue("u_function") || "";
		var suffix = (internal == "1" ? "-Pacifica" : "-Externes");
		var department = identity.department.name + '';
		department = department.replaceAll('/', '.');
		gs.log(fonction, ": valeur fonction GroupDNArrobe");
		return department = "CN=@" + department + suffix + ",OU=Organisationnelle,OU=Distribution,OU=Groupes," + this.getDC();
	},

	//Ajout du suffix -Manager pour les Responsables d'UGS
	getGroupArrobe: function (identity) {
		gs.log("Debut de ma fonction GroupArrobe");
		var internal = identity.getValue("u_internal") || "";
		var fonction = identity.getValue("u_function") || "";
		//var responsable = "UGS_Responsable";
		// var suffix = (fonction.indexOf(responsable) !== -1 ? "-Manager" : internal == "1" ? "-Pacifica" : "-Externes");
		var suffix = (internal == "1" ? "-Pacifica" : "-Externes");
		var department = identity.department.name + '';
		department = department.replaceAll('/', '.');
		gs.log(fonction, ": valeur fonction GroupArrobe");
		return department = "@" + department + suffix;
	},

	getGroupDNAssistant: function (identity) {
		//CN=AssistantS05,OU=S05,OU=Utilisateurs,DC=ca-pacifica,DC=fr
		var loc = identity.location.u_code + '';
		if(loc != "S00") {
			return "CN=Assistant" + loc + ",OU=" + identity.location.u_code + ",OU=Utilisateurs," + this.getDC();
		}
		return "";
	},

	getGroupAssistant: function (identity) {
		return "Assistant" + identity.location.u_code;
	},

	getGroupDNLocation: function (identity) {
		var loc = identity.location.u_code + '';
		return this.getGroupFullName(this.LOCATION_GROUP_MAPPING[loc]);
	},

	//"CN=G_viaren,OU=VIAREN,OU=Pacifica,OU=Groupes Globaux,OU=Groupes"
	getGroupLocation: function (identity) {
		var loc = identity.location.u_code + '';
		var group_dn = this.LOCATION_GROUP_MAPPING[loc];
		if (group_dn == undefined) {
			return;
		}
		var first = group_dn.split(",")[0];
		var g = first.split("=")[1];
		return g;
	},

	getGroupDNW7: function (identity) {
		var loc = identity.location.u_code + '';
		return "cn=G_USR_Commun_UtilisateursW7_" + loc + ",OU=Windows7,OU=Groupes Globaux,OU=Groupes," + this.getDC();
	},

	getGroupW7: function (identity) {
		var loc = identity.location.u_code + '';
		return "G_USR_Commun_UtilisateursW7_" + loc;
	},

	////////////////////////////
	// END IAM Policy Rules
	///////////////////////////

	getDC: function () {
		return gs.getProperty("x_pacifica_iam.iam.default_dc", "DC=CA-PACIFICA,DC=FR");
	},

	/////////////////////////////
	/// Transform map
	////////////////////////////

	getApplicationProfil: function (s) {
		var app = new GlideRecord("u_cmdb_ci_iam_access_profile");
		app.addEncodedQuery("u_iam_id=" + s);
		app.query();
		app.next();
		return app.sys_id + "";
	},
	getApplicationProfilByName: function (s) {
		if (s) {
			var app = new GlideRecord("u_cmdb_ci_iam_access_profile");
			app.addEncodedQuery("name=" + s);
			app.query();
			app.next();
			return app.sys_id + "";
		} else {
			return "";
		}
	},



	// SCRCRE0001034 call by Business rule IAM - Manage generic profile
	//del generic application profile linked to the entity if there is no other application profile on same application
	delGenericProfile: function(identity, appli) {


		var grGenProfile = new GlideRecord('u_m2m_iam_ident_has_a_profile');
		grGenProfile.addQuery("u_profile.u_application.sys_id", appli);
		grGenProfile.addQuery("u_identity", identity);
		grGenProfile.addQuery("u_profile.u_is_a_generic_profile", "true");
		grGenProfile.query();
		if (grGenProfile.next()) {
			grGenProfile.deleteRecord();
		}

	},

	// call by Business rule IAM - Manage generic profile
	//create generic application profile linked to the entity if there is no other application profile on same application

	createGenericProfile: function(identity, appli) {
		var grGenProfile = new GlideRecord('u_m2m_iam_ident_has_a_profile');
		var profileId = this.getGenericProfile(appli);
		if (profileId!=""){

			grGenProfile.u_profile = profileId;
			grGenProfile.u_identity = identity;
			grGenProfile.insert();
		}
	},

	// call by Business rule IAM - Manage generic profile
	hasOtherProfile: function(identProfile, excludeGeneric) {
		var grIdentProfile = new GlideRecord("u_m2m_iam_ident_has_a_profile");
		grIdentProfile.addQuery("sys_id", "!=", identProfile.sys_id);
		grIdentProfile.addQuery("u_identity", identProfile.u_identity);
		if (excludeGeneric)
			grIdentProfile.addEncodedQuery("u_profile.u_application.u_has_a_generic_iam_policy_rule=true^u_profile.u_application.sys_id="+identProfile.u_profile.u_application.sys_id + "^u_profile.u_is_a_generic_profile=false");
		else
			grIdentProfile.addEncodedQuery("u_profile.u_application.u_has_a_generic_iam_policy_rule=true^u_profile.u_application.sys_id="+identProfile.u_profile.u_application.sys_id);
		grIdentProfile.query();
		if (grIdentProfile.hasNext())
			return true;
		else
			return false;
		
	},
	
	hasGenericProfile: function(identProfile) {
		var grIdentProfile = new GlideRecord("u_m2m_iam_ident_has_a_profile");
		grIdentProfile.addQuery("sys_id", "!=", identProfile.sys_id);
		grIdentProfile.addQuery("u_identity", identProfile.u_identity);
		grIdentProfile.addEncodedQuery("u_profile.u_application.u_has_a_generic_iam_policy_rule=true^u_profile.u_application.sys_id="+identProfile.u_profile.u_application.sys_id + "^u_profile.u_is_a_generic_profile=true");
		grIdentProfile.query();
		if (grIdentProfile.hasNext())
			return true;
		else
			return false;
		
	},
	
	// call by Business rule IAM - Manage generic profile
	getGenericProfile: function(appli) {
		var grGenProfile = new GlideRecord("u_cmdb_ci_iam_access_profile");
		grGenProfile.addQuery("u_application",appli);
		grGenProfile.addQuery("u_is_a_generic_profile", "true");
		grGenProfile.query();
		if (grGenProfile.next())
			return grGenProfile.sys_id;
		else
			return "";
	},

	/////////////////////////////
	/// END Transform map
	////////////////////////////





	///////////////////////////
	/// Fix Script
	//////////////////////////

	fixSpecialProfil: function (identity) {
		var p = this.getSpecialProfiles(identity);
		if (p) {
			var profiles = [];
			for (var i = 0; i < p.length; i++) {
				profiles.push(this.checkIdentityProfilAndFix(identity, p[i]));
			}
			return profiles;
		}
	},

	checkIdentityProfilAndFix: function (identity, profil) {
		var existingM2mGR = new GlideRecord("u_m2m_iam_ident_has_a_profile");
		existingM2mGR.addQuery("u_identity", identity.sys_id);
		existingM2mGR.addQuery("u_profile", profil);
		existingM2mGR.query();
		var hasProfile = existingM2mGR.hasNext();
		if (!hasProfile) {
			var newM2mGR = new GlideRecord("u_m2m_iam_ident_has_a_profile");
			newM2mGR.initialize();
			newM2mGR.u_identity = identity.sys_id;
			newM2mGR.u_profile = profil;
			newM2mGR.insert();
		}
	},

	///////////////////////////
	/// END Fix Script
	//////////////////////////
	
	
		
	///////////////////////////
    /// SOD Management SCRCRE0001051 CDS EESM
    //////////////////////////
    checkSODForProfile: function(current) {

        var createApproval = false;
        var sodProfileExists, sodProfileApprovalRequested = false; //SOD profile "B" already exists in the identity
        var sodProfileAdded = ""; //SOD profile "B" requested in the same request, contains sys_id of RITM

        // selected application profiles
        var appProfile = current.variables.application_profiles;

        //check if a SOD exists for the selected application profile
        var grSOD = new GlideRecord("u_m2m_iam_profile_has_sod");
        grSOD.addEncodedQuery("u_application_profile_a=" + appProfile + "^ORu_application_profile_b=" + appProfile);
        grSOD.query();
        if (grSOD.next()) {
            var sodProfile = "";
            if (grSOD.u_application_profile_a == appProfile)
                sodProfile = grSOD.u_application_profile_b;
            else
                sodProfile = grSOD.u_application_profile_a;

            //check if sod profile is also requested in the same request
            sodProfileAdded = this.checksodProfileInRequest(sodProfile, current);

            if (sodProfileAdded == "")
                sodProfileExists = this.checksodProfileInIdentity(sodProfile, current);
            else
                sodProfileApprovalRequested = this.checksodProfileApproval(sodProfileAdded);

        }

        if (sodProfileExists && !sodProfileApprovalRequested)
            createApproval = true;
        else
            createApproval = false;

        return createApproval;

    },

    checksodProfileInRequest: function(sodProfile, record) {


        var grRITM = new GlideRecord("sc_req_item");
        grRITM.addQuery("request", record.request);
        grRITM.addQuery("cat_item", gs.getProperty("iam.eesm.cat.item.add.remove.app.profiles"));
        grRITM.addQuery("variables.application_profiles", sodProfile);
        grRITM.query();
        if (grRITM.next())
            return grRITM.sys_id;
        else
            return "";

    },

    checksodProfileInIdentity: function(sodProfile, record) {

        //u_identity=29142c1b35cf745018d4ba255b3f4e65^u_profile.u_resource_type!=cmdb_ci_group^ORu_profile.u_resource_typeISEMPTY
        var grIdentity = new GlideRecord("u_m2m_iam_ident_has_a_profile");
        grIdentity.addEncodedQuery("u_identity" + record.configuration_item + "^u_profile.u_resource_type!=cmdb_ci_group^ORu_profile.u_resource_typeISEMPTY");
        grIdentity.addQuery("u_profile", sodProfile);
        grIdentity.query();
        if (grIdentity.next())
            return true;
        else
            return false;
    },

    sodProfileApprovalRequested: function(sodProfileAdded) {


        var grApproval = new GlideRecord("sysapproval_approver");
        grApproval.addQuery("sysapproval", sodProfileAdded);
        grApproval.addQuery("wf_activity.name", ""); //TO BE COMPLET BY NEW APPROVAL ACTICITY NAME
        grApproval.query();
        if (grApproval.next())
            return true;
        else
            return false;

    },


	///////////////////////////
    /// END SOD Management SCRCRE0001051 CDS EESM
    //////////////////////////


	type: 'IAMADIntegration'
};