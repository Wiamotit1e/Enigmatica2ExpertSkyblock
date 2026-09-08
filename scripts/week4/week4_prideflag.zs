#priority -2
#modloaded inworldcrafting bloodmagic

import mods.thaumcraft.Infusion;
import mods.nuclearcraft.fission;
import mods.nuclearcraft.fuel_reprocessor;
import mods.inworldcrafting.ExplosionCrafting;
import crafttweaker.item.IIngredient;
import mods.botania.RuneAltar;
import mods.bloodmagic.BloodAltar;

# ######################################################################
#
# week4_prideflag.zs
#
# The Pride Flag - one infusion that eats one item from every major
# line in the pack. Twenty-five pedestals around the Rune of Pride:
# light and colour, industry and will, humanity and beasts, plus a
# piece of everything that flies, stores, teleports or destroys.
#
# The TC6 matrix scans for pedestals at x/z ±8 (TileInfusionMatrix.
# getSurroundings) and matches them with Forge's RecipeMatcher - no
# item-count cap - so all 25 fit in a single ritual. The pack's
# previous record was the 9-item speculative processor infusion.
#
# The flag then catalyses Pride Fuel (not consumed): UU-matter pressed
# into rainbow. Burn it in the NC fission reactor - the depleted fuel
# that comes out still dreams in colour: detonate it to tear open a
# grab bag of machine frames, draconic cores and the pack's gate
# materials. Every prize rolls its own chance, server-side RNG.
#
# The Aro Pride Flag is the mid-game sister: the Empowerer presses a
# white empowered crystal between four mob skulls. The flag then
# steadies two LEU-235 fuel blocks and two IC2 MOX cells into a single
# Aro Pride Fuel - three times the power, two times the heat, half the
# burn time of its parts. Burned out, the Fuel Reprocessor cracks the
# spent rod back into two depleted LEU-235 and two depleted MOX: the
# fuel comes home, spent but whole.
#
# The Pan Pride Flag bakes on a Botania rune altar from four HarvestCraft
# pancakes (pan, get it?): eight flags per bake. Each flag then ferments
# bonemeal into a heap of Enriched Bonemeal - a known sidestep of the
# week4_recipes gate, kept because that recipe is cheap anyway.
#
# The Gay Men Pride Flag is the punchline: the blood altar both makes
# and eats slates. This recipe waits there for the ethereal tier - 2 LP
# at tier 0, drawn at 16 LP/t, no drain - and springs the moment the
# slate finishes crafting. Take the slate out instantly, or the altar
# converts the whole stack before you can blink.
#
# ######################################################################

# ########################
# The Pride Flag - one infusion, twenty-five pedestals
# ########################

Infusion.registerRecipe("w4_pride_flag", "",
    <contenttweaker:pride_flag>, 25,
    [<aspect:spiritus> * 30, <aspect:sensus> * 30, <aspect:lux> * 20, <aspect:vitreus> * 20,
    <aspect:desiderium> * 30, <aspect:ordo> * 20, <aspect:permutatio> * 20, <aspect:potentia> * 20,
    <aspect:humanus> * 30, <aspect:bestia> * 30, <aspect:aversio> * 40, <aspect:cognitio> * 20],
    <botania:rune:15>,
    [<botania:specialflower>.withTag({type: "spectrolus"}), <botania:thornchakram:1>, <botania:rainbowrod>,
    <thaumcraft:sanity_soap>, <astralsorcery:itemcraftingcomponent:4>, <mekanism:teleportationcore>,
    <advancedrocketry:warpcore>, <mekanism:polyethene:2>, <actuallyadditions:block_phantomface>, <mekanism:balloon:*>,
    <industrialforegoing:black_hole_unit>, <ic2:misc_resource:3>, <enderio:item_basic_capacitor:2>,
    <draconicevolution:fusion_crafting_core>, <rftools:shape_card:3>, <bloodmagic:dagger_of_sacrifice>,
    <extendedcrafting:material:13>, <thermalexpansion:frame:148>, <mysticalagradditions:insanium>,
    <biomesoplenty:terrestrial_artifact>, <cyclicmagic:block_user>, <ore:ingotStellarAlloy>,
    <nuclearcraft:tritium_lamp>, <environmentaltech:void_ore_miner_cont_6>, <extracells:storage.component:3>] as IIngredient[]);

