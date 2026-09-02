#priority -2

import mods.industrialforegoing.ProteinReactor;
import mods.industrialforegoing.FluidDictionary;
import mods.forestry.Carpenter;
import mods.thaumcraft.Infusion;
import mods.extendedcrafting.TableCrafting;
import crafttweaker.item.IIngredient;

# ######################################################################
#
# week4_recipes.zs
#
# Week 4 surprise recipes. Loads AFTER every pack script (lowest
# priority in the whole pack: per-mod files have default priority 0,
# craft/helper/helper_jei.zs has -1). Removes the "muscle-memory"
# recipes a veteran player knows by heart and replaces them with new
# variants built around the custom intermediates registered in
# week4_custom_items.zs.
#
# No rh() calls here: no item is fully removed, only re-reciped.
#
# NOTE: machine recipes the pack adds through ModTweaker (TE Induction
# Smelter, Thermionic Fabricator) or EnderTweaker (EnderIO) cannot be
# overlaid from here: both integrations apply removals BEFORE additions
# at FMLLoadComplete, so removeRecipe() never sees pack-added recipes
# (it logs "No ... recipe exists" and the old recipe survives). Those
# changes live directly in the pack files (ThermalExpansion.zs,
# ExtendedCrafting.zs, NuclearCraft.zs). Every crafting recipe replaced
# here has had its old definition commented out of the pack file, so
# each recipe exists exactly once. Optional-mod compat moved to
# week4_rs_compat.zs behind #modloaded: brackets resolve at parse time,
# so a runtime isNull(itemUtils.getItem(...)) guard cannot protect them.
#
# ######################################################################

# ########################
# Custom item recipes
# ########################

# Crude Mechanism x2 - early game (cobble + gears from Gear.zs)
recipes.addShaped("W4 Crude Mechanism",
<contenttweaker:coarse_mechanism> * 2,
[[<ore:cobblestone>, <ore:gearStone>, <ore:cobblestone>],
[<ore:gearStone>, <ore:gearWood>, <ore:gearStone>],
[<ore:cobblestone>, <ore:gearStone>, <ore:cobblestone>]]);

# Machine Circuit Substrate - mid game (reinforced stone + redstone + aluminum plate)
recipes.addShaped("W4 Circuit Substrate",
<contenttweaker:circuit_substrate>,
[[<ic2:resource:11>, <ore:dustRedstone>, <ic2:resource:11>],
[<ore:dustRedstone>, <ore:plateAluminum>, <ore:dustRedstone>],
[<ic2:resource:11>, <ore:dustRedstone>, <ic2:resource:11>]]);

# Thermal Prism - mid-late game (quartz + glowstone + redstone)
recipes.addShaped("W4 Thermal Prism",
<contenttweaker:thermal_prism>,
[[<ore:gemQuartz>, <minecraft:glowstone_dust>, <ore:gemQuartz>],
[<minecraft:glowstone_dust>, <ore:dustRedstone>, <minecraft:glowstone_dust>],
[<ore:gemQuartz>, <minecraft:glowstone_dust>, <ore:gemQuartz>]]);

# Fusion Catalyst - late game: a contained star. Draconic shell, starmetal
# conduit, litherite lattice, void-seed anchors, gaia spark, nether-star core
recipes.addShaped("W4 Fusion Catalyst",
<contenttweaker:fusion_catalyst>,
[[<draconicevolution:infused_obsidian>, <astralsorcery:itemcraftingcomponent:4>, <draconicevolution:infused_obsidian>],
[<environmentaltech:litherite>, <minecraft:nether_star>, <environmentaltech:litherite>],
[<thaumcraft:void_seed>, <botania:manaresource:5>, <thaumcraft:void_seed>]]);

# ########################
# Early game remakes
# ########################

# Bucket (was: 3 iron plates)
recipes.remove(<minecraft:bucket>);
recipes.addShaped("W4 Bucket",
<minecraft:bucket>,
[[<ore:plateIron>, <contenttweaker:coarse_mechanism>, <ore:plateIron>],
[null, <ore:plateIron>, null]]);

