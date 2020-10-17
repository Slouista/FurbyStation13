/*

	Hello and welcome to sprite_accessories: For sprite accessories, such as hair,
	facial hair, and possibly tattoos and stuff somewhere along the line. This file is
	intended to be friendly for people with little to no actual coding experience.
	The process of adding in new hairstyles has been made pain-free and easy to do.
	Enjoy! - Doohl


	Notice: This all gets automatically compiled in a list in dna.dm, so you do not
	have to define any UI values for sprite accessories manually for hair and facial
	hair. Just add in new hair types and the game will naturally adapt.

	!!WARNING!!: changing existing hair information can be VERY hazardous to savefiles,
	to the point where you may completely corrupt a server's savefiles. Please refrain
	from doing this unless you absolutely know what you are doing, and have defined a
	conversion in savefile.dm
*/
/proc/init_sprite_accessory_subtypes(prototype, list/L, list/male, list/female,var/roundstart = FALSE)//Roundstart argument builds a specific list for roundstart parts where some parts may be locked
	if(!istype(L))
		L = list()
	if(!istype(male))
		male = list()
	if(!istype(female))
		female = list()

	for(var/path in typesof(prototype))
		if(path == prototype)
			continue
		if(roundstart)
			var/datum/sprite_accessory/P = path
			if(initial(P.locked))
				continue
		var/datum/sprite_accessory/D = new path()

		if(D.icon_state)
			L[D.name] = D
		else
			L += D.name

		switch(D.gender)
			if(MALE)
				male += D.name
			if(FEMALE)
				female += D.name
			else
				male += D.name
				female += D.name
	return L

/datum/sprite_accessory
	var/icon			//the icon file the accessory is located in
	var/icon_state		//the icon_state of the accessory
	var/name			//the preview name of the accessory
	var/gender = NEUTER	//Determines if the accessory will be skipped or included in random hair generations
	var/gender_specific //Something that can be worn by either gender, but looks different on each
	var/use_static		//determines if the accessory will be skipped by color preferences
	var/color_src = MUTCOLORS	//Currently only used by mutantparts so don't worry about hair and stuff. This is the source that this accessory will get its color from. Default is MUTCOLOR, but can also be HAIR, FACEHAIR, EYECOLOR and 0 if none.
	var/hasinner		//Decides if this sprite has an "inner" part, such as the fleshy parts on ears.
	var/locked = FALSE		//Is this part locked from roundstart selection? Used for parts that apply effects
	var/dimension_x = 32
	var/dimension_y = 32
	var/center = FALSE	//Should we center the sprite?
	var/limbs_id // The limbs id supplied for full-body replacing features.
	var/extra = FALSE          //Hypercit stuff starts.
	var/extra_color_src = MUTCOLORS2						//The color source for the extra overlay.
	var/extra2 = FALSE
	var/extra_icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	var/extra2_icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	var/extra2_color_src = MUTCOLORS3
	var/list/ckeys_allowed

	//For soft-restricting markings to species IDs
	var/list/recommended_species
//////////////////////
////// Hypercit///////
//////////////////////
/***************** Alphabetical Order please ***************
************* Keep it to Ears, Tails, Tails Animated *********/


/datum/sprite_accessory/tails/lizard/none
	name = "None"
	icon_state = "None"

/datum/sprite_accessory/tails_animated/lizard/none
	name = "None"
	icon_state = "None"


/datum/sprite_accessory/tails/lizard/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/lizard/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/body_markings/guilmon
	name = "Guilmon"
	icon_state = "guilmon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/tails/lizard/guilmon
	name = "Guilmon"
	icon_state = "guilmon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/lizard/guilmon
	name = "Guilmon"
	icon_state = "guilmon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

//christ this was a mistake, but it's here just in case someone wants to selectively fix
/************* Lizard compatable snoots ***********
/datum/sprite_accessory/snouts/bird
	name = "Beak"
	icon_state = "bird"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/bigbeak
	name = "Big Beak"
	icon_state = "bigbeak"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/bug
	name = "Bug"
	icon_state = "bug"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	extra2 = TRUE
	extra2_color_src = MUTCOLORS3

/datum/sprite_accessory/snouts/elephant
	name = "Elephant"
	icon_state = "elephant"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED
	extra = TRUE
	extra_color_src = MUTCOLORS3

/datum/sprite_accessory/snouts/lcanid
	name = "Mammal, Long"
	icon_state = "lcanid"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/lcanidalt
	name = "Mammal, Long ALT"
	icon_state = "lcanidalt"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/scanid
	name = "Mammal, Short"
	icon_state = "scanid"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/scanidalt
	name = "Mammal, Short ALT"
	icon_state = "scanidalt"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/wolf
	name = "Mammal, Thick"
	icon_state = "wolf"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/wolfalt
	name = "Mammal, Thick ALT"
	icon_state = "wolfalt"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/redpanda
	name = "WahCoon"
	icon_state = "wah"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/rhino
	name = "Horn"
	icon_state = "rhino"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED
	extra = TRUE
	extra = MUTCOLORS3

/datum/sprite_accessory/snouts/rodent
	name = "Rodent"
	icon_state = "rodent"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/husky
	name = "Husky"
	icon_state = "husky"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/otie
	name = "Otie"
	icon_state = "otie"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/pede
	name = "Scolipede"
	icon_state = "pede"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/sergal
	name = "Sergal"
	icon_state = "sergal"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/snouts/shark
	name = "Shark"
	icon_state = "shark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'

/datum/sprite_accessory/snouts/toucan
	name = "Toucan"
	icon_state = "toucan"
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	color_src = MATRIXED
*/

/******************************************
*************** Human Ears ****************
*******************************************/

/datum/sprite_accessory/ears/human/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/bear
	name = "Bear"
	icon_state = "bear"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/bigwolf
	name = "Big Wolf"
	icon_state = "bigwolf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/bigwolfinner
	name = "Big Wolf (ALT)"
	icon_state = "bigwolfinner"
	hasinner = 1
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/bigwolfdark
	name = "Dark Big Wolf"
	icon_state = "bigwolfdark"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/bigwolfinnerdark
	name = "Dark Big Wolf (ALT)"
	icon_state = "bigwolfinnerdark"
	hasinner = 1
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/cow
	name = "Cow"
	icon_state = "cow"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/curled
	name = "Curled Horn"
	icon_state = "horn1"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/human/eevee
	name = "Eevee"
	icon_state = "eevee"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/elephant
	name = "Elephant"
	icon_state = "elephant"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/elf
	name = "Elf"
	icon_state = "elf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = SKINTONE

datum/sprite_accessory/ears/human/gret
	name = "Gret"
	icon_state = "gret"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = SKINTONE

/datum/sprite_accessory/ears/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/fish
	name = "Fish"
	icon_state = "fish"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/fox
	name = "Fox"
	icon_state = "fox"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/jellyfish
	name = "Jellyfish"
	icon_state = "jellyfish"
	color_src = HAIR

/datum/sprite_accessory/ears/lab
	name = "Dog, Floppy"
	icon_state = "lab"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/murid
	name = "Murid"
	icon_state = "murid"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/otie
	name = "Otusian"
	icon_state = "otie"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/pede
	name = "Scolipede"
	icon_state = "pede"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/rabbit
    name = "Rabbit"
    icon_state = "rabbit"
    color_src = MATRIXED
    icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/sergal
	name = "Sergal"
	icon_state = "sergal"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/human/skunk
	name = "skunk"
	icon_state = "skunk"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/ears/wolf
	name = "Wolf"
	icon_state = "wolf"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'



/******************************************
************** Human Tails ****************
*******************************************/

/datum/sprite_accessory/tails/human/ailurus
	name = "Red Panda"
	icon_state = "wah"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/ailurus
	name = "Red Panda"
	icon_state = "wah"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/bee
	name = "Bee"
	icon_state = "bee"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/bee
	name = "Bee"
	icon_state = "bee"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/cat
	name = "Cat"
	icon_state = "cat"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = HAIR

/datum/sprite_accessory/tails_animated/human/cat
	name = "Cat"
	icon_state = "cat"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = HAIR

/datum/sprite_accessory/tails/human/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/cow
	name = "Cow"
	icon_state = "cow"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/cow
	name = "Cow"
	icon_state = "cow"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/corvid
	name = "Corvid"
	icon_state = "crow"

/datum/sprite_accessory/tails_animated/human/corvid
	name = "Corvid"
	icon_state = "crow"

/datum/sprite_accessory/tails/human/eevee
	name = "Eevee"
	icon_state = "eevee"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/eevee
	name = "Eevee"
	icon_state = "eevee"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/fish
	name = "Fish"
	icon_state = "fish"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/fish
	name = "Fish"
	icon_state = "fish"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/fox
	name = "Fox"
	icon_state = "fox"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/fox
	name = "Fox"
	icon_state = "fox"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/horse
	name = "Horse"
	icon_state = "horse"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = HAIR

/datum/sprite_accessory/tails_animated/human/horse
	name = "Horse"
	icon_state = "horse"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = HAIR

/datum/sprite_accessory/tails/human/husky
	name = "Husky"
	icon_state = "husky"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/husky
	name = "Husky"
	icon_state = "husky"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/insect
	name = "Insect"
	icon_state = "insect"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails_animated/human/insect
	name = "insect"
	icon_state = "insect"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/tails/human/kitsune
	name = "Kitsune"
	icon_state = "kitsune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/kitsune
	name = "Kitsune"
	icon_state = "kitsune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/murid
	name = "Murid"
	icon_state = "murid"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/murid
	name = "Murid"
	icon_state = "murid"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/otie
	name = "Otusian"
	icon_state = "otie"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/otie
	name = "Otusian"
	icon_state = "otie"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/orca
	name = "Orca"
	icon_state = "orca"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/orca
	name = "Orca"
	icon_state = "orca"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/pede
	name = "Scolipede"
	icon_state = "pede"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/pede
	name = "Scolipede"
	icon_state = "pede"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/sergal
	name = "Sergal"
	icon_state = "sergal"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/sergal
	name = "Sergal"
	icon_state = "sergal"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/skunk
	name = "skunk"
	icon_state = "skunk"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/skunk
	name = "skunk"
	icon_state = "skunk"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/shark
	name = "Shark"
	icon_state = "shark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/shark
	name = "Shark"
	icon_state = "shark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/datashark
	name = "datashark"
	icon_state = "datashark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/datashark
	name = "datashark"
	icon_state = "datashark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/straighttail
	name = "Straight Tail"
	icon_state = "straighttail"

/datum/sprite_accessory/tails_animated/human/straighttail
	name = "Straight Tail"
	icon_state = "straighttail"

/datum/sprite_accessory/tails/human/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/tentacle
	name = "Tentacle"
	icon_state = "tentacle"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/tentacle
	name = "Tentacle"
	icon_state = "tentacle"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/tiger
	name = "Tiger"
	icon_state = "tiger"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/tiger
	name = "Tiger"
	icon_state = "tiger"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails/human/wolf
	name = "Wolf"
	icon_state = "wolf"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/tails_animated/human/wolf
	name = "Wolf"
	icon_state = "wolf"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/******************************************
*********** Mammal Body Parts *************
*******************************************/

/datum/sprite_accessory/mam_ears
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED

/datum/sprite_accessory/mam_ears/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/mam_tails
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/mam_tails/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/mam_tails_animated
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'

/datum/sprite_accessory/mam_tails_animated/none
	name = "None"
	icon_state = "none"
	color_src = MATRIXED

/datum/sprite_accessory/mam_snouts
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	recommended_species = list("mammal", "slimeperson", "insect", "podweak", "avian", "aquatic")

/datum/sprite_accessory/mam_snouts/none
	name = "None"
	icon_state = "none"
	recommended_species = null


/******************************************
**************** Snouts *******************
*******************************************/

/datum/sprite_accessory/mam_snouts/bird
	name = "Beak"
	icon_state = "bird"

/datum/sprite_accessory/mam_snouts/bigbeak
	name = "Big Beak"
	icon_state = "bigbeak"

/datum/sprite_accessory/mam_snouts/bug
	name = "Bug"
	icon_state = "bug"
	color_src = MUTCOLORS
	extra2 = TRUE
	extra2_color_src = MUTCOLORS3

/datum/sprite_accessory/mam_snouts/elephant
	name = "Elephant"
	icon_state = "elephant"
	extra = TRUE
	extra_color_src = MUTCOLORS3

/datum/sprite_accessory/mam_snouts/fox
	name = "Fox"
	icon_state = "fox"

/datum/sprite_accessory/mam_snouts/foxalt
	name = "Fox Alt"
	icon_state = "foxalt"

/datum/sprite_accessory/mam_snouts/hshort
	name = "Small"
	icon_state = "short"

/datum/sprite_accessory/mam_snouts/rabbit
	name = "Rabbit"
	icon_state = "rabbit"

/datum/sprite_accessory/mam_snouts/hshark
	name = "hShark"
	icon_state = "hshark"

/datum/sprite_accessory/mam_snouts/hjackal
	name = "Jackal"
	icon_state = "hjackal"

/datum/sprite_accessory/mam_snouts/hspots
	name = "Hyena"
	icon_state = "hspots"

/datum/sprite_accessory/mam_snouts/hhorse
	name = "Horse"
	icon_state = "hhorse"

/datum/sprite_accessory/mam_snouts/hzebra
	name = "Zebra"
	icon_state = "hzebra"

/datum/sprite_accessory/mam_snouts/hanubus
	name = "Anubus"
	icon_state = "hanubus"

/datum/sprite_accessory/mam_snouts/hpanda
	name = "Panda"
	icon_state = "hpanda"

/datum/sprite_accessory/mam_snouts/skulldog
	name = "Skulldog"
	icon_state = "skulldog"
	extra = TRUE
	extra_color_src = MATRIXED

/datum/sprite_accessory/mam_snouts/skullbird
	name = "Skullbird"
	icon_state = "skullbird"
	extra = TRUE
	extra_color_src = MATRIXED

/datum/sprite_accessory/mam_snouts/lcanid
	name = "Mammal, Long"
	icon_state = "lcanid"

/datum/sprite_accessory/mam_snouts/lcanidalt
	name = "Mammal, Long ALT"
	icon_state = "lcanidalt"

/datum/sprite_accessory/mam_snouts/scanid
	name = "Mammal, Short"
	icon_state = "scanid"

/datum/sprite_accessory/mam_snouts/scanidalt
	name = "Mammal, Short ALT"
	icon_state = "scanidalt"

/datum/sprite_accessory/mam_snouts/wolf
	name = "Mammal, Thick"
	icon_state = "wolf"

/datum/sprite_accessory/mam_snouts/wolfalt
	name = "Mammal, Thick ALT"
	icon_state = "wolfalt"

/datum/sprite_accessory/mam_snouts/redpanda
	name = "WahCoon"
	icon_state = "wah"

/datum/sprite_accessory/mam_snouts/redpandaalt
	name = "WahCoon ALT"
	icon_state = "wahalt"