# ########################
# Pride Fuel - the flag catalyses Gems into rainbow (not consumed)
# ########################

recipes.addShaped("W4 Pride Fuel",
    <contenttweaker:pride_fuel>,
    [[null, <contenttweaker:anglesite>, null],
    [<contenttweaker:anglesite>, <contenttweaker:pride_flag>.reuse(), <contenttweaker:anglesite>],
    [null, <contenttweaker:anglesite>, null]]
);

recipes.addShaped("W4 Pride Fuel",
    <contenttweaker:pride_fuel>,
    [[null, <contenttweaker:benitoite>, null],
    [<contenttweaker:benitoite>, <contenttweaker:pride_flag>.reuse(), <contenttweaker:benitoite>],
    [null, <contenttweaker:benitoite>, null]]
);

# ########################
# Fission - pride fuel burns down into the depleted form
# ########################

mods.nuclearcraft.fission.addRecipe(
    [<contenttweaker:pride_fuel>, <contenttweaker:depleted_pride_fuel>, 9891000.0, 256000.0, 5120.0, "Pride Fuel"]);

# ########################
# Depleted Pride Fuel explosion pool
# ########################

# Machine frames, 40% each
ExplosionCrafting.explodeItemRecipe(<thermalexpansion:frame> * 64, <contenttweaker:depleted_pride_fuel>, 40);
ExplosionCrafting.explodeItemRecipe(<rftools:machine_frame> * 64, <contenttweaker:depleted_pride_fuel>, 40);
ExplosionCrafting.explodeItemRecipe(<teslacorelib:machine_case> * 64, <contenttweaker:depleted_pride_fuel>, 40);
ExplosionCrafting.explodeItemRecipe(<immersiveengineering:metal_decoration0:5> * 64, <contenttweaker:depleted_pride_fuel>, 40);

# The draconic core, 40%
ExplosionCrafting.explodeItemRecipe(<draconicevolution:draconic_core> * 32, <contenttweaker:depleted_pride_fuel>, 40);

# Gate materials, 40% each
ExplosionCrafting.explodeItemRecipe(<extendedcrafting:material:13>, <contenttweaker:depleted_pride_fuel>, 40);
ExplosionCrafting.explodeItemRecipe(<mekanism:controlcircuit:3> * 64, <contenttweaker:depleted_pride_fuel>, 40);
ExplosionCrafting.explodeItemRecipe(<enderio:item_basic_capacitor:2> * 64, <contenttweaker:depleted_pride_fuel>, 40);
ExplosionCrafting.explodeItemRecipe(<ic2:resource:13> * 64, <contenttweaker:depleted_pride_fuel>, 40);

# The flag's own ingredient comes home, 80%
ExplosionCrafting.explodeItemRecipe(<extrautils2:decorativesolid:8> * 2, <contenttweaker:depleted_pride_fuel>, 80);
ExplosionCrafting.explodeItemRecipe(<contenttweaker:anglesite> * 4, <contenttweaker:depleted_pride_fuel>, 80);
ExplosionCrafting.explodeItemRecipe(<contenttweaker:benitoite> * 4, <contenttweaker:depleted_pride_fuel>, 80);

# Destabilized Redstone Ore, 100%
ExplosionCrafting.explodeItemRecipe(<thermalfoundation:ore_fluid:2> * 64, <contenttweaker:depleted_pride_fuel>, 100);

# Energized Netherrack, 100%
ExplosionCrafting.explodeItemRecipe(<thermalfoundation:ore_fluid:3> * 64, <contenttweaker:depleted_pride_fuel>, 100);

# Resonant End Stone, 100%
ExplosionCrafting.explodeItemRecipe(<thermalfoundation:ore_fluid:4> * 64, <contenttweaker:depleted_pride_fuel>, 100);

# Ritual flavor
<contenttweaker:pride_flag>.addTooltip("傲慢之罪");
<contenttweaker:pride_fuel>.addTooltip("It burns in every colour.");
<contenttweaker:depleted_pride_fuel>.addTooltip("The pride has burned out. Detonate the remains.");

# ########################
# Aro Pride Flag - mid game. The Empowerer presses a white empowered
# crystal block between four mob skulls: skeleton, wither skeleton,
# zombie, creeper (skull metas 0/1/2/4). 250k RF per stand, 600 ticks,
# green particles. All five slots are consumed.
# ########################