# Cauldron (was: 5 plates, iron & aluminum variants)
recipes.remove(<minecraft:cauldron>);
recipes.addShapedMirrored("W4 Iron Cauldron",
<minecraft:cauldron>,
[[<ore:plateIron>, <contenttweaker:coarse_mechanism>, <ore:plateIron>],
[<ore:plateIron>, null, <ore:plateIron>],
[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]]);

recipes.addShapedMirrored("W4 Aluminum Cauldron",
<minecraft:cauldron>,
[[<ore:plateAluminum>, <contenttweaker:coarse_mechanism>, <ore:plateAluminum>],
[<ore:plateAluminum>, null, <ore:plateAluminum>],
[<ore:plateAluminum>, <ore:plateAluminum>, <ore:plateAluminum>]]);

# Furnace (was: compressed cobble + stone gear + coal center)
recipes.remove(<minecraft:furnace>);
recipes.addShapedMirrored("W4 Furnace",
<minecraft:furnace>,
[[<ore:compressed1xCobblestone>, <ore:cobblestone>, <ore:compressed1xCobblestone>],
[<ore:gearStone>, <contenttweaker:coarse_mechanism>, <ore:gearStone>],
[<ore:compressed1xCobblestone>, <minecraft:coal:*>, <ore:compressed1xCobblestone>]]);

# Hopper (was: 5 plates + chest, iron & aluminum variants)
recipes.remove(<minecraft:hopper>);
recipes.addShaped("W4 Hopper Aluminum",
<minecraft:hopper>,
[[<ore:plateAluminum>, <contenttweaker:coarse_mechanism>, <ore:plateAluminum>],
[<ore:plateAluminum>, <ore:chest>, <ore:plateAluminum>],
[null, <ore:plateAluminum>, null]]);

recipes.addShaped("W4 Hopper Iron",
<minecraft:hopper>,
[[<ore:plateIron>, <contenttweaker:coarse_mechanism>, <ore:plateIron>],
[<ore:plateIron>, <ore:chest>, <ore:plateIron>],
[null, <ore:plateIron>, null]]);

# Sticks (was: 2 planks -> 2 sticks, now 3 planks -> 2 sticks; logs unchanged)
recipes.remove(<minecraft:stick>);
recipes.addShapedMirrored("W4 Sticks",
<minecraft:stick> * 2,
[[<ore:plankWood>],
[<ore:plankWood>],
[<ore:plankWood>]]);

recipes.addShapedMirrored("W4 Sticks from logs",
<minecraft:stick> * 4,
[[<ore:logWood>],
[<ore:logWood>]]);

# ########################
# Mid game - frames, circuits, controllers
# ########################

# Time in a Bottle (mana diamonds + plates; slightly harder than the
# RandomThings default of gold + diamonds + lapis + clock + bottle)
recipes.removeShaped(<randomthings:timeinabottle>,
[[<ore:ingotGold>, <ore:ingotGold>, <ore:ingotGold>],
[<minecraft:diamond>, <minecraft:clock>, <minecraft:diamond>],
[<minecraft:dye:4>, <minecraft:glass_bottle>, <minecraft:dye:4>]]);
recipes.addShaped("W4 Time in a Bottle",
<randomthings:timeinabottle>,
[[<ore:plateLapis>, <ore:plateGold>, <ore:plateLapis>],
[<ore:gemDiamond>, <minecraft:clock>, <ore:gemDiamond>],
[<botania:manaresource:1>, <minecraft:glass_bottle>, <botania:manaresource:1>]]);

# Mekanism Steel Casing (substrate replaces the osmium block columns)
recipes.remove(<mekanism:basicblock:8>);
recipes.addShaped("W4 Steel Casing",
<mekanism:basicblock:8> * 2,
[[<ore:ingotOsmium>, <contenttweaker:circuit_substrate>, <ore:ingotOsmium>],
[<immersiveengineering:material:9>, <immersiveengineering:stone_decoration:2>, <immersiveengineering:material:9>],
[<ore:ingotOsmium>, <contenttweaker:circuit_substrate>, <ore:ingotOsmium>]]);