/datum/sprite_accessory/mam_snouts/rhino
	name = "Horn"
	icon_state = "rhino"
	extra = TRUE
	extra = MUTCOLORS3

/datum/sprite_accessory/mam_snouts/rodent
	name = "Rodent"
	icon_state = "rodent"

/datum/sprite_accessory/mam_snouts/husky
	name = "Husky"
	icon_state = "husky"

/datum/sprite_accessory/mam_snouts/otie
	name = "Otie"
	icon_state = "otie"

/datum/sprite_accessory/mam_snouts/pede
	name = "Scolipede"
	icon_state = "pede"

/datum/sprite_accessory/mam_snouts/sergal
	name = "Sergal"
	icon_state = "sergal"

/datum/sprite_accessory/mam_snouts/shark
	name = "Shark"
	icon_state = "shark"

/datum/sprite_accessory/mam_snouts/toucan
	name = "Toucan"
	icon_state = "toucan"

/datum/sprite_accessory/mam_snouts/sharp
	name = "Sharp"
	icon_state = "sharp"
	color_src = MUTCOLORS

/datum/sprite_accessory/mam_snouts/round
	name = "Round"
	icon_state = "round"
	color_src = MUTCOLORS

/datum/sprite_accessory/mam_snouts/sharplight
	name = "Sharp + Light"
	icon_state = "sharplight"
	color_src = MUTCOLORS

/datum/sprite_accessory/mam_snouts/roundlight
	name = "Round + Light"
	icon_state = "roundlight"
	color_src = MUTCOLORS

//Synth snouts (This is the most important part)
/datum/sprite_accessory/mam_snouts/synthliz
	recommended_species = list("synthliz")
	color_src = MUTCOLORS
	name = "Synthetic Lizard - Snout"
	icon_state = "synthliz_basic"

/datum/sprite_accessory/mam_snouts/synthliz/synthliz_under
	color_src = MATRIXED
	name = "Synthetic Lizard - Snout Under"
	icon_state = "synthliz_under"

/datum/sprite_accessory/mam_snouts/synthliz/synthliz_tert
	color_src = MATRIXED
	name = "Synthetic Lizard - Snout Tertiary"
	icon_state = "synthliz_tert"

/datum/sprite_accessory/mam_snouts/synthliz/synthliz_tertunder
	color_src = MATRIXED
	name = "Synthetic Lizard - Snout Tertiary Under"
	icon_state = "synthliz_tertunder"



/******************************************
**************** Snouts *******************
*************but higher up*****************/

/datum/sprite_accessory/mam_snouts/fbird
	name = "Beak (Top)"
	icon_state = "fbird"

/datum/sprite_accessory/mam_snouts/fbigbeak
	name = "Big Beak (Top)"
	icon_state = "fbigbeak"

/datum/sprite_accessory/mam_snouts/fbug
	name = "Bug (Top)"
	icon_state = "fbug"
	color_src = MUTCOLORS
	extra2 = TRUE
	extra2_color_src = MUTCOLORS3

/datum/sprite_accessory/mam_snouts/felephant
	name = "Elephant (Top)"
	icon_state = "felephant"
	extra = TRUE
	extra_color_src = MUTCOLORS3

/datum/sprite_accessory/mam_snouts/flcanid
	name = "Mammal, Long (Top)"
	icon_state = "flcanid"

/datum/sprite_accessory/mam_snouts/flcanidalt
	name = "Mammal, Long ALT (Top)"
	icon_state = "flcanidalt"

/datum/sprite_accessory/mam_snouts/fscanid
	name = "Mammal, Short (Top)"
	icon_state = "fscanid"

/datum/sprite_accessory/mam_snouts/fscanidalt
	name = "Mammal, Short ALT (Top)"
	icon_state = "fscanidalt"

/datum/sprite_accessory/mam_snouts/fwolf
	name = "Mammal, Thick (Top)"
	icon_state = "fwolf"

/datum/sprite_accessory/mam_snouts/fwolfalt
	name = "Mammal, Thick ALT (Top)"
	icon_state = "fwolfalt"

/datum/sprite_accessory/mam_snouts/fredpanda
	name = "WahCoon (Top)"
	icon_state = "fwah"

/datum/sprite_accessory/mam_snouts/frhino
	name = "Horn (Top)"
	icon_state = "frhino"
	extra = TRUE
	extra = MUTCOLORS3

/datum/sprite_accessory/mam_snouts/frodent
	name = "Rodent (Top)"
	icon_state = "frodent"

/datum/sprite_accessory/mam_snouts/fhusky
	name = "Husky (Top)"
	icon_state = "fhusky"

/datum/sprite_accessory/mam_snouts/fotie
	name = "Otie (Top)"
	icon_state = "fotie"

/datum/sprite_accessory/mam_snouts/fpede
	name = "Scolipede (Top)"
	icon_state = "fpede"

/datum/sprite_accessory/mam_snouts/fsergal
	name = "Sergal (Top)"
	icon_state = "fsergal"

/datum/sprite_accessory/mam_snouts/fshark
	name = "Shark (Top)"
	icon_state = "fshark"

/datum/sprite_accessory/mam_snouts/ftoucan
	name = "Toucan (Top)"
	icon_state = "ftoucan"

/datum/sprite_accessory/mam_snouts/fsharp
	name = "Sharp (Top)"
	icon_state = "fsharp"
	color_src = MUTCOLORS

/datum/sprite_accessory/mam_snouts/fround
	name = "Round (Top)"
	icon_state = "fround"
	color_src = MUTCOLORS

/datum/sprite_accessory/mam_snouts/fsharplight
	name = "Sharp + Light (Top)"
	icon_state = "fsharplight"
	color_src = MUTCOLORS

/datum/sprite_accessory/mam_snouts/froundlight
	name = "Round + Light (Top)"
	icon_state = "froundlight"
	color_src = MUTCOLORS

/******************************************
***************** Ears ********************
*******************************************/

/datum/sprite_accessory/mam_ears/axolotl
	name = "Axolotl"
	icon_state = "axolotl"

/datum/sprite_accessory/mam_ears/bear
	name = "Bear"
	icon_state = "bear"

/datum/sprite_accessory/mam_ears/bigwolf
	name = "Big Wolf"
	icon_state = "bigwolf"

/datum/sprite_accessory/mam_ears/bigwolfinner
	name = "Big Wolf (ALT)"
	icon_state = "bigwolfinner"
	hasinner = 1

/datum/sprite_accessory/mam_ears/bigwolfdark
	name = "Dark Big Wolf"
	icon_state = "bigwolfdark"

/datum/sprite_accessory/mam_ears/bigwolfinnerdark
	name = "Dark Big Wolf (ALT)"
	icon_state = "bigwolfinnerdark"
	hasinner = 1

/datum/sprite_accessory/mam_ears/cat
	name = "Cat"
	icon_state = "cat"
	hasinner = 1
	color_src = HAIR

/datum/sprite_accessory/mam_ears/catbig
	name = "Cat, Big"
	icon_state = "catbig"

/datum/sprite_accessory/mam_ears/cow
	name = "Cow"
	icon_state = "cow"

/datum/sprite_accessory/mam_ears/curled
	name = "Curled Horn"
	icon_state = "horn1"
	color_src = MUTCOLORS3

/datum/sprite_accessory/mam_ears/deer
	name = "Deer"
	icon_state = "deer"
	color_src = MUTCOLORS3

/datum/sprite_accessory/mam_ears/eevee
	name = "Eevee"
	icon_state = "eevee"


/datum/sprite_accessory/mam_ears/elf
	name = "Elf"
	icon_state = "elf"
	color_src = MUTCOLORS3

/datum/sprite_accessory/mam_ears/gret
	name = "Gret"
	icon_state = "gret"
	color_src = MUTCOLORS3


/datum/sprite_accessory/mam_ears/elephant
	name = "Elephant"
	icon_state = "elephant"

/datum/sprite_accessory/mam_ears/fennec
	name = "Fennec"
	icon_state = "fennec"

/datum/sprite_accessory/mam_ears/fish
	name = "Fish"
	icon_state = "fish"

/datum/sprite_accessory/mam_ears/fox
	name = "Fox"
	icon_state = "fox"

/datum/sprite_accessory/mam_ears/husky
	name = "Husky"
	icon_state = "wolf"

/datum/sprite_accessory/mam_ears/kangaroo
	name = "kangaroo"
	icon_state = "kangaroo"

/datum/sprite_accessory/mam_ears/jellyfish
	name = "Jellyfish"
	icon_state = "jellyfish"
	color_src = HAIR

/datum/sprite_accessory/mam_ears/lab
	name = "Dog, Long"
	icon_state = "lab"

/datum/sprite_accessory/mam_ears/murid
	name = "Murid"
	icon_state = "murid"

/datum/sprite_accessory/mam_ears/otie
	name = "Otusian"
	icon_state = "otie"

/datum/sprite_accessory/mam_ears/squirrel
	name = "Squirrel"
	icon_state = "squirrel"

/datum/sprite_accessory/mam_ears/pede
	name = "Scolipede"
	icon_state = "pede"

/datum/sprite_accessory/mam_ears/rabbit
    name = "Rabbit"
    icon_state = "rabbit"

/datum/sprite_accessory/mam_ears/sergal
	name = "Sergal"
	icon_state = "sergal"

/datum/sprite_accessory/mam_ears/skunk
	name = "skunk"
	icon_state = "skunk"

/datum/sprite_accessory/mam_ears/wolf
	name = "Wolf"
	icon_state = "wolf"

/******************************************
*********** Tails and Things **************
*******************************************/

/datum/sprite_accessory/mam_tails/ailurus
	name = "Red Panda"
	icon_state = "wah"
	extra = TRUE

/datum/sprite_accessory/mam_tails_animated/ailurus
	name = "Red Panda"
	icon_state = "wah"
	extra = TRUE

/datum/sprite_accessory/mam_tails/axolotl
	name = "Axolotl"
	icon_state = "axolotl"

/datum/sprite_accessory/mam_tails_animated/axolotl
	name = "Axolotl"
	icon_state = "axolotl"

/datum/sprite_accessory/mam_tails/bee
	name = "Bee"
	icon_state = "bee"

/datum/sprite_accessory/mam_tails_animated/bee
	name = "Bee"
	icon_state = "bee"

/datum/sprite_accessory/mam_tails/cat
	name = "Cat"
	icon_state = "cat"
	color_src = HAIR

/datum/sprite_accessory/mam_tails_animated/cat
	name = "Cat"
	icon_state = "cat"
	color_src = HAIR

/datum/sprite_accessory/mam_tails/catbig
	name = "Cat, Big"
	icon_state = "catbig"

/datum/sprite_accessory/mam_tails_animated/catbig
	name = "Cat, Big"
	icon_state = "catbig"

/datum/sprite_accessory/mam_tails/corvid
	name = "Corvid"
	icon_state = "crow"

/datum/sprite_accessory/mam_tails_animated/corvid
	name = "Corvid"
	icon_state = "crow"

/datum/sprite_accessory/mam_tail/cow
	name = "Cow"
	icon_state = "cow"

/datum/sprite_accessory/mam_tails_animated/cow
	name = "Cow"
	icon_state = "cow"

/datum/sprite_accessory/mam_tails/eevee
	name = "Eevee"
	icon_state = "eevee"

/datum/sprite_accessory/mam_tails_animated/eevee
	name = "Eevee"
	icon_state = "eevee"

/datum/sprite_accessory/mam_tails/fennec
	name = "Fennec"
	icon_state = "fennec"

/datum/sprite_accessory/mam_tails_animated/fennec
	name = "Fennec"
	icon_state = "fennec"

/datum/sprite_accessory/mam_tails/human/fish
	name = "Fish"
	icon_state = "fish"

/datum/sprite_accessory/mam_tails_animated/human/fish
	name = "Fish"
	icon_state = "fish"

/datum/sprite_accessory/mam_tails/fox
	name = "Fox"
	icon_state = "fox"

/datum/sprite_accessory/mam_tails_animated/fox
	name = "Fox"
	icon_state = "fox"

/datum/sprite_accessory/mam_tails/hawk
	name = "Hawk"
	icon_state = "hawk"

/datum/sprite_accessory/mam_tails_animated/hawk
	name = "Hawk"
	icon_state = "hawk"

/datum/sprite_accessory/mam_tails/horse
	name = "Horse"
	icon_state = "horse"
	color_src = HAIR

/datum/sprite_accessory/mam_tails_animated/horse
	name = "Horse"
	icon_state = "Horse"
	color_src = HAIR

/datum/sprite_accessory/mam_tails/husky
	name = "Husky"
	icon_state = "husky"

/datum/sprite_accessory/mam_tails_animated/husky
	name = "Husky"
	icon_state = "husky"

datum/sprite_accessory/mam_tails/insect
	name = "Insect"
	icon_state = "insect"

/datum/sprite_accessory/mam_tails_animated/insect
	name = "Insect"
	icon_state = "insect"

/datum/sprite_accessory/mam_tails/kangaroo
	name = "kangaroo"
	icon_state = "kangaroo"

/datum/sprite_accessory/mam_tails_animated/kangaroo
	name = "kangaroo"
	icon_state = "kangaroo"

/datum/sprite_accessory/mam_tails/kitsune
	name = "Kitsune"
	icon_state = "kitsune"

/datum/sprite_accessory/mam_tails_animated/kitsune
	name = "Kitsune"
	icon_state = "kitsune"

/datum/sprite_accessory/mam_tails/lab
	name = "Lab"
	icon_state = "lab"

/datum/sprite_accessory/mam_tails_animated/lab
	name = "Lab"
	icon_state = "lab"

/datum/sprite_accessory/mam_tails/murid
	name = "Murid"
	icon_state = "murid"

/datum/sprite_accessory/mam_tails_animated/murid
	name = "Murid"
	icon_state = "murid"

/datum/sprite_accessory/mam_tails/otie
	name = "Otusian"
	icon_state = "otie"

/datum/sprite_accessory/mam_tails_animated/otie
	name = "Otusian"
	icon_state = "otie"

/datum/sprite_accessory/mam_tails/orca
	name = "Orca"
	icon_state = "orca"

/datum/sprite_accessory/mam_tails_animated/orca
	name = "Orca"
	icon_state = "orca"

/datum/sprite_accessory/mam_tails/pede
	name = "Scolipede"
	icon_state = "pede"

/datum/sprite_accessory/mam_tails_animated/pede
	name = "Scolipede"
	icon_state = "pede"

/datum/sprite_accessory/mam_tails/rabbit
	name = "Rabbit"
	icon_state = "rabbit"

/datum/sprite_accessory/mam_tails_animated/rabbit
	name = "Rabbit"
	icon_state = "rabbit"

/datum/sprite_accessory/mam_tails/sergal
	name = "Sergal"
	icon_state = "sergal"

/datum/sprite_accessory/mam_tails_animated/sergal
	name = "Sergal"
	icon_state = "sergal"

