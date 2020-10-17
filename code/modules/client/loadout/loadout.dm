GLOBAL_LIST_EMPTY(loadout_categories)
GLOBAL_LIST_EMPTY(gear_datums)

GLOBAL_LIST_EMPTY(loadout_items)
GLOBAL_LIST_EMPTY(loadout_whitelist_ids)

/datum/loadout_category
	var/category = ""
	var/list/gear = list()

/datum/loadout_category/New(cat)
	category = cat
	..()

/proc/populate_gear_list()
	//create a list of gear datums to sort
	for(var/geartype in subtypesof(/datum/gear))
		var/datum/gear/G = geartype

		var/use_name = initial(G.display_name)
		var/use_category = initial(G.sort_category)

		if(G == initial(G.subtype_path))
			continue

		if(!use_name)
			WARNING("Loadout - Missing display name: [G]")
			continue
		if(!initial(G.cost))
			WARNING("Loadout - Missing cost: [G]")
			continue
		if(!initial(G.path) && use_category != "OOC") //OOC category does not contain actual items
			WARNING("Loadout - Missing path definition: [G]")
			continue

		if(!GLOB.loadout_categories[use_category])
			GLOB.loadout_categories[use_category] = new /datum/loadout_category(use_category)
		var/datum/loadout_category/LC = GLOB.loadout_categories[use_category]
		GLOB.gear_datums[use_name] = new geartype
		LC.gear[use_name] = GLOB.gear_datums[use_name]

	GLOB.loadout_categories = sortAssoc(GLOB.loadout_categories)
	return 1

// do I need this?
/proc/slot_to_string(slot)
	switch(slot)
		if(SLOT_BACK)
			return "Backpack"
		if(SLOT_WEAR_MASK)
			return "Mask"
		if(SLOT_HANDS)
			return "Hands"
		if(SLOT_BELT)
			return "Belt"
		if(SLOT_EARS)
			return "Ears"
		if(SLOT_GLASSES)
			return "Glasses"
		if(SLOT_GLOVES)
			return "Gloves"
		if(SLOT_NECK)
			return "Neck"
		if(SLOT_HEAD)
			return "Head"
		if(SLOT_SHOES)
			return "Shoes"
		if(SLOT_WEAR_SUIT)
			return "Suit"
		if(SLOT_W_UNIFORM)
			return "Uniform"
		if(SLOT_IN_BACKPACK)
			return "In backpack"


/proc/load_loadout_config(loadout_config)
	if(!loadout_config)
		loadout_config = "config/loadout_config.txt"
	LAZYINITLIST(GLOB.loadout_whitelist_ids)
	var/list/file_lines = world.file2list(loadout_config)
	for(var/line in file_lines)
		if(!line || findtextEx(line,"#",1,2))
			continue
		var/list/lineinfo = splittext(line, "|")
		var/lineID = lineinfo[1]
		for(var/subline in lineinfo)
			var/sublinetypedef = findtext(subline, "=")
			if(sublinetypedef)
				var/sublinetype = copytext(subline, 1, sublinetypedef)
				var/list/sublinecontent = splittext(copytext(subline, sublinetypedef+1), ",")
				if(sublinetype == "WHITELIST")
					GLOB.loadout_whitelist_ids["[lineID]"] = sublinecontent

/proc/initialize_global_loadout_items()
	LAZYINITLIST(GLOB.loadout_items)
	load_loadout_config()
	for(var/item in subtypesof(/datum/gear))
		var/datum/gear/I = new item
		if(!GLOB.loadout_items[slot_to_string(I.category)])
			LAZYINITLIST(GLOB.loadout_items[slot_to_string(I.category)])
		LAZYSET(GLOB.loadout_items[slot_to_string(I.category)], I.name, I)
		if(islist(I.geargroupID))
			var/list/ggidlist = I.geargroupID
			I.ckeywhitelist = list()
			for(var/entry in ggidlist)
				if(entry in GLOB.loadout_whitelist_ids)
					I.ckeywhitelist |= GLOB.loadout_whitelist_ids["[entry]"]
		else if(I.geargroupID in GLOB.loadout_whitelist_ids)
			I.ckeywhitelist = GLOB.loadout_whitelist_ids["[I.geargroupID]"]

/datum/gear
	var/display_name       //Name/index. Must be unique.
	var/description        //Description of this gear. If left blank will default to the description of the pathed item.
	var/path               //Path to item.
	var/cost = INFINITY           //Number of metacoins
	var/slot               //Slot to equip to.
	var/list/allowed_roles //Roles that can spawn with this item.
	var/list/species_blacklist //Stop certain species from receiving this gear
	var/list/species_whitelist //Only allow certain species to receive this gear
	var/sort_category = "General"
	var/subtype_path = /datum/gear //for skipping organizational subtypes (optional)

	var/name
	var/category
	var/geargroupID //defines the ID that the gear inherits from the config
	var/list/restricted_roles
	var/list/ckeywhitelist
	var/restricted_desc

/datum/gear/New()
	..()
	if(!description)
		var/obj/O = path
		description = initial(O.desc)

/datum/gear/proc/purchase(var/client/C) //Called when the gear is first purchased
	return

/datum/gear_data
	var/path
	var/location

/datum/gear_data/New(npath, nlocation)
	path = npath
	location = nlocation

/datum/gear/proc/spawn_item(location, metadata)
	var/datum/gear_data/gd = new(path, location)
	var/item = new gd.path(gd.location)
	return item
