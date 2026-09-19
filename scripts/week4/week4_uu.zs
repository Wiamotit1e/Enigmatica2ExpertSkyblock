#modloaded ic2 appliedenergistics2 redstonearsenal libvulpes astralsorcery thaumcraft thermalexpansion botania extendedcrafting
#priority -2

import mods.botania.RuneAltar;
import mods.thermalexpansion.Transposer;
import mods.extendedcrafting.CombinationCrafting;
import crafttweaker.item.IIngredient;

# ---=== Solid UU-Matter (ic2:misc_resource:3) ===---
# The forgotten solid UU gets a full economy. Acquisition is a two-stage
# crystallization line:
#   1. dissolve:  dilithium crystal + 1000 mB liquid UU -> uu_solution
#      (IC2 Canner, NC Dissolver, IE Mixer directly; EnderIO Vat and
#      AR Chemical Reactor via generated XML)
#   2. evaporate: uu_solution -> solid UU
#      (Rustic Evaporating Basin 50% chance, ID Drying Basin 75%,
#      ID Mechanical Drying Basin 100%)
# The melt-back below closes the loop 1:1.
# A third path skips the solution entirely: five dilithium dust coalesce straight
# into five solid UU in the Extended Crafting crafting core.
#
# Tech-magic crossovers:
# - starlight forgery:    solid UU resonates into starmetal ore
# - starlight press:      solid UU is pressed into liquid starlight
# - amber amplification:  amber + solid UU on the runic altar -> curiosity bands
#
# - quantum armor: solid UU replaces the advanced alloy in all 4 pieces
# - matter cannon: solidified universal matter as ammunition

# Stage 1: dissolve the dilithium seed in liquid UU
scripts.process.solution([<libvulpes:productgem:0>], [<liquid:ic2uu_matter> * 1000], [<liquid:uu_solution> * 1000], null, "");

# Stage 2: evaporate the solution, the crystal remains
scripts.process.evaporate(<liquid:uu_solution> * 1000, <ic2:misc_resource:3>, "");

# Re-liquefaction: solid UU melts back into 1000 mB liquid UU
scripts.process.melt(<ic2:misc_resource:3>, <liquid:ic2uu_matter> * 1000);

# Direct coalescence: five dilithium dust fuse into five solid UU in the crafting core.
# One dust in the core plus four on the pedestals - the pedestals are what actually
# enforce the 5:5 ratio, since the core slot is matched by item only.
CombinationCrafting.addRecipe(<ic2:misc_resource:3> * 5,
    2000000000, 2000000000,
    <libvulpes:productdust>,
    [<libvulpes:productdust>, <libvulpes:productdust>, <libvulpes:productdust>, <libvulpes:productdust>]);

# Starlight forgery: starlight resonates universal matter into starmetal
# ORE - normally unmakable, space-gated to the AR dimensions in this skyblock.
scripts.process.magic([<ic2:misc_resource:3>], [<astralsorcery:blockcustomore:1>], "");

# Starlight press: universal matter squeezed out as liquid starlight
Transposer.addExtractRecipe(<liquid:astralsorcery.liquidstarlight> * 200, <ic2:misc_resource:3>, 250000);

# Amber amplification: the runic altar doubles amber into curiosity bands
RuneAltar.addRecipe(<thaumcraft:curio:1> * 2,
    [<thaumcraft:amber>, <thaumcraft:amber>, <ic2:misc_resource:3>] as IIngredient[],
    8000);

# Nether Star transmutation: the runic altar turns four Wither Skeleton skulls into three Nether Stars
RuneAltar.addRecipe(<minecraft:nether_star> * 3,
    [<minecraft:skull:1>, <minecraft:skull:1>, <minecraft:skull:1>, <minecraft:skull:1>, <ic2:misc_resource:3>] as IIngredient[],
    8000);

# Matter Cannon: solidified universal matter is heavy ammunition
mods.appliedenergistics2.Cannon.registerAmmo(<ic2:misc_resource:3>, 1000.0);

# Quantum armor: advanced alloy (crafting:3) -> solid UU
recipes.remove(<ic2:quantum_boots>);
recipes.addShaped("W4 Quantum Boots", <ic2:quantum_boots>,
    [[<ic2:misc_resource:3>, null, <ic2:misc_resource:3>],
    [<ic2:crafting:4>, <redstonearsenal:armor.boots_flux>.anyDamage(), <ic2:crafting:4>],
    [<ic2:rubber_boots>, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, <ic2:rubber_boots>]]);

recipes.remove(<ic2:quantum_leggings>);
recipes.addShaped("W4 Quantum Leggings", <ic2:quantum_leggings>,
    [[<ic2:misc_resource:3>, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, <ic2:misc_resource:3>],
    [<ic2:crafting:4>, <redstonearsenal:armor.legs_flux>.anyDamage(), <ic2:crafting:4>],
    [null, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, null]]);

recipes.remove(<ic2:quantum_chestplate>);
recipes.addShaped("W4 Quantum Chestplate", <ic2:quantum_chestplate>,
    [[<ic2:misc_resource:3>, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, <ic2:misc_resource:3>],
    [<ic2:crafting:4>, <redstonearsenal:armor.plate_flux>.anyDamage(), <ic2:crafting:4>],
    [<ic2:misc_resource:3>, <ic2:jetpack_electric>.anyDamage(), <ic2:misc_resource:3>]]);

recipes.remove(<ic2:quantum_helmet>);
recipes.addShaped("W4 Quantum Helmet", <ic2:quantum_helmet>,
    [[<ic2:misc_resource:3>, null, <ic2:misc_resource:3>],
    [<ic2:crafting:4>, <redstonearsenal:armor.helmet_flux>.anyDamage(), <ic2:crafting:4>],
    [null, <ic2:lapotron_crystal>|<ic2:lapotron_crystal:*>, null]]);