# IC2 Basic Machine Casing (3 variants, substrate in center)
recipes.remove(<ic2:resource:12>);
recipes.addShapedMirrored("W4 Basic Machine Casing1",
<ic2:resource:12> * 4,
[[<ore:plateAluminum>, <tconstruct:large_plate>.withTag({Material: "iron"}), <ore:plateAluminum>],
[<tconstruct:large_plate>.withTag({Material: "iron"}), <contenttweaker:circuit_substrate>, <tconstruct:large_plate>.withTag({Material: "iron"})],
[<ore:plateAluminum>, <tconstruct:large_plate>.withTag({Material: "iron"}), <ore:plateAluminum>]]);

recipes.addShapedMirrored("W4 Basic Machine Casing2",
<ic2:resource:12> * 4,
[[<ore:plateAluminum>, <ore:plateDenseIron>, <ore:plateAluminum>],
[<ore:plateDenseIron>, <contenttweaker:circuit_substrate>, <ore:plateDenseIron>],
[<ore:plateAluminum>, <ore:plateDenseIron>, <ore:plateAluminum>]]);

recipes.addShapedMirrored("W4 Basic Machine Casing3",
<ic2:resource:12> * 4,
[[<ore:plateAluminum>, <ore:plateDenseTin>, <ore:plateAluminum>],
[<ore:plateDenseTin>, <contenttweaker:circuit_substrate>, <ore:plateDenseTin>],
[<ore:plateAluminum>, <ore:plateDenseTin>, <ore:plateAluminum>]]);

# RFTools Machine Frame (substrate replaces dry rubber)
recipes.remove(<rftools:machine_frame>);
recipes.addShaped("W4 RFTools Machine Frame",
<rftools:machine_frame> * 2,
[[<ic2:heat_vent>, <ore:gearGold>, <ic2:heat_vent>],
[<contenttweaker:circuit_substrate>, <teslacorelib:machine_case>, <contenttweaker:circuit_substrate>],
[<industrialforegoing:pink_slime>, <industrialforegoing:range_addon:*>, <industrialforegoing:pink_slime>]]);

# EnderIO Basic Capacitor (substrate fills the two empty corners)
recipes.remove(<enderio:item_basic_capacitor>);
recipes.addShapedMirrored("W4 Basic Capacitor",
<enderio:item_basic_capacitor> * 2,
[[<contenttweaker:circuit_substrate>, <thermalfoundation:material:514>, <ore:dustBedrock>],
[<thermalfoundation:material:514>, <immersiveengineering:metal_device0:2>, <thermalfoundation:material:514>],
[<ore:dustBedrock>, <thermalfoundation:material:514>, <contenttweaker:circuit_substrate>]]);

# IF Fluiddictionary Converter (machine case + substrate replace iron ore)
recipes.remove(<industrialforegoing:fluiddictionary_converter>);
recipes.addShaped("W4 Fluiddictionary Converter",
<industrialforegoing:fluiddictionary_converter>,
[[<ore:itemRubber>, <teslacorelib:machine_case>, <ore:itemRubber>],
[<ore:blockGlass>, <contenttweaker:circuit_substrate>, <ore:blockGlass>],
[<minecraft:bucket>, <ore:gearIron>, <minecraft:bucket>]]);

# AE2 ME Controller (wafer restored, bottom-center upgraded to an elite
# circuit - a notch harder than the pack's own recipe)
if (!isNull(itemUtils.getItem("appliedenergistics2:controller"))) {
	recipes.remove(<appliedenergistics2:controller>);
	recipes.addShaped("W4 ME Controller",
	<appliedenergistics2:controller>,
	[[<appliedenergistics2:smooth_sky_stone_block>, <advancedrocketry:ic:3>, <appliedenergistics2:smooth_sky_stone_block>],
	[<appliedenergistics2:fluix_block>, <appliedenergistics2:energy_acceptor>, <appliedenergistics2:fluix_block>],
	[<teslacorelib:machine_case>, <ore:circuitElite>, <teslacorelib:machine_case>]]);
}