/datum/sprite_accessory/mam_tails/skunk
	name = "Skunk"
	icon_state = "skunk"

/datum/sprite_accessory/mam_tails_animated/skunk
	name = "Skunk"
	icon_state = "skunk"

/datum/sprite_accessory/mam_tails/shark
	name = "Shark"
	icon_state = "shark"

/datum/sprite_accessory/mam_tails_animated/shark
	name = "Shark"
	icon_state = "shark"

/datum/sprite_accessory/mam_tails/shepherd
	name = "Shepherd"
	icon_state = "shepherd"

/datum/sprite_accessory/mam_tails_animated/shepherd
	name = "Shepherd"
	icon_state = "shepherd"

/datum/sprite_accessory/mam_tails/straighttail
	name = "Straight Tail"
	icon_state = "straighttail"

/datum/sprite_accessory/mam_tails_animated/straighttail
	name = "Straight Tail"
	icon_state = "straighttail"

/datum/sprite_accessory/mam_tails/squirrel
	name = "Squirrel"
	icon_state = "squirrel"

/datum/sprite_accessory/mam_tails_animated/squirrel
	name = "Squirrel"
	icon_state = "squirrel"

/datum/sprite_accessory/mam_tails/tentacle
	name = "Tentacle"
	icon_state = "tentacle"

/datum/sprite_accessory/mam_tails_animated/tentacle
	name = "Tentacle"
	icon_state = "tentacle"

/datum/sprite_accessory/mam_tails/tiger
	name = "Tiger"
	icon_state = "tiger"

/datum/sprite_accessory/mam_tails_animated/tiger
	name = "Tiger"
	icon_state = "tiger"

/datum/sprite_accessory/mam_tails/wolf
	name = "Wolf"
	icon_state = "wolf"

/datum/sprite_accessory/mam_tails_animated/wolf
	name = "Wolf"
	icon_state = "wolf"

/datum/sprite_accessory/mam_tails/synthliz
	recommended_species = list("synthliz")
	color_src = MUTCOLORS
	name = "Synthetic Lizard"
	icon_state = "synthliz"

/datum/sprite_accessory/mam_tails_animated/synthliz
	recommended_species = list("synthliz")
	color_src = MUTCOLORS
	name = "Synthetic Lizard"
	icon_state = "synthliz"

/******************************************
************ Body Markings ****************
*******************************************/
/*
var/list/colorlist = list()
	colorlist.Cut()
	colorlist += ReadRGB("[H.dna.features["mcolor"]]0")
	colorlist += ReadRGB("[H.dna.features["mcolor2"]]0")
	colorlist += ReadRGB("[H.dna.features["mcolor3"]]0")
	colorlist += list(0,0,0, hair_alpha)
	for(var/index=1, index<=colorlist.len, index++)
		colorlist[index] = colorlist[index]/255
*/
// WHy IS THIS SO HARD!!!
/datum/sprite_accessory/mam_body_markings
	extra = FALSE
	extra2 = FALSE
	color_src = MATRIXED
	gender_specific = 0
	icon = 'modular_citadel/icons/mob/mam_markings.dmi'
	recommended_species = list("mammal", "xeno", "slimeperson", "podweak", "avian", "aquatic")

/datum/sprite_accessory/mam_body_markings/none
	name = "None"
	icon_state = "none"
	ckeys_allowed = list("yousshouldnteverbeseeingthisyoumeme")
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/plain
	name = "Plain"
	icon_state = "plain"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/redpanda
	name = "Redpanda"
	icon_state = "redpanda"

/datum/sprite_accessory/mam_body_markings/bee
	name = "Bee"
	icon_state = "bee"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/belly
	name = "Belly"
	icon_state = "belly"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/bellyslim
	name = "Bellyslim"
	icon_state = "bellyslim"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/corgi
	name = "Corgi"
	icon_state = "corgi"

/datum/sprite_accessory/mam_body_markings/cow
	name = "Bovine"
	icon_state = "bovine"

/datum/sprite_accessory/mam_body_markings/corvid
	name = "Corvid"
	icon_state = "corvid"

/datum/sprite_accessory/mam_body_markings/dalmation
	name = "Dalmation"
	icon_state = "dalmation"

/datum/sprite_accessory/mam_body_markings/deer
	name = "Deer"
	icon_state = "deer"

/datum/sprite_accessory/mam_body_markings/dog
	name = "Dog"
	icon_state = "dog"

/datum/sprite_accessory/mam_body_markings/eevee
	name = "Eevee"
	icon_state = "eevee"

/datum/sprite_accessory/mam_body_markings/hippo
	name = "Hippo"
	icon_state = "hippo"

/datum/sprite_accessory/mam_body_markings/fennec
	name = "Fennec"
	icon_state = "Fennec"

/datum/sprite_accessory/mam_body_markings/fox
	name = "Fox"
	icon_state = "fox"

/datum/sprite_accessory/mam_body_markings/frog
	name = "Frog"
	icon_state = "frog"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/goat
	name = "Goat"
	icon_state = "goat"

/datum/sprite_accessory/mam_body_markings/handsfeet
	name = "Handsfeet"
	icon_state = "handsfeet"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/hawk
	name = "Hawk"
	icon_state = "hawk"

/datum/sprite_accessory/mam_body_markings/husky
	name = "Husky"
	icon_state = "husky"

/datum/sprite_accessory/mam_body_markings/hyena
	name = "Hyena"
	icon_state = "hyena"

/datum/sprite_accessory/mam_body_markings/lab
	name = "Lab"
	icon_state = "lab"

/datum/sprite_accessory/mam_body_markings/moth
	name = "Moth"
	icon_state = "moth"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/otie
	name = "Otie"
	icon_state = "otie"

/datum/sprite_accessory/mam_body_markings/otter
	name = "Otter"
	icon_state = "otter"

/datum/sprite_accessory/mam_body_markings/orca
	name = "Orca"
	icon_state = "orca"

/datum/sprite_accessory/mam_body_markings/panther
	name = "Panther"
	icon_state = "panther"

/datum/sprite_accessory/mam_body_markings/possum
	name = "Possum"
	icon_state = "possum"

/datum/sprite_accessory/mam_body_markings/raccoon
	name = "Raccoon"
	icon_state = "raccoon"

/datum/sprite_accessory/mam_body_markings/pede
	name = "Scolipede"
	icon_state = "scolipede"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/shark
	name = "Shark"
	icon_state = "shark"

/datum/sprite_accessory/mam_body_markings/skunk
	name = "Skunk"
	icon_state = "skunk"

/datum/sprite_accessory/mam_body_markings/sergal
	name = "Sergal"
	icon_state = "sergal"

/datum/sprite_accessory/mam_body_markings/shepherd
	name = "Shepherd"
	icon_state = "shepherd"

/datum/sprite_accessory/mam_body_markings/tajaran
	name = "Tajaran"
	icon_state = "tajaran"

/datum/sprite_accessory/mam_body_markings/tiger
	name = "Tiger"
	icon_state = "tiger"

/datum/sprite_accessory/mam_body_markings/turian
	name = "Turian"
	icon_state = "turian"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/wolf
	name = "Wolf"
	icon_state = "wolf"

/datum/sprite_accessory/mam_body_markings/xeno
	name = "Xeno"
	icon_state = "xeno"
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'

/datum/sprite_accessory/mam_body_markings/synthliz
	recommended_species = list("synthliz")
	name = "Synthetic Lizard - Plates"
	icon_state = "synthlizscutes"

/datum/sprite_accessory/mam_body_markings/synthliz/synthliz_noplates
	name = "Synthetic Lizard - No plates"
	icon_state = "synthliznoplates"

/datum/sprite_accessory/mam_body_markings/synthliz/synthliz_pecs
	name = "Synthetic Lizard - Pecs"
	icon_state = "synthlizpecs"

/datum/sprite_accessory/mam_body_markings/synthliz/synthliz_lights
	name = "Synthetic Lizard - Lights"
	icon_state = "synthlizlights"

/datum/sprite_accessory/mam_body_markings/synthliz/synthliz_pecslight
	name = "Synthetic Lizard - Pecs Light"
	icon_state = "synthlizpecslight"

/******************************************
************ Taur Bodies ******************
*******************************************/
/datum/sprite_accessory/taur
	icon = 'modular_citadel/icons/mob/mam_taur.dmi'
	extra_icon = 'modular_citadel/icons/mob/mam_taur.dmi'
	extra = TRUE
	extra2_icon = 'modular_citadel/icons/mob/mam_taur.dmi'
	extra2 = TRUE
	center = TRUE
	dimension_x = 64
	var/taur_mode = NOT_TAURIC
	color_src = MATRIXED
	recommended_species = list("human", "lizard", "insect", "mammal", "xeno", "jelly", "slimeperson", "podweak", "avian", "aquatic")

/datum/sprite_accessory/taur/none
	name = "None"
	icon_state = "None"
	recommended_species = null

/datum/sprite_accessory/taur/cow
	name = "Cow"
	icon_state = "cow"
	taur_mode = HOOF_TAURIC

/datum/sprite_accessory/taur/deer
	name = "Deer"
	icon_state = "deer"
	taur_mode = HOOF_TAURIC
	color_src = MUTCOLORS

/datum/sprite_accessory/taur/drake
	name = "Drake"
	icon_state = "drake"
	taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/drider
	name = "Drider"
	icon_state = "drider"
	color_src = MUTCOLORS

/datum/sprite_accessory/taur/eevee
	name = "Eevee"
	icon_state = "eevee"
	taur_mode = PAW_TAURIC
	color_src = MUTCOLORS

/datum/sprite_accessory/taur/fox
	name = "Fox"
	icon_state = "fox"
	taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/husky
	name = "Husky"
	icon_state = "husky"
	taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/horse
	name = "Horse"
	icon_state = "horse"
	taur_mode = HOOF_TAURIC

/datum/sprite_accessory/taur/lab
	name = "Lab"
	icon_state = "lab"
	taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/naga
	name = "Naga"
	icon_state = "naga"
	taur_mode = SNEK_TAURIC

/datum/sprite_accessory/taur/otie
	name = "Otie"
	icon_state = "otie"
	taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/pede
	name = "Scolipede"
	icon_state = "pede"
	taur_mode = PAW_TAURIC
	color_src = MUTCOLORS

/datum/sprite_accessory/taur/panther
	name = "Panther"
	icon_state = "panther"
	taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/shepherd
	name = "Shepherd"
	icon_state = "shepherd"
	taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/tentacle
	name = "Tentacle"
	icon_state = "tentacle"
	taur_mode = SNEK_TAURIC
	color_src = MUTCOLORS

/datum/sprite_accessory/taur/tiger
	name = "Tiger"
	icon_state = "tiger"
	taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/wolf
	name = "Wolf"
	icon_state = "wolf"
	taur_mode = PAW_TAURIC

//Synth Taurs (Ported from Virgo)
/datum/sprite_accessory/taur/synthliz
	name = "Virgo - Synthetic Lizard"
	icon_state = "synthlizard"
	taur_mode = PAW_TAURIC
	recommended_species = list("synthliz")

/datum/sprite_accessory/taur/synthliz/inv
	name = "Virgo - Synthetic Lizard (Inverted)"
	icon_state = "synthlizardinv"

/datum/sprite_accessory/taur/synthliz/feline
	name = "Virgo - Synthetic Feline"
	icon_state = "synthfeline"

/datum/sprite_accessory/taur/synthliz/feline/inv
	name = "Virgo - Synthetic Feline (Inverted)"
	icon_state = "synthfelineinv"

/datum/sprite_accessory/taur/synthliz/horse
	name = "Virgo - Synthetic Horse"
	icon_state = "synthhorse"
	taur_mode = HOOF_TAURIC
	//alt_taur_mode = PAW_TAURIC

/datum/sprite_accessory/taur/synthliz/horse/inv
	name = "Virgo - Synthetic Horse (Inverted)"
	icon_state = "synthhorseinv"

/datum/sprite_accessory/taur/synthliz/wolf
	name = "Virgo - Synthetic Wolf"
	icon_state = "synthwolf"

/datum/sprite_accessory/taur/synthliz/wolf/inv
	name = "Virgo - Synthetic Wolf (Inverted)"
	icon_state = "synthwolfinv"

/******************************************
*************** Ayyliums ******************
*******************************************/

//Xeno Dorsal Tubes
/datum/sprite_accessory/xeno_dorsal
	icon = 'modular_citadel/icons/mob/xeno_parts_greyscale.dmi'

/datum/sprite_accessory/xeno_dorsal/standard
	name = "Standard"
	icon_state = "standard"

/datum/sprite_accessory/xeno_dorsal/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/xeno_dorsal/down
	name = "Dorsal Down"
	icon_state = "down"

//Xeno Tail
/datum/sprite_accessory/xeno_tail
	icon = 'modular_citadel/icons/mob/xeno_parts_greyscale.dmi'

/datum/sprite_accessory/xeno_tail/none
	name = "None"

/datum/sprite_accessory/xeno_tail/standard
	name = "Xenomorph Tail"
	icon_state = "xeno"

//Xeno Caste Heads
/datum/sprite_accessory/xeno_head
	icon = 'modular_citadel/icons/mob/xeno_parts_greyscale.dmi'

/datum/sprite_accessory/xeno_head/standard
	name = "Standard"
	icon_state = "standard"

/datum/sprite_accessory/xeno_head/royal
	name = "royal"
	icon_state = "royal"

/datum/sprite_accessory/xeno_head/hollywood
	name = "hollywood"
	icon_state = "hollywood"

/datum/sprite_accessory/xeno_head/warrior
	name = "warrior"
	icon_state = "warrior"

// IPCs
/datum/sprite_accessory/screen
	icon = 'modular_citadel/icons/mob/ipc_screens.dmi'
	color_src = null

/datum/sprite_accessory/screen/blank
	name = "Blank"
	icon_state = "blank"

/datum/sprite_accessory/screen/pink
	name = "Pink"
	icon_state = "pink"

/datum/sprite_accessory/screen/green
	name = "Green"
	icon_state = "green"

/datum/sprite_accessory/screen/red
	name = "Red"
	icon_state = "red"

/datum/sprite_accessory/screen/blue
	name = "Blue"
	icon_state = "blue"

/datum/sprite_accessory/screen/yellow
	name = "Yellow"
	icon_state = "yellow"

/datum/sprite_accessory/screen/shower
	name = "Shower"
	icon_state = "shower"

/datum/sprite_accessory/screen/nature
	name = "Nature"
	icon_state = "nature"

/datum/sprite_accessory/screen/eight
	name = "Eight"
	icon_state = "eight"

/datum/sprite_accessory/screen/goggles
	name = "Goggles"
	icon_state = "goggles"

/datum/sprite_accessory/screen/heart
	name = "Heart"
	icon_state = "heart"

/datum/sprite_accessory/screen/monoeye
	name = "Mono eye"
	icon_state = "monoeye"

/datum/sprite_accessory/screen/breakout
	name = "Breakout"
	icon_state = "breakout"

