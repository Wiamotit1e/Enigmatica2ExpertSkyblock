#priority -2

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
# Smelter) or EnderTweaker (EnderIO) cannot be overlaid from here:
# both integrations apply removals BEFORE additions at FMLLoadComplete,
# so removeRecipe() never sees pack-added recipes (it logs "No ...
# recipe exists" and the old recipe survives). Those changes live
# directly in the pack files (ThermalExpansion.zs, ExtendedCrafting.zs,
# NuclearCraft.zs). Optional-mod compat moved to week4_rs_compat.zs
# behind #modloaded: brackets resolve at parse time, so a runtime
# isNull(itemUtils.getItem(...)) guard cannot protect them.
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

# Fusion Catalyst - late game (blaze powder + diamonds + ghast tear)
recipes.addShaped("W4 Fusion Catalyst",
<contenttweaker:fusion_catalyst>,
[[<minecraft:blaze_powder>, <ore:gemQuartz>, <minecraft:blaze_powder>],
[<ore:gemDiamond>, <minecraft:ghast_tear>, <ore:gemDiamond>],
[<minecraft:blaze_powder>, <ore:gemQuartz>, <minecraft:blaze_powder>]]);

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

# TE Machine Frame (Thermionic Fabricator cast; substrate replaces
# the AA iron casing and one crystal)
mods.forestry.ThermionicFabricator.removeCast(<thermalexpansion:frame>);
mods.forestry.ThermionicFabricator.addCast(<thermalexpansion:frame> * 2,
[[<actuallyadditions:item_crystal:5>, <rftools:machine_frame>, <actuallyadditions:item_crystal:5>],
[<immersiveengineering:metal_decoration0:5>, <thermalexpansion:frame:64>, <contenttweaker:circuit_substrate>],
[<actuallyadditions:item_crystal:5>, <teslacorelib:machine_case>, <contenttweaker:circuit_substrate>]],
<liquid:glass> * 6000);

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

# Mekanism Advanced Circuit (substrate replaces the advanced alloy ring)
recipes.remove(<mekanism:controlcircuit:1>);
recipes.addShapedMirrored("W4 Advanced Circuit",
<mekanism:controlcircuit:1>,
[[<ore:alloyBasic>, <contenttweaker:circuit_substrate>, <ore:alloyBasic>],
[<contenttweaker:circuit_substrate>, <ore:circuitBasic>, <contenttweaker:circuit_substrate>],
[<ore:alloyBasic>, <contenttweaker:circuit_substrate>, <ore:alloyBasic>]]);

# AE2 ME Controller (substrate replaces advanced rocketry isolation wafer)
if (!isNull(itemUtils.getItem("appliedenergistics2:controller"))) {
	recipes.remove(<appliedenergistics2:controller>);
	recipes.addShaped("W4 ME Controller",
	<appliedenergistics2:controller>,
	[[<appliedenergistics2:smooth_sky_stone_block>, <contenttweaker:circuit_substrate>, <appliedenergistics2:smooth_sky_stone_block>],
	[<appliedenergistics2:fluix_block>, <appliedenergistics2:energy_acceptor>, <appliedenergistics2:fluix_block>],
	[<teslacorelib:machine_case>, <ore:pearlFluix>, <teslacorelib:machine_case>]]);
}

# ########################
# Late game
# ########################

# Draconic Core (fusion catalyst replaces the gendustry genetics processor)
recipes.remove(<draconicevolution:draconic_core>);
recipes.addShapedMirrored("W4 Draconic Core",
<draconicevolution:draconic_core>,
[[<ore:blockDraconium>, <ore:ingotMelodicAlloy>, <ore:blockDraconium>],
[<ore:crystalLitherite>, <contenttweaker:fusion_catalyst>, <ore:crystalLitherite>],
[<ore:plateElite>, <draconicevolution:dislocator>, <ore:plateElite>]]);

# EnderIO Octadic Capacitor (fusion catalyst replaces ferroboron)
recipes.remove(<enderio:item_basic_capacitor:2>);
recipes.addShapedMirrored("W4 Octadic Capacitor",
<enderio:item_basic_capacitor:2>,
[[<contenttweaker:fusion_catalyst>, <ore:ingotVibrantAlloy>, <contenttweaker:fusion_catalyst>],
[<enderio:item_basic_capacitor:1>, <draconicevolution:draconium_block:1>, <enderio:item_basic_capacitor:1>],
[<contenttweaker:fusion_catalyst>, <ore:ingotVibrantAlloy>, <contenttweaker:fusion_catalyst>]]);