# Time in a Bottle (30 min charge) - AE stage: processors infuse the
# bottle with 30 minutes of stored time (timeData.storedTime in ticks)
recipes.addShaped("W4 Time in a Bottle 30m",
<randomthings:timeinabottle>.withTag({timeData: {storedTime: 36000}}),
[[<appliedenergistics2:material:26>, <appliedenergistics2:material:2>, <appliedenergistics2:material:27>],
[<appliedenergistics2:material:10>, <randomthings:timeinabottle>, <appliedenergistics2:material:10>],
[<appliedenergistics2:material:25>, <appliedenergistics2:material:2>, <appliedenergistics2:material:25>]]);

# Time in a Bottle (60 min) - dense energy cells overcharge a bottle
# holding at least 30 minutes. The bottle is matched by threshold, not
# exact NBT: storedTime keeps accruing while the item sits in the
# inventory, so an exact-tag match would never recognize a real bottle.
recipes.addShaped("W4 Time in a Bottle 60m",
<randomthings:timeinabottle>.withTag({timeData: {storedTime: 72000}}),
[[<appliedenergistics2:material:2>, <appliedenergistics2:dense_energy_cell>, <appliedenergistics2:material:2>],
[<ore:pearlFluix>, <randomthings:timeinabottle>.marked("b"), <ore:pearlFluix>],
[<appliedenergistics2:material:2>, <appliedenergistics2:dense_energy_cell>, <appliedenergistics2:material:2>]],
function(out, ins, cInfo) {
	if (D(ins.b.tag).getInt("timeData.storedTime", 0) >= 36000) {
		return out;
	}
	return null;
}, null);

# Time in a Bottle (24 h) - the fusion catalyst collapses a day into glass,
# from a bottle holding at least an hour
recipes.addShaped("W4 Time in a Bottle 24h",
<randomthings:timeinabottle>.withTag({timeData: {storedTime: 1728000}}),
[[<contenttweaker:thermal_prism>, <contenttweaker:fusion_catalyst>, <contenttweaker:thermal_prism>],
[null, <randomthings:timeinabottle>.marked("b"), null],
[null, null, null]],
function(out, ins, cInfo) {
	if (D(ins.b.tag).getInt("timeData.storedTime", 0) >= 72000) {
		return out;
	}
	return null;
}, null);

# ########################
# Late game
# ########################

# Draconic Core - moved to a 5x5: the melodic alloy returns, and the
# resonant upgrade kit joins the circle alongside the fusion catalyst
# and two entropy cores. Order anchored in disorder, tech and magic
# holding hands.
recipes.remove(<draconicevolution:draconic_core>);
mods.extendedcrafting.TableCrafting.addShaped(0,
<draconicevolution:draconic_core>,
[[<ore:blockDraconium>, null, <ore:ingotMelodicAlloy>, null, <ore:blockDraconium>],
[null, <ore:crystalLitherite>, <thermalfoundation:upgrade:3>, <ore:crystalLitherite>, null],
[<ore:plateElite>, <contenttweaker:entropy_core>, <contenttweaker:fusion_catalyst>, <contenttweaker:entropy_core>, <ore:plateElite>],
[null, <ore:crystalLitherite>, <draconicevolution:dislocator>, <ore:crystalLitherite>, null],
[null, null, <ore:blockDraconium>, null, null]]);

# EnderIO Octadic Capacitor (fusion catalyst replaces ferroboron)
recipes.remove(<enderio:item_basic_capacitor:2>);
recipes.addShapedMirrored("W4 Octadic Capacitor",
<enderio:item_basic_capacitor:2>,
[[<contenttweaker:fusion_catalyst>, <ore:ingotVibrantAlloy>, <contenttweaker:fusion_catalyst>],
[<enderio:item_basic_capacitor:1>, <draconicevolution:draconium_block:1>, <enderio:item_basic_capacitor:1>],
[<contenttweaker:fusion_catalyst>, <ore:ingotVibrantAlloy>, <contenttweaker:fusion_catalyst>]]);

# ########################
# Blood Magic - industrial life essence
# ########################