/datum/sprite_accessory/screen/purple
	name = "Purple"
	icon_state = "purple"

/datum/sprite_accessory/screen/scroll
	name = "Scroll"
	icon_state = "scroll"

/datum/sprite_accessory/screen/console
	name = "Console"
	icon_state = "console"

/datum/sprite_accessory/screen/rgb
	name = "RGB"
	icon_state = "rgb"

/datum/sprite_accessory/screen/golglider
	name = "Gol Glider"
	icon_state = "golglider"

/datum/sprite_accessory/screen/rainbow
	name = "Rainbow"
	icon_state = "rainbow"

/datum/sprite_accessory/screen/sunburst
	name = "Sunburst"
	icon_state = "sunburst"

/datum/sprite_accessory/screen/static
	name = "Static"
	icon_state = "static"

//Oracle Station sprites

/datum/sprite_accessory/screen/bsod
	name = "BSOD"
	icon_state = "bsod"

/datum/sprite_accessory/screen/redtext
	name = "Red Text"
	icon_state = "retext"

/datum/sprite_accessory/screen/sinewave
	name = "Sine wave"
	icon_state = "sinewave"

/datum/sprite_accessory/screen/squarewave
	name = "Square wave"
	icon_state = "squarwave"

/datum/sprite_accessory/screen/ecgwave
	name = "ECG wave"
	icon_state = "ecgwave"

/datum/sprite_accessory/screen/eyes
	name = "Eyes"
	icon_state = "eyes"

/datum/sprite_accessory/screen/textdrop
	name = "Text drop"
	icon_state = "textdrop"

/datum/sprite_accessory/screen/stars
	name = "Stars"
	icon_state = "stars"

// IPC Antennas

/datum/sprite_accessory/antenna
	icon = 'modular_citadel/icons/mob/ipc_antennas.dmi'
	color_src = MUTCOLORS2
	recommended_species = list("ipc")

/datum/sprite_accessory/antenna/none
	name = "None"
	icon_state = "None"
	recommended_species = null

/datum/sprite_accessory/antenna/antennae
	name = "Angled Antennae"
	icon_state = "antennae"

/datum/sprite_accessory/antenna/tvantennae
	name = "TV Antennae"
	icon_state = "tvantennae"

/datum/sprite_accessory/antenna/cyberhead
	name = "Cyberhead"
	icon_state = "cyberhead"

/datum/sprite_accessory/antenna/antlers
	name = "Antlers"
	icon_state = "antlers"

/datum/sprite_accessory/antenna/crowned
	name = "Crowned"
	icon_state = "crowned"

/datum/sprite_accessory/antenna/synthliz
	recommended_species = list("synthliz")
	color_src = MUTCOLORS
	name = "Synthetic Lizard - Antennae"
	icon_state = "synth_antennae"

/datum/sprite_accessory/antenna/synthliz/synthliz_curled
	color_src = MUTCOLORS
	name = "Synthetic Lizard - Curled"
	icon_state = "synth_curled"

/datum/sprite_accessory/antenna/synthliz/synthliz_thick
	color_src = MUTCOLORS
	name = "Synthetic Lizard - Thick"
	icon_state = "synth_thick"

/datum/sprite_accessory/antenna/synthliz/synth_thicklight
	color_src = MATRIXED
	name = "Synthetic Lizard - Thick Light"
	icon_state = "synth_thicklight"

/datum/sprite_accessory/antenna/synthliz/synth_short
	color_src = MUTCOLORS
	name = "Synthetic Lizard - Short"
	icon_state = "synth_short"

/datum/sprite_accessory/antenna/synthliz/synth_sharp
	color_src = MUTCOLORS
	name = "Synthetic Lizard - Sharp"
	icon_state = "synth_sharp"

/datum/sprite_accessory/antenna/synthliz/synth_sharplight
	color_src = MATRIXED
	name = "Synthetic Lizard - Sharp Light"
	icon_state = "synth_sharplight"

/datum/sprite_accessory/antenna/synthliz/synth_horns
	color_src = MUTCOLORS
	name = "Synthetic Lizard - Horns"
	icon_state = "synth_horns"

/datum/sprite_accessory/antenna/synthliz/synth_hornslight
	color_src = MATRIXED
	name = "Synthetic Lizard - Horns Light"
	icon_state = "synth_hornslight"

// *** Snooooow flaaaaake ***

/datum/sprite_accessory/horns/guilmon
	name = "Guilmon"
	icon_state = "guilmon"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/snout/guilmon
	name = "Guilmon"
	icon_state = "guilmon"
	color_src = MATRIXED

/datum/sprite_accessory/mam_tails/shark/datashark
	name = "DataShark"
	icon_state = "datashark"
	ckeys_allowed = list("rubyflamewing")

/datum/sprite_accessory/mam_tails_animated/shark/datashark
	name = "DataShark"
	icon_state = "datashark"

/datum/sprite_accessory/mam_body_markings/shark/datashark
	name = "DataShark"
	icon_state = "datashark"
	ckeys_allowed = list("rubyflamewing")

//Sabresune
/datum/sprite_accessory/mam_ears/sabresune
	name = "sabresune"
	icon_state = "sabresune"
	ckeys_allowed = list("poojawa")
	extra = TRUE

/datum/sprite_accessory/mam_tails/sabresune
	name = "sabresune"
	icon_state = "sabresune"
	ckeys_allowed = list("poojawa")


/datum/sprite_accessory/mam_tails_animated/sabresune
	name = "sabresune"
	icon_state = "sabresune"

/datum/sprite_accessory/mam_body_markings/sabresune
	name = "Sabresune"
	icon_state = "sabresune"
	ckeys_allowed = list("poojawa")


//Lunasune
/datum/sprite_accessory/mam_ears/lunasune
	name = "lunasune"
	icon_state = "lunasune"
	ckeys_allowed = list("invader4352")

/datum/sprite_accessory/mam_tails/lunasune
	name = "lunasune"
	icon_state = "lunasune"
	ckeys_allowed = list("invader4352")

/datum/sprite_accessory/mam_tails_animated/lunasune
	name = "lunasune"
	icon_state = "lunasune"

/*************** VIRGO PORTED HAIRS ****************************/
/*
#define VHAIR(_name, new_state) /datum/sprite_accessory/hair/##new_state/icon_state=#new_state;/datum/sprite_accessory/hair/##new_state/name = #_name + " (Virgo)"
//VIRGO PORTED HAIRS
VHAIR("Short Hair Rosa", hair_rosa_s)
VHAIR("Short Hair 80s", hair_80s_s)
VHAIR("Long Bedhead", hair_long_bedhead_s)
VHAIR("Dave", hair_dave_s)
VHAIR("Country", hair_country_s)
VHAIR("Shy", hair_shy_s)
VHAIR("Unshaven Mohawk", hair_unshaven_mohawk_s)
VHAIR("Manbun", hair_manbun_s)
VHAIR("Longer Bedhead", hair_longer_bedhead_s)
VHAIR("Ponytail", hair_ponytail_s)
VHAIR("Ziegler", hair_ziegler_s)
VHAIR("Emo Fringe", hair_emofringe_s)
VHAIR("Very Short Over Eye Alt", hair_veryshortovereyealternate_s)
VHAIR("Shorthime", hair_shorthime_s)
VHAIR("High Tight", hair_hightight_s)
VHAIR("Thinning Front", hair_thinningfront_s)
VHAIR("Big Afro", hair_bigafro_s)
VHAIR("Afro", hair_afro_s)
VHAIR("High Braid", hair_hbraid_s)
VHAIR("Braid", hair_braid_s)
VHAIR("Sargeant", hair_sargeant_s)
VHAIR("Gelled", hair_gelled_s)
VHAIR("Kagami", hair_kagami_s)
VHAIR("ShortTail", hair_stail_s)
VHAIR("Gentle", hair_gentle_s)
VHAIR("Grande", hair_grande_s)
VHAIR("Bobcurl", hair_bobcurl_s)
VHAIR("Pompadeur", hair_pompadour_s)
VHAIR("Plait", hair_plait_s)
VHAIR("Long", hair_long_s)
VHAIR("Rattail", hair_rattail_s)
VHAIR("Tajspiky", hair_tajspiky_s)
VHAIR("Messy", hair_messy_s)
VHAIR("Bangs", hair_bangs_s)
VHAIR("TBraid", hair_tbraid_s)
VHAIR("Toriyama2", hair_toriyama2_s)
VHAIR("CIA", hair_cia_s)
VHAIR("Mulder", hair_mulder_s)
VHAIR("Scully", hair_scully_s)
VHAIR("Nitori", hair_nitori_s)
VHAIR("Joestar", hair_joestar_s)
VHAIR("Ponytail4", hair_ponytail4_s)
VHAIR("Ponytail5", hair_ponytail5_s)
VHAIR("Beehive2", hair_beehive2_s)
VHAIR("Short Braid", hair_shortbraid_s)
VHAIR("Reverse Mohawk", hair_reversemohawk_s)
VHAIR("SHort Bangs", hair_shortbangs_s)
VHAIR("Half Shaved", hair_halfshaved_s)
VHAIR("Longer Alt 2", hair_longeralt2_s)
VHAIR("Bun", hair_bun_s)
VHAIR("Curly", hair_curly_s)
VHAIR("Victory", hair_victory_s)
VHAIR("Ponytail6", hair_ponytail6_s)
VHAIR("Undercut3", hair_undercut3_s)
VHAIR("Bobcut Alt", hair_bobcultalt_s)
VHAIR("Fingerwave", hair_fingerwave_s)
VHAIR("Oxton", hair_oxton_s)
VHAIR("Poofy2", hair_poofy2_s)
VHAIR("Fringe Tail", hair_fringetail_s)
VHAIR("Bun3", hair_bun3_s)
VHAIR("Wisp", hair_wisp_s)
VHAIR("Undercut2", hair_undercut2_s)
VHAIR("TBob", hair_tbob_s)
VHAIR("Spiky Ponytail", hair_spikyponytail_s)
VHAIR("Rowbun", hair_rowbun_s)
VHAIR("Rowdualtail", hair_rowdualtail_s)
VHAIR("Rowbraid", hair_rowbraid_s)
VHAIR("Shaved Mohawk", hair_shavedmohawk_s)
VHAIR("Topknot", hair_topknot_s)
VHAIR("Ronin", hair_ronin_s)
VHAIR("Bowlcut2", hair_bowlcut2_s)
VHAIR("Thinning Rear", hair_thinningrear_s)
VHAIR("Thinning", hair_thinning_s)
VHAIR("Jade", hair_jade_s)
VHAIR("Bedhead", hair_bedhead_s)
VHAIR("Dreadlocks", hair_dreads_s)
VHAIR("Very Long", hair_vlong_s)
VHAIR("Jensen", hair_jensen_s)
VHAIR("Halfbang", hair_halfbang_s)
VHAIR("Kusangi", hair_kusangi_s)
VHAIR("Ponytail", hair_ponytail_s)
VHAIR("Ponytail3", hair_ponytail3_s)
VHAIR("Halfbang Alt", hair_halfbang_alt_s)
VHAIR("Bedhead V2", hair_bedheadv2_s)
VHAIR("Long Fringe", hair_longfringe_s)
VHAIR("Flair", hair_flair_s)
VHAIR("Bedhead V3", hair_bedheadv3_s)
VHAIR("Himecut", hair_himecut_s)
VHAIR("Curls", hair_curls_s)
VHAIR("Very Long Fringe", hair_vlongfringe_s)
VHAIR("Longest", hair_longest_s)
VHAIR("Father", hair_father_s)
VHAIR("Emo Long", hair_emolong_s)
VHAIR("Short Hair 3", hair_shorthair3_s)
VHAIR("Double Bun", hair_doublebun_s)
VHAIR("Sleeze", hair_sleeze_s)
VHAIR("Twintail", hair_twintail_s)
VHAIR("Emo 2", hair_emo2_s)
VHAIR("Low Fade", hair_lowfade_s)
VHAIR("Med Fade", hair_medfade_s)
VHAIR("High Fade", hair_highfade_s)
VHAIR("Bald Fade", hair_baldfade_s)
VHAIR("No Fade", hair_nofade_s)
VHAIR("Trim Flat", hair_trimflat_s)
VHAIR("Shaved", hair_shaved_s)
VHAIR("Trimmed", hair_trimmed_s)
VHAIR("Tight Bun", hair_tightbun_s)
VHAIR("Short Hair 4", hair_d_s)
VHAIR("Short Hair 5", hair_e_s)
VHAIR("Short Hair 6", hair_f_s)
VHAIR("Skinhead", hair_skinhead_s)
VHAIR("Afro2", hair_afro2_s)
VHAIR("Bobcut", hair_bobcut_s)
VHAIR("Emo", hair_emo_s)
VHAIR("Long Over Eye", hair_longovereye_s)
VHAIR("Feather", hair_feather_s)
VHAIR("Hitop", hair_hitop_s)
VHAIR("Short Over Eye", hair_shortoverye_s)
VHAIR("Straight", hair_straight_s)
VHAIR("Buzzcut", hair_buzzcut_s)
VHAIR("Combover", hair_combover_s)
VHAIR("Crewcut", hair_crewcut_s)
VHAIR("Devillock", hair_devilock_s)
VHAIR("Clean", hair_clean_s)
VHAIR("Shaggy", hair_shaggy_s)
VHAIR("Updo", hair_updo_s)
VHAIR("Mohawk", hair_mohawk_s)
VHAIR("Odango", hair_odango_s)
VHAIR("Ombre", hair_ombre_s)
VHAIR("Parted", hair_parted_s)
VHAIR("Quiff", hair_quiff_s)
VHAIR("Volaju", hair_volaju_s)
VHAIR("Bun2", hair_bun2_s)
VHAIR("Rows1", hair_rows1_s)
VHAIR("Rows2", hair_rows2_s)
VHAIR("Dandy Pompadour", hair_dandypompadour_s)
VHAIR("Poofy", hair_poofy_s)
VHAIR("Toriyama", hair_toriyama_s)
VHAIR("Drillruru", hair_drillruru_s)
VHAIR("Bowlcut", hair_bowlcut_s)
VHAIR("Coffee House", hair_coffeehouse_s)
VHAIR("Family Man", hair_thefamilyman_s)
VHAIR("Shaved Part", hair_shavedpart_s)
VHAIR("Modern", hair_modern_s)
VHAIR("One Shoulder", hair_oneshoulder_s)
VHAIR("Very Short Over Eye", hair_veryshortovereye_s)
VHAIR("Unkept", hair_unkept_s)
VHAIR("Wife", hair_wife_s)
VHAIR("Nia", hair_nia_s)
VHAIR("Undercut", hair_undercut_s)
VHAIR("Bobcut Alt", hair_bobcutalt_s)
VHAIR("Short Hair 4 alt", hair_shorthair4_s)
VHAIR("Tressshoulder", hair_tressshoulder_s)
 //END
#undef VHAIR

#define VFACE(_name, new_state) /datum/sprite_accessory/facial_hair/##new_state/icon_state=#new_state;;/datum/sprite_accessory/facial_hair/##new_state/name= #_name + " (Virgo)"
VFACE("Watson", facial_watson_s)
VFACE("Chaplin", facial_chaplin_s)
VFACE("Fullbeard", facial_fullbeard_s)
VFACE("Vandyke", facial_vandyke_s)
VFACE("Elvis", facial_elvis_s)
VFACE("Abe", facial_abe_s)
VFACE("Chin", facial_chin_s)
VFACE("GT", facial_gt_s)
VFACE("Hip", facial_hip_s)
VFACE("Hogan", facial_hogan_s)
VFACE("Selleck", facial_selleck_s)
VFACE("Neckbeard", facial_neckbeard_s)
VFACE("Longbeard", facial_longbeard_s)
VFACE("Dwarf", facial_dwarf_s)
VFACE("Sideburn", facial_sideburn_s)
VFACE("Mutton", facial_mutton_s)
VFACE("Moustache", facial_moustache_s)
VFACE("Pencilstache", facial_pencilstache_s)
VFACE("Goatee", facial_goatee_s)
VFACE("Smallstache", facial_smallstache_s)
VFACE("Volaju", facial_volaju_s)
VFACE("3 O\'clock", facial_3oclock_s)
VFACE("5 O\'clock", facial_5oclock_s)
VFACE("7 O\'clock", facial_7oclock_s)
VFACE("5 O\'clock Moustache", facial_5oclockmoustache_s)
VFACE("7 O\'clock", facial_7oclockmoustache_s)
VFACE("Walrus", facial_walrus_s)
VFACE("Muttonmus", facial_muttonmus_s)
VFACE("Wise", facial_wise_s)
VFACE("Martial Artist", facial_martialartist_s)
VFACE("Dorsalfnil", facial_dorsalfnil_s)
VFACE("Hornadorns", facial_hornadorns_s)
VFACE("Spike", facial_spike_s)
VFACE("Chinhorns", facial_chinhorns_s)
VFACE("Cropped Fullbeard", facial_croppedfullbeard_s)
VFACE("Chinless Beard", facial_chinlessbeard_s)
VFACE("Moonshiner", facial_moonshiner_s)
VFACE("Tribearder", facial_tribearder_s)
#undef VFACE
// Hypercit ends.
*/

