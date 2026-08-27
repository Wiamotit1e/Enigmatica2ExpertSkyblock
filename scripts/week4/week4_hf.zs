#priority -2
#modloaded appliedenergistics2 extracells nuclearcraft

import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient as IIngredient;

# ######################################################################
#
# week4_hf.zs
#
# The hydrofluoric acid line. HF already exists in the pack (NC's
# fluorite chain feeds the HF electrolysis in NuclearCraft.zs); this
# file gives the acid a second job and fluorine its first:
#
# - quartz glass bathed in HF comes out etched - acid-roughened at a
#   scale only circuits can feel. The NC fluid infuser is the one and
#   only acid vessel: one machine, and the acid is the gate, so the
#   bath runs deep (750 mB per glass);
# - etched glass replaces quartz glass in EVERY storage cell: AE2
#   item/fluid/spatial cells, ExtraCells physical and gas cells, and
#   the ThE essentia cells (week4_thaumicenergistics.zs). The storage
#   housings keep plain glass - shells are plain, cells are etched;
# - fluorinated glass: quartz glass bathed in fluorine becomes quartz
#   fiber (appliedenergistics2:part:140, previously untouched), the
#   real-world fluoride-glass fiber optic. Fluorine comes from the
#   pack's HF electrolysis, closing the triangle:
#   fluorite -> HF -> (etch | electrolyze -> F2 -> fiber).
#
# The pack's old definitions for the advanced cells are commented out
# of AppliedEnergistics.zs (the week4 convention: each recipe exists
# exactly once). The re-added shapeless routes carry a W4 prefix so
# the names never collide with the pack's.
#
# ######################################################################

# ########################
# The Etch
# ########################

mods.nuclearcraft.infuser.addRecipe(<appliedenergistics2:quartz_glass>, <liquid:hydrofluoric_acid> * 750, <contenttweaker:etched_quartz_glass>);

# ########################
# The Fiber
# ########################

recipes.remove(<appliedenergistics2:part:140>);
mods.nuclearcraft.infuser.addRecipe(<appliedenergistics2:quartz_glass>, <liquid:fluorine> * 375, <appliedenergistics2:part:140>);

# ########################
# Etched cell helpers - the pack's cell idiom with etched glass
# ########################

function etchStandard(input as IIngredient, output as IItemStack) {
    recipes.remove(output);
    recipes.addShaped("W4 Etched " ~ output.displayName, output,
        [[<contenttweaker:etched_quartz_glass>, <ore:dustRedstone>, <contenttweaker:etched_quartz_glass>],
        [<ore:dustRedstone>, input, <ore:dustRedstone>],
        [<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
    recipes.addShapeless("W4 Shapeless - " ~ output.displayName, output, [<appliedenergistics2:material:39>, input]);
}

function etchPhysical(input as IIngredient, output as IItemStack) {
    recipes.remove(output);
    recipes.addShaped("W4 Etched " ~ output.displayName, output,
        [[<contenttweaker:etched_quartz_glass>, <appliedenergistics2:material:8>, <contenttweaker:etched_quartz_glass>],
        [<appliedenergistics2:material:8>, input, <appliedenergistics2:material:8>],
        [<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);
    recipes.addShapeless("W4 Shapeless - " ~ output.displayName, output, [<extracells:storage.casing>, input]);
}

function etchGas(input as IIngredient, output as IItemStack) {
    recipes.remove(output);
    recipes.addShaped("W4 Etched " ~ output.displayName, output,
        [[<contenttweaker:etched_quartz_glass>, <appliedenergistics2:material:8>, <contenttweaker:etched_quartz_glass>],
        [<appliedenergistics2:material:8>, input, <appliedenergistics2:material:8>],
        [<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
    recipes.addShapeless("W4 Shapeless - " ~ output.displayName, output, [<extracells:storage.casing:2>, input]);
}

# ########################
# Storage cells - etched glass, every one of them
# ########################

# Item 1k-64k, fluid 1k-64k, spatial 2cubed-128cubed, view cell
val etchedCells = {
    <appliedenergistics2:material:35>: <appliedenergistics2:storage_cell_1k>,
    <appliedenergistics2:material:36>: <appliedenergistics2:storage_cell_4k>,
    <appliedenergistics2:material:37>: <appliedenergistics2:storage_cell_16k>,
    <appliedenergistics2:material:38>: <appliedenergistics2:storage_cell_64k>,
    <appliedenergistics2:material:54>: <appliedenergistics2:fluid_storage_cell_1k>,
    <appliedenergistics2:material:55>: <appliedenergistics2:fluid_storage_cell_4k>,
    <appliedenergistics2:material:56>: <appliedenergistics2:fluid_storage_cell_16k>,
    <appliedenergistics2:material:57>: <appliedenergistics2:fluid_storage_cell_64k>,
    <appliedenergistics2:material:32>: <appliedenergistics2:spatial_storage_cell_2_cubed>,
    <appliedenergistics2:material:33>: <appliedenergistics2:spatial_storage_cell_16_cubed>,
    <appliedenergistics2:material:34>: <appliedenergistics2:spatial_storage_cell_128_cubed>,
    <ore:crystalCertus>: <appliedenergistics2:view_cell>
} as IItemStack[IIngredient];

for input, output in etchedCells {
    etchStandard(input, output);
}

# ExtraCells physical cells - the whole line
for i in 0 .. 4 {
    etchPhysical(<extracells:storage.component>.definition.makeStack(i), <extracells:storage.physical>.definition.makeStack(i));
}

# ExtraCells gas cells - the whole line
for i in 0 .. 8 {
    etchGas(<extracells:storage.component>.definition.makeStack(i + 11), <extracells:storage.gas>.definition.makeStack(i));
}

# Flavor
<contenttweaker:etched_quartz_glass>.addTooltip("Acid-etched until the circuits can feel it.");
<appliedenergistics2:part:140>.addTooltip("Fluorinated glass, clearer than air.");
