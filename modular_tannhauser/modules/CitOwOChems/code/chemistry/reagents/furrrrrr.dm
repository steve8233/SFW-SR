////////////////////////////////////////////////////////////////////////////////////////////////////
//										FURRANIUM
///////////////////////////////////////////////////////////////////////////////////////////////////
//OwO whats this?
//Makes you nya and awoo
//At a certain amount of time in your system it turns you into a vulp/taj.

/datum/reagent/OwO/furranium
	name = "Furranium"
	description = "OwO whats this?"
	color = "#f9b9bc" // rgb: , 0, 255
	taste_description = "dewicious degenyewacy"
	metabolization_rate = 0.2 * REAGENTS_METABOLISM
	inverse_chem_val 		= 0
	chemical_flags = REAGENT_DONOTSPLIT | REAGENT_CAN_BE_SYNTHESIZED
	ph = 5


/datum/reagent/OwO/furranium/expose_mob(mob/living/carbon/human/M, method=INJECT, reac_volume)
	if(method == INJECT)
		var/turf/T = get_turf(M)
		M.adjustOxyLoss(15)
		//M.DefaultCombatKnockdown(50)
		M.Stun(50)
		M.emote("cough")
		var/obj/item/toy/plush/P = pick(subtypesof(/obj/item/toy/plush))
		new P(T)
		M.visible_message("<span class='warning'>[M] suddenly coughs up a [P.name]!</b></span>",\
						"<span class='warning'>You feel a lump form in your throat, as you suddenly cough up what seems to be a hairball?</b></span>")
		var/T2 = get_random_station_turf()
		P.throw_at(T2, 8, 1)
	..()

/datum/reagent/OwO/furranium/on_mob_life(mob/living/carbon/M)

	switch(current_cycle)
		if(10 to 19)
			if(prob(20))
				to_chat(M, "<span class='notice'>You feel... fluffy</span>")
		if(20 to 49)
			if(prob(10))
				to_chat(M, "You find yourself unable to supress the desire to meow!")
				M.emote("nya")
			if(prob(10))
				to_chat(M, "You find yourself unable to supress the desire to howl!")
				M.emote("awoo")
			if(prob(20))
				//var/list/seen = M.sight() - M //Sound and sight checkers
				var/list/datum/weakref/seen = list(ismob(0))
				for(var/victim in seen)
					if(isanimal(victim) || !isliving(victim))
						seen -= victim
				if(LAZYLEN(seen))
					to_chat(M, "You notice [pick(seen)]'s bulge [pick("OwO!", "uwu!")]")
		if(50)
			randomize_human(M)
			var/species = pick(list(/datum/species/vulpkanin, /datum/species/tajaran))
			M.set_species(species)
			to_chat(M, "You feel... more fluffy...")
		if(51 to INFINITY)
			if(prob(5))
				to_chat(M, "You find yourself unable to supress the desire to meow!")
				M.emote("nya")
			if(prob(5))
				to_chat(M, "You find yourself unable to supress the desire to howl!")
				M.emote("awoo")
			if(prob(5))
//				var/list/seen = M.fov_view() - M //Sound and sight checkers
				var/list/datum/weakref/seen = list(ismob(0))
				for(var/victim in seen)
					if(isanimal(victim) || !isliving(victim))
						seen -= victim
				if(LAZYLEN(seen))
					to_chat(M, "You notice [pick(seen)]'s bulge [pick("OwO!", "uwu!")]")
	..()