//////////////////////
// Hair Definitions //
//////////////////////
/datum/sprite_accessory/hair
	icon = 'icons/mob/human_face.dmi'	  // default icon for all hairs

	// please make sure they're sorted alphabetically and, where needed, categorized
	// try to capitalize the names please~
	// try to spell
	// you do not need to define _s or _l sub-states, game automatically does this for you

/datum/sprite_accessory/hair/afro
	name = "Afro"
	icon_state = "hair_afro"

/datum/sprite_accessory/hair/afro2
	name = "Afro 2"
	icon_state = "hair_afro2"

/datum/sprite_accessory/hair/afro_large
	name = "Afro (Large)"
	icon_state = "hair_bigafro"

/datum/sprite_accessory/hair/antenna
	name = "Ahoge"
	icon_state = "hair_antenna"

/datum/sprite_accessory/hair/bald
	name = "Bald"
	icon_state = null

/datum/sprite_accessory/hair/balding
	name = "Balding Hair"
	icon_state = "hair_e"

/datum/sprite_accessory/hair/bedhead
	name = "Bedhead"
	icon_state = "hair_bedhead"

/datum/sprite_accessory/hair/bedhead2
	name = "Bedhead 2"
	icon_state = "hair_bedheadv2"

/datum/sprite_accessory/hair/bedhead3
	name = "Bedhead 3"
	icon_state = "hair_bedheadv3"

/datum/sprite_accessory/hair/bedheadlong
	name = "Long Bedhead"
	icon_state = "hair_long_bedhead"

/datum/sprite_accessory/hair/bedheadfloorlength
	name = "Floorlength Bedhead"
	icon_state = "hair_floorlength_bedhead"

/datum/sprite_accessory/hair/beehive
	name = "Beehive"
	icon_state = "hair_beehive"

/datum/sprite_accessory/hair/beehive2
	name = "Beehive 2"
	icon_state = "hair_beehivev2"

/datum/sprite_accessory/hair/bob
	name = "Bob Hair"
	icon_state = "hair_bob"

/datum/sprite_accessory/hair/bob2
	name = "Bob Hair 2"
	icon_state = "hair_bob2"

/datum/sprite_accessory/hair/bob3
	name = "Bob Hair 3"
	icon_state = "hair_bobcut"

/datum/sprite_accessory/hair/bob4
	name = "Bob Hair 4"
	icon_state = "hair_bob4"

/datum/sprite_accessory/hair/bobcurl
	name = "Bobcurl"
	icon_state = "hair_bobcurl"

/datum/sprite_accessory/hair/boddicker
	name = "Boddicker"
	icon_state = "hair_boddicker"

/datum/sprite_accessory/hair/bowlcut
	name = "Bowlcut"
	icon_state = "hair_bowlcut"

/datum/sprite_accessory/hair/bowlcut2
	name = "Bowlcut 2"
	icon_state = "hair_bowlcut2"

/datum/sprite_accessory/hair/braid
	name = "Braid (Floorlength)"
	icon_state = "hair_braid"

/datum/sprite_accessory/hair/braided
	name = "Braided"
	icon_state = "hair_braided"

/datum/sprite_accessory/hair/front_braid
	name = "Braided Front"
	icon_state = "hair_braidfront"

/datum/sprite_accessory/hair/not_floorlength_braid
	name = "Braid (High)"
	icon_state = "hair_braid2"

/datum/sprite_accessory/hair/lowbraid
	name = "Braid (Low)"
	icon_state = "hair_hbraid"

/datum/sprite_accessory/hair/shortbraid
	name = "Braid (Short)"
	icon_state = "hair_shortbraid"

/datum/sprite_accessory/hair/braidtail
	name = "Braided Tail"
	icon_state = "hair_braidtail"

/datum/sprite_accessory/hair/bun
	name = "Bun Head"
	icon_state = "hair_bun"

/datum/sprite_accessory/hair/bun2
	name = "Bun Head 2"
	icon_state = "hair_bunhead2"

/datum/sprite_accessory/hair/bun3
	name = "Bun Head 3"
	icon_state = "hair_bun3"

/datum/sprite_accessory/hair/largebun
	name = "Bun (Large)"
	icon_state = "hair_largebun"

/datum/sprite_accessory/hair/manbun
	name = "Bun (Manbun)"
	icon_state = "hair_manbun"

/datum/sprite_accessory/hair/tightbun
	name = "Bun (Tight)"
	icon_state = "hair_tightbun"

/datum/sprite_accessory/hair/bun2
	name = "Bun Head 2"
	icon_state = "hair_bunhead2"

/datum/sprite_accessory/hair/bun3
	name = "Bun Head 3"
	icon_state = "hair_bun3"

/datum/sprite_accessory/hair/business
	name = "Business Hair"
	icon_state = "hair_business"

/datum/sprite_accessory/hair/business2
	name = "Business Hair 2"
	icon_state = "hair_business2"

/datum/sprite_accessory/hair/business3
	name = "Business Hair 3"
	icon_state = "hair_business3"

/datum/sprite_accessory/hair/business4
	name = "Business Hair 4"
	icon_state = "hair_business4"

/datum/sprite_accessory/hair/buzz
	name = "Buzzcut"
	icon_state = "hair_buzzcut"

/datum/sprite_accessory/hair/cia
	name = "CIA"
	icon_state = "hair_cia"

/datum/sprite_accessory/hair/coffeehouse
	name = "Coffee House"
	icon_state = "hair_coffeehouse"

/datum/sprite_accessory/hair/combover
	name = "Combover"
	icon_state = "hair_combover"

/datum/sprite_accessory/hair/cornrows1
	name = "Cornrows"
	icon_state = "hair_cornrows"

/datum/sprite_accessory/hair/cornrows2
	name = "Cornrows 2"
	icon_state = "hair_cornrows2"

/datum/sprite_accessory/hair/cornrowbun
	name = "Cornrow Bun"
	icon_state = "hair_cornrowbun"

/datum/sprite_accessory/hair/cornrowbraid
	name = "Cornrow Braid"
	icon_state = "hair_cornrowbraid"

/datum/sprite_accessory/hair/cornrowdualtail
	name = "Cornrow Tail"
	icon_state = "hair_cornrowtail"

/datum/sprite_accessory/hair/crew
	name = "Crewcut"
	icon_state = "hair_crewcut"

/datum/sprite_accessory/hair/curls
	name = "Curls"
	icon_state = "hair_curls"

/datum/sprite_accessory/hair/cut
	name = "Cut Hair"
	icon_state = "hair_c"

/datum/sprite_accessory/hair/dandpompadour
	name = "Dandy Pompadour"
	icon_state = "hair_dandypompadour"

/datum/sprite_accessory/hair/devillock
	name = "Devil Lock"
	icon_state = "hair_devilock"

/datum/sprite_accessory/hair/doublebun
	name = "Double Bun"
	icon_state = "hair_doublebun"

/datum/sprite_accessory/hair/dreadlocks
	name = "Dreadlocks"
	icon_state = "hair_dreads"

/datum/sprite_accessory/hair/drillhair
	name = "Drill Hair"
	icon_state = "hair_drillhair"

/datum/sprite_accessory/hair/drillhair
	name = "Drillruru"
	icon_state = "hair_drillruru"

/datum/sprite_accessory/hair/drillhairextended
	name = "Drill Hair (Extended)"
	icon_state = "hair_drillhairextended"

/datum/sprite_accessory/hair/emo
	name = "Emo"
	icon_state = "hair_emo"

/datum/sprite_accessory/hair/emofrine
	name = "Emo Fringe"
	icon_state = "hair_emofringe"

/datum/sprite_accessory/hair/nofade
	name = "Fade (None)"
	icon_state = "hair_nofade"

/datum/sprite_accessory/hair/highfade
	name = "Fade (High)"
	icon_state = "hair_highfade"

/datum/sprite_accessory/hair/medfade
	name = "Fade (Medium)"
	icon_state = "hair_medfade"

/datum/sprite_accessory/hair/lowfade
	name = "Fade (Low)"
	icon_state = "hair_lowfade"

/datum/sprite_accessory/hair/baldfade
	name = "Fade (Bald)"
	icon_state = "hair_baldfade"

/datum/sprite_accessory/hair/feather
	name = "Feather"
	icon_state = "hair_feather"

/datum/sprite_accessory/hair/father
	name = "Father"
	icon_state = "hair_father"

/datum/sprite_accessory/hair/sargeant
	name = "Flat Top"
	icon_state = "hair_sargeant"

/datum/sprite_accessory/hair/flair
	name = "Flair"
	icon_state = "hair_flair"

/datum/sprite_accessory/hair/bigflattop
	name = "Flat Top (Big)"
	icon_state = "hair_bigflattop"

/datum/sprite_accessory/hair/fag
	name = "Flow Hair"
	icon_state = "hair_f"

/datum/sprite_accessory/hair/gelled
	name = "Gelled Back"
	icon_state = "hair_gelled"

/datum/sprite_accessory/hair/gentle
	name = "Gentle"
	icon_state = "hair_gentle"

/datum/sprite_accessory/hair/halfbang
	name = "Half-banged Hair"
	icon_state = "hair_halfbang"

/datum/sprite_accessory/hair/halfbang2
	name = "Half-banged Hair 2"
	icon_state = "hair_halfbang2"

/datum/sprite_accessory/hair/halfshaved
	name = "Half-shaved"
	icon_state = "hair_halfshaved"

/datum/sprite_accessory/hair/hedgehog
	name = "Hedgehog Hair"
	icon_state = "hair_hedgehog"

/datum/sprite_accessory/hair/himecut
	name = "Hime Cut"
	icon_state = "hair_himecut"

/datum/sprite_accessory/hair/himecut2
	name = "Hime Cut 2"
	icon_state = "hair_himecut2"

/datum/sprite_accessory/hair/shorthime
	name = "Hime Cut (Short)"
	icon_state = "hair_shorthime"

/datum/sprite_accessory/hair/himeup
	name = "Hime Updo"
	icon_state = "hair_himeup"

/datum/sprite_accessory/hair/hitop
	name = "Hitop"
	icon_state = "hair_hitop"

/datum/sprite_accessory/hair/jade
	name = "Jade"
	icon_state = "hair_jade"

/datum/sprite_accessory/hair/jensen
	name = "Jensen Hair"
	icon_state = "hair_jensen"

/datum/sprite_accessory/hair/Joestar
	name = "Joestar"
	icon_state = "hair_joestar"

/datum/sprite_accessory/hair/keanu
	name = "Keanu Hair"
	icon_state = "hair_keanu"

/datum/sprite_accessory/hair/kusangi
	name = "Kusanagi Hair"
	icon_state = "hair_kusanagi"

/datum/sprite_accessory/hair/long
	name = "Long Hair 1"
	icon_state = "hair_long"

/datum/sprite_accessory/hair/long2
	name = "Long Hair 2"
	icon_state = "hair_long2"

/datum/sprite_accessory/hair/long3
	name = "Long Hair 3"
	icon_state = "hair_long3"

/datum/sprite_accessory/hair/long_over_eye
	name = "Long Over Eye"
	icon_state = "hair_longovereye"

/datum/sprite_accessory/hair/longbangs
	name = "Long Bangs"
	icon_state = "hair_lbangs"

/datum/sprite_accessory/hair/longemo
	name = "Long Emo"
	icon_state = "hair_longemo"

/datum/sprite_accessory/hair/longfringe
	name = "Long Fringe"
	icon_state = "hair_longfringe"

/datum/sprite_accessory/hair/sidepartlongalt
	name = "Long Side Part"
	icon_state = "hair_longsidepart"

/datum/sprite_accessory/hair/megaeyebrows
	name = "Mega Eyebrows"
	icon_state = "hair_megaeyebrows"

/datum/sprite_accessory/hair/messy
	name = "Messy"
	icon_state = "hair_messy"

/datum/sprite_accessory/hair/modern
	name = "Modern"
	icon_state = "hair_modern"

/datum/sprite_accessory/hair/mohawk
	name = "Mohawk"
	icon_state = "hair_d"

/datum/sprite_accessory/hair/nitori
	name = "Nitori"
	icon_state = "hair_nitori"

/datum/sprite_accessory/hair/reversemohawk
	name = "Mohawk (Reverse)"
	icon_state = "hair_reversemohawk"

/datum/sprite_accessory/hair/shavedmohawk
	name = "Mohawk (Shaved)"
	icon_state = "hair_shavedmohawk"

/datum/sprite_accessory/hair/shavedmohawk
	name = "Mohawk (Unshaven)"
	icon_state = "hair_unshaven_mohawk"

/datum/sprite_accessory/hair/mulder
	name = "Mulder"
	icon_state = "hair_mulder"

