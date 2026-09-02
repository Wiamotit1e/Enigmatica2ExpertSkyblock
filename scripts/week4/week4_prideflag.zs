#priority -2
#modloaded inworldcrafting

import mods.thaumcraft.Infusion;
import mods.nuclearcraft.fission;
import mods.inworldcrafting.ExplosionCrafting;
import crafttweaker.item.IIngredient;

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
# ######################################################################

# ########################
# The Pride Flag - one infusion. Idk how many pedestals
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