mods.actuallyadditions.Empowerer.addRecipe(
    <contenttweaker:aro_pride_flag>,
    <actuallyadditions:block_crystal_empowered:5>,
    <minecraft:skull:0>,
    <minecraft:skull:1>,
    <minecraft:skull:2>,
    <minecraft:skull:4>,
    250000,
    600,
    [0.1, 1.0, 0.1]
);

# ########################
# Aro Pride Fuel - the flag steadies two LEU-235 fuel blocks and two
# IC2 MOX cells into one rod. Same empowerer energy/time as the flag.
# ########################

mods.actuallyadditions.Empowerer.addRecipe(
    <contenttweaker:aro_pride_fuel>,
    <contenttweaker:aro_pride_flag>,
    <nuclearcraft:fuel_uranium:4>,
    <nuclearcraft:fuel_uranium:4>,
    <ic2:nuclear:4>,
    <ic2:nuclear:4>,
    250000,
    600,
    [0.1, 1.0, 0.1]
);

# ########################
# Fission - aro pride fuel burns down into the depleted form. Stat
# blend of LEU-235 (72000t / 120 RF/t / 50 H/t) and the MOX cells
# (98400t / 239 RF/t / 88 H/t): time LEU/2 + MOX/2 = 85200, power
# LEU*3 + MOX*3 = 1077, heat LEU*2 + MOX*2 = 276. Doubles only - NC
# silently falls back to 1/0/0 on ints.
# ########################

mods.nuclearcraft.fission.addRecipe(
    [<contenttweaker:aro_pride_fuel>, <contenttweaker:depleted_aro_pride_fuel>, 85200.0, 1077.0, 276.0, "Aro Pride Fuel"]);

# ########################
# Fuel Reprocessor - the spent rod cracks back into its parts: two
# depleted LEU-235, two depleted MOX (the IC2-mox derived rod), the
# white iron crystal block it was pressed around, and four wither
# skulls. The reprocessor has only four output slots, so same-type
# returns stack into single slots - totals are unchanged per run.
# ########################

mods.nuclearcraft.fuel_reprocessor.addRecipe(
    [<contenttweaker:depleted_aro_pride_fuel>,
    <nuclearcraft:depleted_fuel_uranium:4> * 2,
    <nuclearcraft:depleted_fuel_ic2:1> * 2,
    <actuallyadditions:block_crystal:5>,
    <minecraft:skull:1> * 4]);

# ########################
# Pan Pride Flag - the pancake joke pays out. Four HarvestCraft pancakes
# bake into eight pan flags on a rune altar (50k mana). The flag then
# ferments 2 bonemeal + sugar + rotten flesh into 64 Enriched Bonemeal.
# Knowingly skips the week4_recipes gate - that recipe is cheap enough
# that this only saves the fiddling. The pan flag is consumed.
# ########################

RuneAltar.addRecipe(<contenttweaker:pan_pride_flag> * 8,
    [<harvestcraft:baconpancakesitem>,
    <harvestcraft:maplesyruppancakesitem>,
    <harvestcraft:blueberrypancakesitem>,
    <harvestcraft:pancakesitem>] as IIngredient[],
    50000);

recipes.addShapeless("W4 Enriched Bonemeal With Pan",
    <skyresources:baseitemcomponent:4> * 64,
    [<minecraft:dye:15>, <minecraft:dye:15>, <minecraft:sugar>, <contenttweaker:pan_pride_flag>, <minecraft:rotten_flesh>]);

<contenttweaker:pan_pride_flag>.addTooltip("Literally attracted to pan.");

# ########################
# Gay Men Pride Flag - the altar trap. Slates are made inside the blood
# altar, and this recipe waits there for the ethereal tier: 2 LP, tier
# 0, drawn at 16 LP/t, nothing drained. It springs the moment the slate
# finishes crafting, so take yours out instantly - or the altar turns
# the whole stack into flags before you can blink.
# ########################

BloodAltar.addRecipe(<contenttweaker:gay_men_pride_flag>, <bloodmagic:slate:4>, 0, 2, 16, 0);

<contenttweaker:gay_men_pride_flag>.addTooltip("Don't worry. It's of no use.");