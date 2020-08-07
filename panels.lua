local panels = {}

-- Transit
panels[1] = {
	name	=	"Cogent", 
	id		=	"24", 
	type	=	"transit",
}
panels[2] = {
	name	=	"Comcast",
	id		=	"26",
	type	=	"transit"
}
panels[3] = {
	name	=	"NTT",
	id		=	"30",
	url		=	"NTT",
	type	=	"transit"
}
panels[4] = {
	name	=	"XO",
	id		=	"2", 
	type	=	"transit"
}

-- Exchanges
panels[5] = {
	name	=	"Any2", 
	id		=	"13",
	type	=	"exchange"
}
panels[6] = {
	name	=	"SIX",
	id		=	"34",
	url		=	"SIX",
	type	=	"exchange"
}
panels[7] = {
	name	=	"SLIX", 
	id		=	"28", 
	url		=	"SLIX", 
	type	=	"exchange"
}
panels[8] = {
	name	=	"HE",
	id		=	"63",
	url		=	"HE",
	type	=	"exchange"
}

-- Endpoints
panels[9] = {
	name	=	"Colind",
	id		=	"38",
	type	=	"endpoint"
}
panels[10] = {
	name	=	"Google DNS",
	id		=	"42", 
	url		=	"google",
	type	=	"endpoint"
}
panels[11] = {
	name	=	"DAL05 (Softlayer)", 
	id		=	"46",
	url		=	"dal05",
	type="endpoint"
}
panels[12] = {
	name	=	"NFO (LA)", 
	id		=	"51",
	url		=	"nfola",
	type	=	"endpoint"
}
panels[13] = {
	name	=	"NFO (SJ)", 
	id		=	"52",
	url		=	"nfosj", 
	type	=	"endpoint"
}
panels[14] = {
	name	=	"C7 (SLC)",
	id		=	"56",
	url		=	"c7slc",
	type	=	"endpoint"
}
panels[15] = {
	name	=	"Zarth (CHI)",
	id		=	"60",
	url		=	"zarth",
	type	=	"endpoint"
}

return panels