/datum/sprite_accessory/hair/odango
	name = "Odango"
	icon_state = "hair_odango"

/datum/sprite_accessory/hair/ombre
	name = "Ombre"
	icon_state = "hair_ombre"

/datum/sprite_accessory/hair/oneshoulder
	name = "One Shoulder"
	icon_state = "hair_oneshoulder"

/datum/sprite_accessory/hair/over_eye
	name = "Over Eye"
	icon_state = "hair_shortovereye"

/datum/sprite_accessory/hair/oxton
	name = "Oxton"
	icon_state = "hair_oxton"

/datum/sprite_accessory/hair/parted
	name = "Parted"
	icon_state = "hair_parted"

/datum/sprite_accessory/hair/partedside
	name = "Parted (Side)"
	icon_state = "hair_part"

/datum/sprite_accessory/hair/kagami
	name = "Pigtails"
	icon_state = "hair_kagami"

/datum/sprite_accessory/hair/pigtail
	name = "Pigtails 2"
	icon_state = "hair_pigtails"

/datum/sprite_accessory/hair/pigtail2
	name = "Pigtails 3"
	icon_state = "hair_pigtails2"

/datum/sprite_accessory/hair/pixie
	name = "Pixie Cut"
	icon_state = "hair_pixie"

/datum/sprite_accessory/hair/pompadour
	name = "Pompadour"
	icon_state = "hair_pompadour"

/datum/sprite_accessory/hair/bigpompadour
	name = "Pompadour (Big)"
	icon_state = "hair_bigpompadour"

/datum/sprite_accessory/hair/ponytail1
	name = "Ponytail"
	icon_state = "hair_ponytail"

/datum/sprite_accessory/hair/ponytail2
	name = "Ponytail 2"
	icon_state = "hair_ponytail2"

/datum/sprite_accessory/hair/ponytail3
	name = "Ponytail 3"
	icon_state = "hair_ponytail3"

/datum/sprite_accessory/hair/ponytail4
	name = "Ponytail 4"
	icon_state = "hair_ponytail4"

/datum/sprite_accessory/hair/ponytail5
	name = "Ponytail 5"
	icon_state = "hair_ponytail5"

/datum/sprite_accessory/hair/ponytail6
	name = "Ponytail 6"
	icon_state = "hair_ponytail6"

/datum/sprite_accessory/hair/ponytail7
	name = "Ponytail 7"
	icon_state = "hair_ponytail7"

/datum/sprite_accessory/hair/highponytail
	name = "Ponytail (High)"
	icon_state = "hair_highponytail"

/datum/sprite_accessory/hair/stail
	name = "Ponytail (Short)"
	icon_state = "hair_stail"

/datum/sprite_accessory/hair/longponytail
	name = "Ponytail (Long)"
	icon_state = "hair_longstraightponytail"

/datum/sprite_accessory/hair/countryponytail
	name = "Ponytail (Country)"
	icon_state = "hair_country"

/datum/sprite_accessory/hair/fringetail
	name = "Ponytail (Fringe)"
	icon_state = "hair_fringetail"

/datum/sprite_accessory/hair/sidetail
	name = "Ponytail (Side)"
	icon_state = "hair_sidetail"

/datum/sprite_accessory/hair/sidetail2
	name = "Ponytail (Side) 2"
	icon_state = "hair_sidetail2"

/datum/sprite_accessory/hair/sidetail3
	name = "Ponytail (Side) 3"
	icon_state = "hair_sidetail3"

/datum/sprite_accessory/hair/sidetail4
	name = "Ponytail (Side) 4"
	icon_state = "hair_sidetail4"

/datum/sprite_accessory/hair/spikyponytail
	name = "Ponytail (Spiky)"
	icon_state = "hair_spikyponytail"

/datum/sprite_accessory/hair/poofy
	name = "Poofy"
	icon_state = "hair_poofy"

/datum/sprite_accessory/hair/quiff
	name = "Quiff"
	icon_state = "hair_quiff"

/datum/sprite_accessory/hair/ronin
	name = "Ronin"
	icon_state = "hair_ronin"

/datum/sprite_accessory/hair/shaved
	name = "Shaved"
	icon_state = "hair_shaved"

/datum/sprite_accessory/hair/shavedpart
	name = "Shaved Part"
	icon_state = "hair_shavedpart"

/datum/sprite_accessory/hair/shortbangs
	name = "Short Bangs"
	icon_state = "hair_shortbangs"

/datum/sprite_accessory/hair/short
	name = "Short Hair"
	icon_state = "hair_a"

/datum/sprite_accessory/hair/shorthair2
	name = "Short Hair 2"
	icon_state = "hair_shorthair2"

/datum/sprite_accessory/hair/shorthair3
	name = "Short Hair 3"
	icon_state = "hair_shorthair3"

/datum/sprite_accessory/hair/shorthair4
	name = "Short Hair 4"
	icon_state = "hair_d"

/datum/sprite_accessory/hair/shorthair5
	name = "Short Hair 5"
	icon_state = "hair_e"

/datum/sprite_accessory/hair/shorthair6
	name = "Short Hair 6"
	icon_state = "hair_f"

/datum/sprite_accessory/hair/shorthair7
	name = "Short Hair 7"
	icon_state = "hair_shorthairg"

/datum/sprite_accessory/hair/shorthaireighties
	name = "Short Hair 80s"
	icon_state = "hair_80s"

/datum/sprite_accessory/hair/rosa
	name = "Short Hair Rosa"
	icon_state = "hair_rosa"

/datum/sprite_accessory/hair/shoulderlength
	name = "Shoulder-length Hair"
	icon_state = "hair_b"

/datum/sprite_accessory/hair/sidecut
	name = "Sidecut"
	icon_state = "hair_sidecut"

/datum/sprite_accessory/hair/skinhead
	name = "Skinhead"
	icon_state = "hair_skinhead"

/datum/sprite_accessory/hair/protagonist
	name = "Slightly Long Hair"
	icon_state = "hair_protagonist"

/datum/sprite_accessory/hair/spiky
	name = "Spiky"
	icon_state = "hair_spikey"

/datum/sprite_accessory/hair/spiky2
	name = "Spiky 2"
	icon_state = "hair_spiky"

/datum/sprite_accessory/hair/spiky3
	name = "Spiky 3"
	icon_state = "hair_spiky2"

/datum/sprite_accessory/hair/swept
	name = "Swept Back Hair"
	icon_state = "hair_swept"

/datum/sprite_accessory/hair/swept2
	name = "Swept Back Hair 2"
	icon_state = "hair_swept2"

/datum/sprite_accessory/hair/thinning
	name = "Thinning"
	icon_state = "hair_thinning"

/datum/sprite_accessory/hair/thinningfront
	name = "Thinning (Front)"
	icon_state = "hair_thinningfront"

/datum/sprite_accessory/hair/thinningrear
	name = "Thinning (Rear)"
	icon_state = "hair_thinningrear"

/datum/sprite_accessory/hair/topknot
	name = "Topknot"
	icon_state = "hair_topknot"

/datum/sprite_accessory/hair/tressshoulder
	name = "Tress Shoulder"
	icon_state = "hair_tressshoulder"

/datum/sprite_accessory/hair/trimmed
	name = "Trimmed"
	icon_state = "hair_trimmed"

/datum/sprite_accessory/hair/trimflat
	name = "Trim Flat"
	icon_state = "hair_trimflat"

/datum/sprite_accessory/hair/twintails
	name = "Twintails"
	icon_state = "hair_twintail"

/datum/sprite_accessory/hair/undercut
	name = "Undercut"
	icon_state = "hair_undercut"

/datum/sprite_accessory/hair/undercutleft
	name = "Undercut Left"
	icon_state = "hair_undercutleft"

/datum/sprite_accessory/hair/undercutright
	name = "Undercut Right"
	icon_state = "hair_undercutright"

/datum/sprite_accessory/hair/unkept
	name = "Unkept"
	icon_state = "hair_unkept"

/datum/sprite_accessory/hair/updo
	name = "Updo"
	icon_state = "hair_updo"

/datum/sprite_accessory/hair/longer
	name = "Very Long Hair"
	icon_state = "hair_vlong"

/datum/sprite_accessory/hair/longest
	name = "Very Long Hair 2"
	icon_state = "hair_longest"

/datum/sprite_accessory/hair/longest2
	name = "Very Long Over Eye"
	icon_state = "hair_longest2"

/datum/sprite_accessory/hair/veryshortovereye
	name = "Very Short Over Eye"
	icon_state = "hair_veryshortovereyealternate"

/datum/sprite_accessory/hair/longestalt
	name = "Very Long with Fringe"
	icon_state = "hair_vlongfringe"

/datum/sprite_accessory/hair/volaju
	name = "Volaju"
	icon_state = "hair_volaju"

/datum/sprite_accessory/hair/wisp
	name = "Wisp"
	icon_state = "hair_wisp"

/////////////////////////////
// Facial Hair Definitions //
/////////////////////////////

/datum/sprite_accessory/facial_hair
	icon = 'icons/mob/human_face.dmi'
	gender = MALE // barf (unless you're a dorf, dorfs dig chix w/ beards :P)

// please make sure they're sorted alphabetically and categorized

/datum/sprite_accessory/facial_hair/abe
	name = "Beard (Abraham Lincoln)"
	icon_state = "facial_abe"

/datum/sprite_accessory/facial_hair/brokenman
	name = "Beard (Broken Man)"
	icon_state = "facial_brokenman"

/datum/sprite_accessory/facial_hair/chinstrap
	name = "Beard (Chinstrap)"
	icon_state = "facial_chin"

/datum/sprite_accessory/facial_hair/dwarf
	name = "Beard (Dwarf)"
	icon_state = "facial_dwarf"

/datum/sprite_accessory/facial_hair/fullbeard
	name = "Beard (Full)"
	icon_state = "facial_fullbeard"

/datum/sprite_accessory/facial_hair/croppedfullbeard
	name = "Beard (Cropped Fullbeard)"
	icon_state = "facial_croppedfullbeard"

/datum/sprite_accessory/facial_hair/gt
	name = "Beard (Goatee)"
	icon_state = "facial_gt"

/datum/sprite_accessory/facial_hair/hip
	name = "Beard (Hipster)"
	icon_state = "facial_hip"

/datum/sprite_accessory/facial_hair/jensen
	name = "Beard (Jensen)"
	icon_state = "facial_jensen"

/datum/sprite_accessory/facial_hair/neckbeard
	name = "Beard (Neckbeard)"
	icon_state = "facial_neckbeard"

/datum/sprite_accessory/facial_hair/vlongbeard
	name = "Beard (Very Long)"
	icon_state = "facial_wise"

/datum/sprite_accessory/facial_hair/muttonmus
	name = "Beard (Muttonmus)"
	icon_state = "facial_muttonmus"

/datum/sprite_accessory/facial_hair/martialartist
	name = "Beard (Martial Artist)"
	icon_state = "facial_martialartist"

/datum/sprite_accessory/facial_hair/chinlessbeard
	name = "Beard (Chinless Beard)"
	icon_state = "facial_chinlessbeard"

/datum/sprite_accessory/facial_hair/moonshiner
	name = "Beard (Moonshiner)"
	icon_state = "facial_moonshiner"

/datum/sprite_accessory/facial_hair/longbeard
	name = "Beard (Long)"
	icon_state = "facial_longbeard"

/datum/sprite_accessory/facial_hair/volaju
	name = "Beard (Volaju)"
	icon_state = "facial_volaju"

/datum/sprite_accessory/facial_hair/threeoclock
	name = "Beard (Three o Clock Shadow)"
	icon_state = "facial_3oclock"

/datum/sprite_accessory/facial_hair/fiveoclock
	name = "Beard (Five o Clock Shadow)"
	icon_state = "facial_fiveoclock"

/datum/sprite_accessory/facial_hair/fiveoclockm
	name = "Beard (Five o Clock Moustache)"
	icon_state = "facial_5oclockmoustache"

/datum/sprite_accessory/facial_hair/sevenoclock
	name = "Beard (Seven o Clock Shadow)"
	icon_state = "facial_7oclock"

/datum/sprite_accessory/facial_hair/sevenoclockm
	name = "Beard (Seven o Clock Moustache)"
	icon_state = "facial_7oclockmoustache"

/datum/sprite_accessory/facial_hair/moustache
	name = "Moustache"
	icon_state = "facial_moustache"

/datum/sprite_accessory/facial_hair/pencilstache
	name = "Moustache (Pencilstache)"
	icon_state = "facial_pencilstache"

/datum/sprite_accessory/facial_hair/smallstache
	name = "Moustache (Smallstache)"
	icon_state = "facial_smallstache"

/datum/sprite_accessory/facial_hair/walrus
	name = "Moustache (Walrus)"
	icon_state = "facial_walrus"

/datum/sprite_accessory/facial_hair/fu
	name = "Moustache (Fu Manchu)"
	icon_state = "facial_fumanchu"

/datum/sprite_accessory/facial_hair/hogan
	name = "Moustache (Hulk Hogan)"
	icon_state = "facial_hogan" //-Neek

/datum/sprite_accessory/facial_hair/selleck
	name = "Moustache (Selleck)"
	icon_state = "facial_selleck"

/datum/sprite_accessory/facial_hair/chaplin
	name = "Moustache (Square)"
	icon_state = "facial_chaplin"

/datum/sprite_accessory/facial_hair/vandyke
	name = "Moustache (Van Dyke)"
	icon_state = "facial_vandyke"

/datum/sprite_accessory/facial_hair/watson
	name = "Moustache (Watson)"
	icon_state = "facial_watson"

/datum/sprite_accessory/facial_hair/elvis
	name = "Sideburns (Elvis)"
	icon_state = "facial_elvis"

/datum/sprite_accessory/facial_hair/mutton
	name = "Sideburns (Mutton Chops)"
	icon_state = "facial_mutton"

/datum/sprite_accessory/facial_hair/sideburn
	name = "Sideburns"
	icon_state = "facial_sideburn"

/datum/sprite_accessory/facial_hair/shaved
	name = "Shaved"
	icon_state = null
	gender = NEUTER

///////////////////////////
// Underwear Definitions //
///////////////////////////

/datum/sprite_accessory/underwear
	icon = 'icons/mob/underwear.dmi'
	use_static = FALSE


//MALE UNDERWEAR
/datum/sprite_accessory/underwear/nude
	name = "Nude"
	icon_state = null
	gender = NEUTER

/datum/sprite_accessory/underwear/male_briefs
	name = "Men's Briefs"
	icon_state = "male_briefs"
	gender = MALE

/datum/sprite_accessory/underwear/male_boxers
	name = "Men's Boxer"
	icon_state = "male_boxers"
	gender = MALE

/datum/sprite_accessory/underwear/male_stripe
	name = "Men's Striped Boxer"
	icon_state = "male_stripe"
	gender = MALE

/datum/sprite_accessory/underwear/male_midway
	name = "Men's Midway Boxer"
	icon_state = "male_midway"
	gender = MALE