# Life essence without the knives: mob farm leftovers and animal waste,
# refined through a three-stage biotech chain.
#
# Stage 1 - crude essence: the pack already feeds every listAllmeatraw
# item to the Protein Reactor. protein and sewage become the custom
# fluid crude_life_essence in a Fluid Dictionary Converter.
FluidDictionary.add("protein", "crude_life_essence", 0.1);
FluidDictionary.add("sewage", "crude_life_essence", 0.025);

# Enriched Bonemeal - the Sky Resources default recipe is gone; this is
# the only one (bonemeal, sugar and rotten flesh fermented together)
recipes.remove(<skyresources:baseitemcomponent:4>);
recipes.addShaped("W4 Enriched Bonemeal",
<skyresources:baseitemcomponent:4> * 2,
[[<minecraft:dye:15>, <minecraft:sugar>, <minecraft:dye:15>],
[<minecraft:sugar>, <minecraft:rotten_flesh>, <minecraft:sugar>],
[<minecraft:dye:15>, <minecraft:sugar>, <minecraft:dye:15>]]);

# Stage 2 - refinement: the NC Dissolver dissolves Enriched Bonemeal
# into the crude essence and refines it (item + fluid -> fluid).
# The bonemeal is the catalyst the line was always missing.
mods.nuclearcraft.dissolver.addRecipe(<skyresources:baseitemcomponent:4>, <liquid:crude_life_essence> * 1000, <liquid:refined_life_essence> * 1000);

# Stage 3 - the Fluid Dictionary Converter turns one bucket of refined
# essence into one bucket of life essence. Deliberately string-based:
# the BM fluid is resolved at runtime inside the converter tile, which
# cannot hit the parse-time "Ghost liquid" trap that killed the Vat.
FluidDictionary.add("refined_life_essence", "lifeessence", 1.0);

# ########################
# Magic x Tech crossover
# ########################

# Mekanism Elite Circuit - starmetal enters the circuit line
recipes.remove(<mekanism:controlcircuit:2>);
recipes.addShaped("W4 Elite Circuit",
<mekanism:controlcircuit:2>,
[[<ore:alloyElite>, <astralsorcery:itemcraftingcomponent:4>, <ore:alloyElite>],
[<ore:alloyElite>, <ore:circuitAdvanced>, <ore:alloyElite>],
[<ore:alloyElite>, <astralsorcery:itemcraftingcomponent:4>, <ore:alloyElite>]]);

# Mekanism Ultimate Circuit - the Carpenter bathes the elite circuit in
# crude life essence: the life essence line feeds the top circuit tier
recipes.remove(<mekanism:controlcircuit:3>);
Carpenter.addRecipe(<mekanism:controlcircuit:3>,
[[<ore:alloyUltimate>, <astralsorcery:itemcraftingcomponent:4>, <ore:alloyUltimate>],
[<astralsorcery:itemcraftingcomponent:4>, <mekanism:controlcircuit:2>, <astralsorcery:itemcraftingcomponent:4>],
[<ore:alloyUltimate>, <astralsorcery:itemcraftingcomponent:4>, <ore:alloyUltimate>]],
40, <liquid:crude_life_essence> * 500);

# Mekanism Teleportation Core - thaumic infusion replaces the default
# recipe: teleportation tech now requires the arcane
recipes.remove(<mekanism:teleportationcore>);
Infusion.registerRecipe("w4_teleportation_core", "INFUSION",
<mekanism:teleportationcore>, 12,
[<aspect:permutatio> * 30, <aspect:auram> * 20, <aspect:praecantatio> * 20],
<minecraft:ender_pearl>,
[<ore:quicksilver>, <ore:quicksilver>, <ore:quicksilver>, <ore:quicksilver>,
<ore:crystalFluix>, <ore:crystalFluix>, <ore:crystalFluix>, <ore:crystalFluix>] as IIngredient[]);

# Mekanism Fusion Reactor - a demon will crystal steadies the core
recipes.remove(<mekanismgenerators:reactor>);
recipes.addShaped("W4 Fusion Reactor",
<mekanismgenerators:reactor>,
[[<ore:circuitUltimate>, <bloodmagic:item_demon_crystal:2>, <ore:circuitUltimate>],
[<mekanismgenerators:reactor:1>, <nuclearcraft:fusion_core>, <mekanismgenerators:reactor:1>],
[<mekanismgenerators:reactor:1>, <mekanismgenerators:reactor:1>, <mekanismgenerators:reactor:1>]]);

