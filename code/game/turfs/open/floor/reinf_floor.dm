
/turf/open/floor/engine
	name = "reinforced floor"
	desc = "Extremely sturdy."
	icon_state = "engine"
	holodeck_compatible = TRUE
	floor_tile = /obj/item/stack/rods
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE


/turf/open/floor/engine/examine(mob/user)
	. += ..()
	. += "<span class='notice'>The reinforcement rods are <b>wrenched</b> firmly in place.</span>"

/turf/open/floor/engine/airless

/turf/open/floor/engine/break_tile()
	return //unbreakable

/turf/open/floor/engine/burn_tile()
	return //unburnable

/turf/open/floor/engine/make_plating(force = FALSE)
	if(force)
		return ..()
	return //unplateable

/turf/open/floor/engine/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/engine/crowbar_act(mob/living/user, obj/item/I)
	return

/turf/open/floor/engine/wrench_act(mob/living/user, obj/item/I)
	..()
	to_chat(user, "<span class='notice'>You begin removing rods...</span>")
	if(I.use_tool(src, user, 30, volume=80))
		if(!istype(src, /turf/open/floor/engine))
			return TRUE
		if(floor_tile)
			new floor_tile(src, 2)
		ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
	return TRUE

/turf/open/floor/engine/acid_act(acidpwr, acid_volume)
	acidpwr = min(acidpwr, 50) //we reduce the power so reinf floor never get melted.
	return ..()

/turf/open/floor/engine/ex_act(severity,target)
	var/shielded = is_shielded()
	contents_explosion(severity, target)
	if(severity != 1 && shielded && target != src)
		return
	if(target == src)
		ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
		return
	switch(severity)
		if(1)
			if(prob(80))
				if(!length(baseturfs) || !ispath(baseturfs[baseturfs.len-1], /turf/open/floor))
					ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
					ReplaceWithLattice()
				else
					ScrapeAway(2, flags = CHANGETURF_INHERIT_AIR)
			else if(prob(50))
				ScrapeAway(2, flags = CHANGETURF_INHERIT_AIR)
			else
				ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
		if(2)
			if(prob(50))
				ScrapeAway(flags = CHANGETURF_INHERIT_AIR)


/turf/open/floor/engine/attack_paw(mob/user, list/modifiers)
	return attack_hand(user, modifiers)

/turf/open/floor/engine/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	user.Move_Pulled(src)

//air filled floors; used in atmos pressure chambers

/turf/open/floor/engine/n2o
	article = "an"
	name = "\improper N2O floor"

/turf/open/floor/engine/co2
	name = "\improper CO2 floor"

/turf/open/floor/engine/plasma
	name = "plasma floor"

/turf/open/floor/engine/o2
	name = "\improper O2 floor"

/turf/open/floor/engine/n2
	article = "an"
	name = "\improper N2 floor"

/turf/open/floor/engine/bz
	name = "\improper BZ floor"

/turf/open/floor/engine/freon
	name = "\improper Freon floor"

/turf/open/floor/engine/halon
	name = "\improper Halon floor"

/turf/open/floor/engine/healium
	name = "\improper Healium floor"

/turf/open/floor/engine/h2
	article = "an"
	name = "\improper H2 floor"

/turf/open/floor/engine/hypernoblium
	name = "\improper Hypernoblium floor"

/turf/open/floor/engine/miasma
	name = "\improper Miasma floor"

/turf/open/floor/engine/no2
	article = "an"
	name = "\improper NO2 floor"

/turf/open/floor/engine/pluoxium
	name = "\improper Pluoxium floor"

/turf/open/floor/engine/proto_nitrate
	name = "\improper Proto-Nitrate floor"

/turf/open/floor/engine/stimulum
	name = "\improper Stimulum floor"

/turf/open/floor/engine/tritium
	name = "\improper Tritium floor"

/turf/open/floor/engine/h2o
	article = "an"
	name = "\improper H2O floor"

/turf/open/floor/engine/zauker
	name = "\improper Zauker floor"

/turf/open/floor/engine/helium
	name = "\improper Helium floor"

/turf/open/floor/engine/antinoblium
	name = "\improper Antinoblium floor"

/turf/open/floor/engine/air
	name = "air floor"



/turf/open/floor/engine/cult
	name = "engraved floor"
	desc = "The air smells strange over this sinister flooring."
	icon_state = "plating"
	floor_tile = null
	var/obj/effect/cult_turf/overlay/floor/bloodcult/realappearance


/turf/open/floor/engine/cult/Initialize()
	. = ..()
	new /obj/effect/temp_visual/cult/turf/floor(src)
	realappearance = new /obj/effect/cult_turf/overlay/floor/bloodcult(src)
	realappearance.linked = src

/turf/open/floor/engine/cult/Destroy()
	be_removed()
	return ..()

/turf/open/floor/engine/cult/ChangeTurf(path, new_baseturf, flags)
	if(path != type)
		be_removed()
	return ..()

/turf/open/floor/engine/cult/proc/be_removed()
	QDEL_NULL(realappearance)

/turf/open/floor/engine/cult/airless

/turf/open/floor/engine/vacuum
	name = "vacuum floor"

/turf/open/floor/engine/telecomms