/datum/sprite_accessory/underwear/male_longjohns
	name = "Men's Long Johns"
	icon_state = "male_longjohns"
	gender = MALE

/datum/sprite_accessory/underwear/male_kinky
	name = "Men's Kinky"
	icon_state = "male_kinky"
	gender = MALE

/datum/sprite_accessory/underwear/male_mankini
	name = "Mankini"
	icon_state = "male_mankini"
	gender = MALE

/datum/sprite_accessory/underwear/male_hearts
	name = "Men's Hearts Boxer"
	icon_state = "male_hearts"
	gender = MALE
	use_static = TRUE

/datum/sprite_accessory/underwear/male_commie
	name = "Men's Striped Commie Boxer"
	icon_state = "male_commie"
	gender = MALE
	use_static = TRUE

/datum/sprite_accessory/underwear/male_usastripe
	name = "Men's Striped Freedom Boxer"
	icon_state = "male_assblastusa"
	gender = MALE
	use_static = TRUE

/datum/sprite_accessory/underwear/male_uk
	name = "Men's Striped UK Boxer"
	icon_state = "male_uk"
	gender = MALE
	use_static = TRUE


//FEMALE UNDERWEAR
/datum/sprite_accessory/underwear/female_bikini
	name = "Ladies' Bikini"
	icon_state = "female_bikini"
	gender = FEMALE

/datum/sprite_accessory/underwear/female_lace
	name = "Ladies' Lace"
	icon_state = "female_lace"
	gender = FEMALE

/datum/sprite_accessory/underwear/female_bralette
	name = "Ladies' Bralette"
	icon_state = "female_bralette"
	gender = FEMALE

/datum/sprite_accessory/underwear/female_sport
	name = "Ladies' Sport"
	icon_state = "female_sport"
	gender = FEMALE

/datum/sprite_accessory/underwear/female_thong
	name = "Ladies' Thong"
	icon_state = "female_thong"
	gender = FEMALE

/datum/sprite_accessory/underwear/female_strapless
	name = "Ladies' Strapless"
	icon_state = "female_strapless"
	gender = FEMALE

/datum/sprite_accessory/underwear/female_babydoll
	name = "Babydoll"
	icon_state = "female_babydoll"
	gender = FEMALE

/datum/sprite_accessory/underwear/swimsuit_onepiece
	name = "Ladies' One Piece Swimsuit"
	icon_state = "swim_onepiece"
	gender = FEMALE

/datum/sprite_accessory/underwear/swimsuit_strapless_onepiece
	name = "Ladies' Strapless One Piece Swimsuit"
	icon_state = "swim_strapless_onepiece"
	gender = FEMALE

/datum/sprite_accessory/underwear/swimsuit_twopiece
	name = "Ladies' Two Piece Swimsuit"
	icon_state = "swim_twopiece"
	gender = FEMALE

/datum/sprite_accessory/underwear/swimsuit_strapless_twopiece
	name = "Ladies' Strapless Two Piece Swimsuit"
	icon_state = "swim_strapless_twopiece"
	gender = FEMALE

/datum/sprite_accessory/underwear/swimsuit_stripe
	name = "Ladies' Stripe Swimsuit"
	icon_state = "swim_stripe"
	gender = FEMALE

/datum/sprite_accessory/underwear/swimsuit_halter
	name = "Ladies' Halter Swimsuit"
	icon_state = "swim_halter"
	gender = FEMALE

/datum/sprite_accessory/underwear/female_white_neko
	name = "Ladies' White Neko"
	icon_state = "female_neko_white"
	gender = FEMALE
	use_static = TRUE

/datum/sprite_accessory/underwear/female_black_neko
	name = "Ladies' Black Neko"
	icon_state = "female_neko_black"
	gender = FEMALE
	use_static = TRUE

/datum/sprite_accessory/underwear/female_commie
	name = "Ladies' Commie"
	icon_state = "female_commie"
	gender = FEMALE
	use_static = TRUE

/datum/sprite_accessory/underwear/female_usastripe
	name = "Ladies' Freedom"
	icon_state = "female_assblastusa"
	gender = FEMALE
	use_static = TRUE

/datum/sprite_accessory/underwear/female_uk
	name = "Ladies' UK"
	icon_state = "female_uk"
	gender = FEMALE
	use_static = TRUE

/datum/sprite_accessory/underwear/female_kinky
	name = "Ladies' Kinky"
	icon_state = "female_kinky"
	gender = FEMALE
	use_static = TRUE

////////////////////////////
// Undershirt Definitions //
////////////////////////////

/datum/sprite_accessory/undershirt
	icon = 'icons/mob/underwear.dmi'

/datum/sprite_accessory/undershirt/nude
	name = "Nude"
	icon_state = null
	gender = NEUTER

// please make sure they're sorted alphabetically and categorized

/datum/sprite_accessory/undershirt/bluejersey
	name = "Jersey (Blue)"
	icon_state = "shirt_bluejersey"
	gender = NEUTER

/datum/sprite_accessory/undershirt/redjersey
	name = "Jersey (Red)"
	icon_state = "shirt_redjersey"
	gender = NEUTER

/datum/sprite_accessory/undershirt/bluepolo
	name = "Polo Shirt (Blue)"
	icon_state = "bluepolo"
	gender = NEUTER

/datum/sprite_accessory/undershirt/grayyellowpolo
	name = "Polo Shirt (Gray-Yellow)"
	icon_state = "grayyellowpolo"
	gender = NEUTER

/datum/sprite_accessory/undershirt/redpolo
	name = "Polo Shirt (Red)"
	icon_state = "redpolo"
	gender = NEUTER

/datum/sprite_accessory/undershirt/whitepolo
	name = "Polo Shirt (White)"
	icon_state = "whitepolo"
	gender = NEUTER

/datum/sprite_accessory/undershirt/alienshirt
	name = "Shirt (Alien)"
	icon_state = "shirt_alien"
	gender = NEUTER

/datum/sprite_accessory/undershirt/mondmondjaja
	name = "Shirt (Band)"
	icon_state = "band"
	gender = NEUTER

/datum/sprite_accessory/undershirt/shirt_black
	name = "Shirt (Black)"
	icon_state = "shirt_black"
	gender = NEUTER

/datum/sprite_accessory/undershirt/blueshirt
	name = "Shirt (Blue)"
	icon_state = "shirt_blue"
	gender = NEUTER

/datum/sprite_accessory/undershirt/clownshirt
	name = "Shirt (Clown)"
	icon_state = "shirt_clown"
	gender = NEUTER

/datum/sprite_accessory/undershirt/commie
	name = "Shirt (Commie)"
	icon_state = "shirt_commie"
	gender = NEUTER

/datum/sprite_accessory/undershirt/greenshirt
	name = "Shirt (Green)"
	icon_state = "shirt_green"
	gender = NEUTER

/datum/sprite_accessory/undershirt/shirt_grey
	name = "Shirt (Grey)"
	icon_state = "shirt_grey"
	gender = NEUTER

/datum/sprite_accessory/undershirt/ian
	name = "Shirt (Ian)"
	icon_state = "ian"
	gender = NEUTER

/datum/sprite_accessory/undershirt/ilovent
	name = "Shirt (I Love NT)"
	icon_state = "ilovent"
	gender = NEUTER

/datum/sprite_accessory/undershirt/lover
	name = "Shirt (Lover)"
	icon_state = "lover"
	gender = NEUTER

/datum/sprite_accessory/undershirt/matroska
	name = "Shirt (Matroska)"
	icon_state = "matroska"
	gender = NEUTER

/datum/sprite_accessory/undershirt/meat
	name = "Shirt (Meat)"
	icon_state = "shirt_meat"
	gender = NEUTER

/datum/sprite_accessory/undershirt/nano
	name = "Shirt (Nanotrasen)"
	icon_state = "shirt_nano"
	gender = NEUTER

/datum/sprite_accessory/undershirt/peace
	name = "Shirt (Peace)"
	icon_state = "peace"
	gender = NEUTER

/datum/sprite_accessory/undershirt/pacman
	name = "Shirt (Pogoman)"
	icon_state = "pogoman"
	gender = NEUTER

/datum/sprite_accessory/undershirt/question
	name = "Shirt (Question)"
	icon_state = "shirt_question"
	gender = NEUTER

/datum/sprite_accessory/undershirt/redshirt
	name = "Shirt (Red)"
	icon_state = "shirt_red"
	gender = NEUTER

/datum/sprite_accessory/undershirt/skull
	name = "Shirt (Skull)"
	icon_state = "shirt_skull"
	gender = NEUTER

/datum/sprite_accessory/undershirt/ss13
	name = "Shirt (SS13)"
	icon_state = "shirt_ss13"
	gender = NEUTER

/datum/sprite_accessory/undershirt/stripe
	name = "Shirt (Striped)"
	icon_state = "shirt_stripes"
	gender = NEUTER

/datum/sprite_accessory/undershirt/tiedye
	name = "Shirt (Tie-dye)"
	icon_state = "shirt_tiedye"
	gender = NEUTER

/datum/sprite_accessory/undershirt/uk
	name = "Shirt (UK)"
	icon_state = "uk"
	gender = NEUTER

/datum/sprite_accessory/undershirt/usa
	name = "Shirt (USA)"
	icon_state = "shirt_assblastusa"
	gender = NEUTER

/datum/sprite_accessory/undershirt/shirt_white
	name = "Shirt (White)"
	icon_state = "shirt_white"
	gender = NEUTER

/datum/sprite_accessory/undershirt/blackshortsleeve
	name = "Short-sleeved Shirt (Black)"
	icon_state = "blackshortsleeve"
	gender = NEUTER

/datum/sprite_accessory/undershirt/blueshortsleeve
	name = "Short-sleeved Shirt (Blue)"
	icon_state = "blueshortsleeve"
	gender = NEUTER

/datum/sprite_accessory/undershirt/greenshortsleeve
	name = "Short-sleeved Shirt (Green)"
	icon_state = "greenshortsleeve"
	gender = NEUTER

/datum/sprite_accessory/undershirt/purpleshortsleeve
	name = "Short-sleeved Shirt (Purple)"
	icon_state = "purpleshortsleeve"
	gender = NEUTER

/datum/sprite_accessory/undershirt/whiteshortsleeve
	name = "Short-sleeved Shirt (White)"
	icon_state = "whiteshortsleeve"
	gender = NEUTER

/datum/sprite_accessory/undershirt/sports_bra
	name = "Sports Bra"
	icon_state = "sports_bra"
	gender = NEUTER

/datum/sprite_accessory/undershirt/sports_bra2
	name = "Sports Bra (Alt)"
	icon_state = "sports_bra_alt"
	gender = NEUTER

/datum/sprite_accessory/undershirt/blueshirtsport
	name = "Sports Shirt (Blue)"
	icon_state = "blueshirtsport"
	gender = NEUTER

/datum/sprite_accessory/undershirt/greenshirtsport
	name = "Sports Shirt (Green)"
	icon_state = "greenshirtsport"
	gender = NEUTER

/datum/sprite_accessory/undershirt/redshirtsport
	name = "Sports Shirt (Red)"
	icon_state = "redshirtsport"
	gender = NEUTER

/datum/sprite_accessory/undershirt/tank_black
	name = "Tank Top (Black)"
	icon_state = "tank_black"
	gender = NEUTER

/datum/sprite_accessory/undershirt/tankfire
	name = "Tank Top (Fire)"
	icon_state = "tank_fire"
	gender = NEUTER

/datum/sprite_accessory/undershirt/tank_grey
	name = "Tank Top (Grey)"
	icon_state = "tank_grey"
	gender = NEUTER

/datum/sprite_accessory/undershirt/female_midriff
	name = "Tank Top (Midriff)"
	icon_state = "tank_midriff"
	gender = FEMALE

/datum/sprite_accessory/undershirt/tank_red
	name = "Tank Top (Red)"
	icon_state = "tank_red"
	gender = NEUTER

/datum/sprite_accessory/undershirt/tankstripe
	name = "Tank Top (Striped)"
	icon_state = "tank_stripes"
	gender = NEUTER

/datum/sprite_accessory/undershirt/tank_white
	name = "Tank Top (White)"
	icon_state = "tank_white"
	gender = NEUTER

/datum/sprite_accessory/undershirt/redtop
	name = "Top (Red)"
	icon_state = "redtop"
	gender = FEMALE

/datum/sprite_accessory/undershirt/whitetop
	name = "Top (White)"
	icon_state = "whitetop"
	gender = FEMALE

/datum/sprite_accessory/undershirt/tshirt_blue
	name = "T-Shirt (Blue)"
	icon_state = "blueshirt"
	gender = NEUTER

/datum/sprite_accessory/undershirt/tshirt_green
	name = "T-Shirt (Green)"
	icon_state = "greenshirt"
	gender = NEUTER

/datum/sprite_accessory/undershirt/tshirt_red
	name = "T-Shirt (Red)"
	icon_state = "redshirt"
	gender = NEUTER

/datum/sprite_accessory/undershirt/yellowshirt
	name = "T-Shirt (Yellow)"
	icon_state = "yellowshirt"
	gender = NEUTER

///////////////////////
// Socks Definitions //
///////////////////////

/datum/sprite_accessory/socks
	icon = 'icons/mob/underwear.dmi'

/datum/sprite_accessory/socks/nude
	name = "Nude"
	icon_state = null

// please make sure they're sorted alphabetically and categorized

/datum/sprite_accessory/socks/black_knee
	name = "Knee-high (Black)"
	icon_state = "black_knee"

/datum/sprite_accessory/socks/commie_knee
	name = "Knee-High (Commie)"
	icon_state = "commie_knee"

/datum/sprite_accessory/socks/usa_knee
	name = "Knee-High (Freedom)"
	icon_state = "assblastusa_knee"

/datum/sprite_accessory/socks/rainbow_knee
	name = "Knee-high (Rainbow)"
	icon_state = "rainbow_knee"

/datum/sprite_accessory/socks/striped_knee
	name = "Knee-high (Striped)"
	icon_state = "striped_knee"

/datum/sprite_accessory/socks/thin_knee
	name = "Knee-high (Thin)"
	icon_state = "thin_knee"

/datum/sprite_accessory/socks/uk_knee
	name = "Knee-High (UK)"
	icon_state = "uk_knee"

/datum/sprite_accessory/socks/white_knee
	name = "Knee-high (White)"
	icon_state = "white_knee"

/datum/sprite_accessory/socks/bee_knee
	name = "Knee-high (Bee)"
	icon_state = "bee_knee"

/datum/sprite_accessory/socks/black_norm
	name = "Normal (Black)"
	icon_state = "black_norm"

/datum/sprite_accessory/socks/white_norm
	name = "Normal (White)"
	icon_state = "white_norm"

/datum/sprite_accessory/socks/pantyhose
	name = "Pantyhose"
	icon_state = "pantyhose"

/datum/sprite_accessory/socks/black_short
	name = "Short (Black)"
	icon_state = "black_short"