# NC Fusion Core - moved to week4/week4_corium.zs: the core must be
# quenched in a corium bath at the Carpenter, so every fusion line in
# the pack passes through one deliberate meltdown.

# ########################
# Tech line reshuffle
# ########################

# IC2 Lapotron Crystal - one MOX fuel rod per crystal: the quantum tier
# now passes through the fission reactor's reprocessing line
recipes.remove(<ic2:lapotron_crystal>);
recipes.addShaped("W4 Lapotron Crystal",
<ic2:lapotron_crystal>,
[[<ore:circuitAdvanced>, <ore:gemLapis>, <ore:circuitAdvanced>],
[<ore:gemLapis>, <ic2:nuclear:4>, <ore:gemLapis>],
[<ore:circuitAdvanced>, <ore:gemLapis>, <ore:circuitAdvanced>]]);

# TE Reinforced Cell Frame - the thermal prism replaces the electrum core
recipes.remove(<thermalexpansion:frame:130>);
recipes.addShapedMirrored("W4 Reinforced Cell Frame",
<thermalexpansion:frame:130>,
[[<ore:gearSilver>, <thermalfoundation:material:515>, <ore:gearSilver>],
[<ore:plateElectrumFlux>, <contenttweaker:thermal_prism>, <ore:plateElectrumFlux>],
[<ore:gemCrystalFlux>, <thermalexpansion:frame:129>, <ore:gemCrystalFlux>]]);

# TE Signalum Cell Frame - substrates cradle the cell
recipes.remove(<thermalexpansion:frame:131>);
recipes.addShapedMirrored("W4 Signalum Cell Frame",
<thermalexpansion:frame:131>,
[[<ore:plateSignalum>, <ore:crystalCinnabar>, <ore:plateSignalum>],
[<contenttweaker:circuit_substrate>, <thermalexpansion:frame:146>, <contenttweaker:circuit_substrate>],
[<ore:plateSignalum>, <ore:crystalSlagRich>, <ore:plateSignalum>]]);

# AE2 Quantum Link Chamber - a gaia spirit anchors the quantum link
recipes.remove(<appliedenergistics2:quantum_link>);
recipes.addShapedMirrored("W4 Quantum Link Chamber",
<appliedenergistics2:quantum_link>,
[[<appliedenergistics2:quartz_vibrant_glass>, <rftools:infused_enderpearl>, <appliedenergistics2:quartz_vibrant_glass>],
[<ore:pearlFluix>, <botania:manaresource:5>, <ore:pearlFluix>],
[<appliedenergistics2:quartz_vibrant_glass>, <ore:manaPearl>, <appliedenergistics2:quartz_vibrant_glass>]]);

# The titanium rework moved to week4/week4_titanium.zs: the full Kroll
# line (crush -> chlorination -> reduction -> smelt) lives there, plus
# the nugget-to-rutile-ore crafting swap.

# ########################
# Machine casing & frame lines
# ########################

# Tesla Core Lib Machine Case - the pack's rubber grid (IndustrialForegoing.zs)
# with the rubber swapped for reinforced stone and HDPE sheets
recipes.addShaped("W4 Tesla Core Lib Machine Case",
	<teslacorelib:machine_case>, 
	[[<ic2:resource:11>, <mekanism:polyethene:2>, <ic2:resource:11>],
	[<mekanism:polyethene:2>, <ic2:resource:13>, <mekanism:polyethene:2>], 
	[<ic2:resource:11>, <mekanism:polyethene:2>, <ic2:resource:11>]]
);

# NC Basic Plating (x6) - the pack's lead-shell grid with the graphite
# core swapped for a beryllium block: the reactor-grade route
recipes.addShapedMirrored("W4 Basic Plating - 1",
	<nuclearcraft:part> * 6, 
	[[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>],
	[<ic2:casing:4>, <ore:blockBeryllium>, <ic2:casing:4>], 
	[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>]]);

# NC Basic Plating (x2) - same grid, quartzburnt core: the cheap route
recipes.addShapedMirrored("W4 Basic Plating - 2",
	<nuclearcraft:part> * 2, 
	[[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>],
	[<ic2:casing:4>, <extrautils2:decorativesolid:7>, <ic2:casing:4>], 
	[<ore:blockSheetmetalLead>, <ic2:casing:4>, <ore:blockSheetmetalLead>]]
);

# NC Elite Plating (x2) - crystal binder and Boron-10 wrap a DU plating core
recipes.addShapedMirrored("W4 Elite Plating",
	<nuclearcraft:part:3> * 2, 
	[[<nuclearcraft:compound:1>, <nuclearcraft:boron>, <nuclearcraft:compound:1>],
	[<nuclearcraft:boron>, <nuclearcraft:part:2>, <nuclearcraft:boron>], 
	[<nuclearcraft:compound:1>, <nuclearcraft:boron>, <nuclearcraft:compound:1>]]
);

# Forestry Sturdy Casing (x4) - a brass body braced by bronze and constantan gears
recipes.addShapedMirrored("W4 Sturdy Casing",
	<forestry:sturdy_machine> * 4, 
	[[<ore:gearBronze>, <ore:ingotBrass>, <ore:gearBronze>],
	[<ore:ingotBrass>, null, <ore:ingotBrass>], 
	[<ore:gearConstantan>, <ore:ingotBrass>, <ore:gearConstantan>]]
);

# Carpenter: Hardened Casing (x2) - four resonating crystals set a Sturdy
# Casing in 10 buckets of water. Machine twin of the MM advanced_carpenter
# recipe.
mods.forestry.Carpenter.addRecipe(
	<forestry:hardened_machine> * 2,
	[[<threng:material:5>, null, <threng:material:5>],
	[null, <forestry:sturdy_machine>, null],
	[<threng:material:5>, null, <threng:material:5>]], 
	40,
	<liquid:water> * 10000
);

# ThermionicFabricator: TE Machine Frame (x3) - empowered Enori crystals
# key the cast: device frame, heavy engineering block, iron casing and a
# machine case into 9 buckets of glass. Machine twin of the MM
# advanced_thermionic_fabricator recipe.
mods.forestry.ThermionicFabricator.addCast(
	<thermalexpansion:frame> * 3,
	[[<actuallyadditions:item_crystal_empowered:5>, <rftools:machine_frame>, <actuallyadditions:item_crystal_empowered:5>],
	[<immersiveengineering:metal_decoration0:5>, <thermalexpansion:frame:64>, <actuallyadditions:block_misc:9>],
	[<actuallyadditions:item_crystal_empowered:5>, <teslacorelib:machine_case>, <actuallyadditions:item_crystal_empowered:5>]],
	<liquid:glass> * 9000
);

# Carpenter: Wyvern Core (x2) - three draconic cores bound by a rainbow
# stone under a shulker shell, with stellar alloy and pladium, bathed in
# mana. Machine twin of the MM advanced_carpenter recipe.
mods.forestry.Carpenter.addRecipe(
	<draconicevolution:wyvern_core> * 2,
	[[<ore:shulkerShell>, <draconicevolution:draconic_core>, <ore:shulkerShell>],
	[<draconicevolution:draconic_core>, <extrautils2:decorativesolid:8>, <draconicevolution:draconic_core>], 
	[<ore:ingotStellarAlloy>, <environmentaltech:pladium>, <ore:ingotStellarAlloy>]], 
	40,
	<liquid:mana> * 2000
);

# Extended Crafting Table: Dragon's Breath (x4) - four enderium dusts
# and four mana bottles crowd an end crystal; the crystal exhales the
# dead dragon's lingering breath. The Fourth Cycle never fights the
# dragon - it remembers it.
TableCrafting.addShaped(
	<minecraft:dragon_breath> * 4,
	[[<ore:dustEnderium>, <botania:manabottle>, <ore:dustEnderium>],
	[<botania:manabottle>, <minecraft:end_crystal>, <botania:manabottle>],
	[<ore:dustEnderium>, <botania:manabottle>, <ore:dustEnderium>]]
);