/datum/sprite_accessory/socks/white_short
	name = "Short (White)"
	icon_state = "white_short"

/datum/sprite_accessory/socks/black_thigh
	name = "Thigh-high (Black)"
	icon_state = "black_thigh"

/datum/sprite_accessory/socks/commie_thigh
	name = "Thigh-high (Commie)"
	icon_state = "commie_thigh"

/datum/sprite_accessory/socks/usa_thigh
	name = "Thigh-high (Freedom)"
	icon_state = "assblastusa_thigh"

/datum/sprite_accessory/socks/rainbow_thigh
	name = "Thigh-high (Rainbow)"
	icon_state = "rainbow_thigh"

/datum/sprite_accessory/socks/striped_thigh
	name = "Thigh-high (Striped)"
	icon_state = "striped_thigh"

/datum/sprite_accessory/socks/thin_thigh
	name = "Thigh-high (Thin)"
	icon_state = "thin_thigh"

/datum/sprite_accessory/socks/uk_thigh
	name = "Thigh-high (UK)"
	icon_state = "uk_thigh"

/datum/sprite_accessory/socks/white_thigh
	name = "Thigh-high (White)"
	icon_state = "white_thigh"

/datum/sprite_accessory/socks/bee_thigh
	name = "Thigh-high (Bee)"
	icon_state = "bee_thigh"

//////////.//////////////////
// MutantParts Definitions //
/////////////////////////////

/datum/sprite_accessory/body_markings
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/body_markings/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/body_markings/dtiger
	name = "Dark Tiger Body"
	icon_state = "dtiger"
	gender_specific = 1

/datum/sprite_accessory/body_markings/ltiger
	name = "Light Tiger Body"
	icon_state = "ltiger"
	gender_specific = 1

/datum/sprite_accessory/body_markings/lbelly
	name = "Light Belly"
	icon_state = "lbelly"
	gender_specific = 1

/datum/sprite_accessory/tails
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails_animated
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails/lizard/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails_animated/lizard/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails/lizard/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails_animated/lizard/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails/lizard/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails_animated/lizard/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails/lizard/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails_animated/lizard/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails/human/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails_animated/human/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails/human/cat
	name = "Cat"
	icon_state = "cat"
	color_src = HAIR

/datum/sprite_accessory/tails_animated/human/cat
	name = "Cat"
	icon_state = "cat"
	color_src = HAIR

/datum/sprite_accessory/tails/human/clock
	name = "Clockwork"
	icon_state = "clockwork"
	locked = TRUE
	color_src = null

/datum/sprite_accessory/tails_animated/human/clock
	name = "Clockwork"
	icon_state = "clockwork"
	locked = TRUE
	color_src = null

/datum/sprite_accessory/snouts
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/snouts/sharp
	name = "Sharp"
	icon_state = "sharp"

/datum/sprite_accessory/snouts/round
	name = "Round"
	icon_state = "round"

/datum/sprite_accessory/snouts/sharplight
	name = "Sharp + Light"
	icon_state = "sharplight"

/datum/sprite_accessory/snouts/roundlight
	name = "Round + Light"
	icon_state = "roundlight"

/datum/sprite_accessory/horns
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/horns/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/horns/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/horns/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/horns/curled
	name = "Curled"
	icon_state = "curled"

/datum/sprite_accessory/horns/ram
	name = "Ram"
	icon_state = "ram"

/datum/sprite_accessory/horns/angler
	name = "Angeler"
	icon_state = "angler"

/datum/sprite_accessory/ears
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/ears/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/ears/cat
	name = "Cat"
	icon_state = "cat"
	hasinner = 1
	color_src = HAIR

/datum/sprite_accessory/wings/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/wings_open
	icon = 'icons/mob/wings.dmi'

/datum/sprite_accessory/wings
	icon = 'icons/mob/wings.dmi'

/datum/sprite_accessory/wings/angel
	name = "Angel"
	icon_state = "angel"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34
	locked = TRUE

/datum/sprite_accessory/wings_open/angel
	name = "Angel"
	icon_state = "angel"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34

/datum/sprite_accessory/wings/dragon
	name = "Dragon"
	icon_state = "dragon"
	dimension_x = 96
	center = TRUE
	dimension_y = 32
	locked = TRUE

/datum/sprite_accessory/wings_open/dragon
	name = "Dragon"
	icon_state = "dragon"
	dimension_x = 96
	center = TRUE
	dimension_y = 32

/datum/sprite_accessory/wings/apid
	name = "Bee"
	icon_state = "apid"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34

/datum/sprite_accessory/wings_open/apid
	name = "Bee"
	icon_state = "apid"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34

/datum/sprite_accessory/wings/robot
	name = "Robot"
	icon_state = "robo"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34

/datum/sprite_accessory/wings_open/robot
	name = "Robot"
	icon_state = "robo"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34

/datum/sprite_accessory/frills
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/frills/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/frills/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/frills/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/frills/aquatic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/spines
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/spines_animated
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/spines/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/spines_animated/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/spines/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/spines_animated/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/spines/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/spines_animated/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/spines/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/spines_animated/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/spines/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/spines_animated/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/spines/aqautic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/spines_animated/aqautic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/legs 	//legs are a special case, they aren't actually sprite_accessories but are updated with them.
	icon = null					//These datums exist for selecting legs on preference, and little else

/datum/sprite_accessory/legs/none
	name = "Normal Legs"

/datum/sprite_accessory/legs/digitigrade_lizard
	name = "Digitigrade Legs"

/datum/sprite_accessory/caps
	icon = 'icons/mob/mutant_bodyparts.dmi'
	color_src = HAIR

/datum/sprite_accessory/caps/round
	name = "Round"
	icon_state = "round"

/datum/sprite_accessory/moth_wings
	icon = 'icons/mob/moth_wings.dmi'
	color_src = null

/datum/sprite_accessory/moth_wings/plain
	name = "Plain"
	icon_state = "plain"

/datum/sprite_accessory/moth_wings/monarch
	name = "Monarch"
	icon_state = "monarch"

/datum/sprite_accessory/moth_wings/luna
	name = "Luna"
	icon_state = "luna"

/datum/sprite_accessory/moth_wings/atlas
	name = "Atlas"
	icon_state = "atlas"

/datum/sprite_accessory/moth_wings/reddish
	name = "Reddish"
	icon_state = "redish"

/datum/sprite_accessory/moth_wings/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/moth_wings/gothic
	name = "Gothic"
	icon_state = "gothic"

/datum/sprite_accessory/moth_wings/lovers
	name = "Lovers"
	icon_state = "lovers"

/datum/sprite_accessory/moth_wings/whitefly
	name = "White Fly"
	icon_state = "whitefly"

/datum/sprite_accessory/moth_wings/clockwork
	name = "Clockwork"
	icon_state = "clockwork"
	locked = TRUE

/datum/sprite_accessory/moth_wings/punished
	name = "Burnt Off"
	icon_state = "punished"
	locked = TRUE

/datum/sprite_accessory/moth_wings/firewatch
	name = "Firewatch"
	icon_state = "firewatch"

/datum/sprite_accessory/moth_wings/deathhead
	name = "Deathshead"
	icon_state = "deathhead"

/datum/sprite_accessory/moth_wings/poison
	name = "Poison"
	icon_state = "poison"

/datum/sprite_accessory/moth_wings/ragged
	name = "Ragged"
	icon_state = "ragged"

/datum/sprite_accessory/moth_wings/moonfly
	name = "Moon Fly"
	icon_state = "moonfly"

/datum/sprite_accessory/moth_wings/snow
	name = "Snow"
	icon_state = "snow"

/datum/sprite_accessory/moth_wings/angel
	name = "Angel"
	icon_state = "angel"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34
	locked = TRUE

// IPC accessories.

/datum/sprite_accessory/ipc_screens
	icon = 'icons/mob/ipc_accessories.dmi'
	color_src = EYECOLOR

/datum/sprite_accessory/ipc_screens/blue
	name = "Blue"
	icon_state = "blue"
	color_src = 0

/datum/sprite_accessory/ipc_screens/bsod
	name = "BSOD"
	icon_state = "bsod"
	color_src = 0

/datum/sprite_accessory/ipc_screens/breakout
	name = "Breakout"
	icon_state = "breakout"

/datum/sprite_accessory/ipc_screens/console
	name = "Console"
	icon_state = "console"

/datum/sprite_accessory/ipc_screens/ecgwave
	name = "ECG Wave"
	icon_state = "ecgwave"

/datum/sprite_accessory/ipc_screens/eight
	name = "Eight"
	icon_state = "eight"

/datum/sprite_accessory/ipc_screens/eyes
	name = "Eyes"
	icon_state = "eyes"

/datum/sprite_accessory/ipc_screens/glider
	name = "Glider"
	icon_state = "glider"

/datum/sprite_accessory/ipc_screens/goggles
	name = "Goggles"
	icon_state = "goggles"

/datum/sprite_accessory/ipc_screens/green
	name = "Green"
	icon_state = "green"

/datum/sprite_accessory/ipc_screens/heart
	name = "Heart"
	icon_state = "heart"
	color_src = 0

/datum/sprite_accessory/ipc_screens/monoeye
	name = "Mono-eye"
	icon_state = "monoeye"

/datum/sprite_accessory/ipc_screens/nature
	name = "Nature"
	icon_state = "nature"

/datum/sprite_accessory/ipc_screens/orange
	name = "Orange"
	icon_state = "orange"

/datum/sprite_accessory/ipc_screens/pink
	name = "Pink"
	icon_state = "pink"

/datum/sprite_accessory/ipc_screens/purple
	name = "Purple"
	icon_state = "purple"

/datum/sprite_accessory/ipc_screens/rainbow
	name = "Rainbow"
	icon_state = "rainbow"
	color_src = 0

/datum/sprite_accessory/ipc_screens/red
	name = "Red"
	icon_state = "red"

/datum/sprite_accessory/ipc_screens/redtext
	name = "Red Text"
	icon_state = "redtext"
	color_src = 0

/datum/sprite_accessory/ipc_screens/rgb
	name = "RGB"
	icon_state = "rgb"

/datum/sprite_accessory/ipc_screens/scroll
	name = "Scanline"
	icon_state = "scroll"

/datum/sprite_accessory/ipc_screens/shower
	name = "Shower"
	icon_state = "shower"

/datum/sprite_accessory/ipc_screens/sinewave
	name = "Sinewave"
	icon_state = "sinewave"

/datum/sprite_accessory/ipc_screens/squarewave
	name = "Square wave"
	icon_state = "squarewave"

/datum/sprite_accessory/ipc_screens/static_screen
	name = "Static"
	icon_state = "static"

/datum/sprite_accessory/ipc_screens/yellow
	name = "Yellow"
	icon_state = "yellow"

/datum/sprite_accessory/ipc_screens/textdrop
	name = "Text drop"
	icon_state = "textdrop"

/datum/sprite_accessory/ipc_screens/stars
	name = "Stars"
	icon_state = "stars"

/datum/sprite_accessory/ipc_screens/loading
	name = "Loading"
	icon_state = "loading"

/datum/sprite_accessory/ipc_screens/windowsxp
	name = "Windows XP"
	icon_state = "windowsxp"

/datum/sprite_accessory/ipc_screens/tetris
	name = "Tetris"
	icon_state = "tetris"

/datum/sprite_accessory/ipc_screens/tv
	name = "Color Test"
	icon_state = "tv"

/datum/sprite_accessory/ipc_antennas
	icon = 'icons/mob/ipc_accessories.dmi'
	color_src = HAIR

/datum/sprite_accessory/ipc_antennas/none
	name = "None"
	icon_state = "None"

/datum/sprite_accessory/ipc_antennas/angled
	name = "Angled"
	icon_state = "antennae"

/datum/sprite_accessory/ipc_antennas/antlers
	name = "Antlers"
	icon_state = "antlers"

/datum/sprite_accessory/ipc_antennas/crowned
	name = "Crowned"
	icon_state = "crowned"

/datum/sprite_accessory/ipc_antennas/cyberhead
	name = "Cyberhead"
	icon_state = "cyberhead"

/datum/sprite_accessory/ipc_antennas/droneeyes
	name = "Drone Eyes"
	icon_state = "droneeyes"

/datum/sprite_accessory/ipc_antennas/light
	name = "Light"
	icon_state = "light"

/datum/sprite_accessory/ipc_antennas/sidelights
	name = "Sidelights"
	icon_state = "sidelights"

/datum/sprite_accessory/ipc_antennas/tesla
	name = "Tesla"
	icon_state = "tesla"

/datum/sprite_accessory/ipc_antennas/tv
	name = "TV Antenna"
	icon_state = "tvantennae"

/datum/sprite_accessory/ipc_chassis // Used for changing limb icons, doesn't need to hold the actual icon. That's handled in ipc.dm
	icon = null
	icon_state = "who cares fuck you" // In order to pull the chassis correctly, we need AN icon_state(see line 36-39). It doesn't have to be useful, because it isn't used.
	color_src = 0

/datum/sprite_accessory/insect_type
	icon = null
	icon_state = "NULL"
	color_src = 0

/datum/sprite_accessory/insect_type/fly
	name = "Common Fly"
	limbs_id = "fly"

/datum/sprite_accessory/insect_type/bee
	name = "Hoverfly"
	limbs_id = "bee"

/datum/sprite_accessory/ipc_chassis/mcgreyscale
	name = "Morpheus Cyberkinetics(Greyscale)"
	limbs_id = "mcgipc"
	color_src = MUTCOLORS

/datum/sprite_accessory/ipc_chassis/bishopcyberkinetics
	name = "Bishop Cyberkinetics"
	limbs_id = "bshipc"

/datum/sprite_accessory/ipc_chassis/bishopcyberkinetics2
	name = "Bishop Cyberkinetics 2.0"
	limbs_id = "bs2ipc"

/datum/sprite_accessory/ipc_chassis/hephaestussindustries
	name = "Hephaestus Industries"
	limbs_id = "hsiipc"

/datum/sprite_accessory/ipc_chassis/hephaestussindustries2
	name = "Hephaestus Industries 2.0"
	limbs_id = "hi2ipc"

/datum/sprite_accessory/ipc_chassis/shellguardmunitions
	name = "Shellguard Munitions Standard Series"
	limbs_id = "sgmipc"

/datum/sprite_accessory/ipc_chassis/wardtakahashimanufacturing
	name = "Ward-Takahashi Manufacturing"
	limbs_id = "wtmipc"

/datum/sprite_accessory/ipc_chassis/xionmanufacturinggroup
	name = "Xion Manufacturing Group"
	limbs_id = "xmgipc"

/datum/sprite_accessory/ipc_chassis/xionmanufacturinggroup2
	name = "Xion Manufacturing Group 2.0"
	limbs_id = "xm2ipc"

/datum/sprite_accessory/ipc_chassis/zenghupharmaceuticals
	name = "Zeng-Hu Pharmaceuticals"
	limbs_id = "zhpipc"
