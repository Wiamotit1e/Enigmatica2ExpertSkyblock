#priority -2
#modloaded appliedenergistics2 extracells thermalexpansion

import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.item.IIngredient as IIngredient;
import mods.thermalexpansion.Transposer;

# ######################################################################
#
# week4_hf.zs
#
# The hydrofluoric acid line. HF already exists in the pack (NC's
# fluorite chain feeds the HF electrolysis in NuclearCraft.zs); this
# file gives the acid a second job and fluorine its first:
#
# - the Transposer is the pack's wet lab (corium brews live here too):
#   quartz glass bathed in HF comes out etched - acid-roughened at a
#   scale only circuits can feel;
# - etched glass replaces quartz glass in every ADVANCED storage cell:
#   AE2 item/fluid/spatial 16k+, ExtraCells physical cells, gas cells
#   16k+, and the ThE essentia cells 16k+ (week4_thaumicenergistics.zs).
#   Housings and basic cells keep plain glass - shells are plain,
#   precision products are etched;
# - fluorinated glass: quartz glass bathed in fluorine becomes quartz
#   fiber (appliedenergistics2:part:140, previously untouched), the
#   real-world fluoride-glass fiber optic. Fluorine comes from the
#   pack's HF electrolysis, closing the triangle:
#   fluorite -> HF -> (etch | electrolyze -> F2 -> fiber).
#
# ######################################################################

# ########################
# The Etch
# ########################

Transposer.addFillRecipe(<contenttweaker:etched_quartz_glass>,
<appliedenergistics2:quartz_glass>, <liquid:hydrofluoric_acid> * 250, 4000);

# ########################
# The Fiber
# ########################

recipes.remove(<appliedenergistics2:part:140>);
Transposer.addFillRecipe(<appliedenergistics2:part:140> * 4,
<appliedenergistics2:quartz_glass>, <liquid:fluorine> * 250, 4000);

# ########################
# Etched cell helpers - the pack's cell idiom with etched glass
# ########################

function etchStandard(input as IIngredient, output as IItemStack) {
    recipes.remove(output);
    recipes.addShaped("W4 Etched " ~ output.displayName, output,
        [[<contenttweaker:etched_quartz_glass>, <ore:dustRedstone>, <contenttweaker:etched_quartz_glass>],
        [<ore:dustRedstone>, input, <ore:dustRedstone>],
        [<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
    recipes.addShapeless("Shapeless - " ~ output.displayName, output, [<appliedenergistics2:material:39>, input]);
}

function etchPhysical(input as IIngredient, output as IItemStack) {
    recipes.remove(output);
    recipes.addShaped("W4 Etched " ~ output.displayName, output,
        [[<contenttweaker:etched_quartz_glass>, <appliedenergistics2:material:8>, <contenttweaker:etched_quartz_glass>],
        [<appliedenergistics2:material:8>, input, <appliedenergistics2:material:8>],
        [<ironchest:iron_chest:2>, <ironchest:iron_chest:2>, <ironchest:iron_chest:2>]]);
    recipes.addShapeless("Shapeless - " ~ output.displayName, output, [<extracells:storage.casing>, input]);
}

function etchGas(input as IIngredient, output as IItemStack) {
    recipes.remove(output);
    recipes.addShaped("W4 Etched " ~ output.displayName, output,
        [[<contenttweaker:etched_quartz_glass>, <appliedenergistics2:material:8>, <contenttweaker:etched_quartz_glass>],
        [<appliedenergistics2:material:8>, input, <appliedenergistics2:material:8>],
        [<ore:plateGold>, <ironchest:iron_chest:1>, <ore:plateGold>]]);
    recipes.addShapeless("Shapeless - " ~ output.displayName, output, [<extracells:storage.casing:2>, input]);
}

# ########################
# Advanced cells - etched glass
# ########################

# Item 16k/64k, fluid 16k/64k, spatial 16cubed/128cubed
val etchedCells = {
    <appliedenergistics2:material:37>: <appliedenergistics2:storage_cell_16k>,
    <appliedenergistics2:material:38>: <appliedenergistics2:storage_cell_64k>,
    <appliedenergistics2:material:56>: <appliedenergistics2:fluid_storage_cell_16k>,
    <appliedenergistics2:material:57>: <appliedenergistics2:fluid_storage_cell_64k>,
    <appliedenergistics2:material:33>: <appliedenergistics2:spatial_storage_cell_16_cubed>,
    <appliedenergistics2:material:34>: <appliedenergistics2:spatial_storage_cell_128_cubed>
} as IItemStack[IIngredient];

for input, output in etchedCells {
    etchStandard(input, output);
}

# ExtraCells physical cells (256k and up) - the whole line is advanced
for i in 0 .. 4 {
    etchPhysical(<extracells:storage.component>.definition.makeStack(i), <extracells:storage.physical>.definition.makeStack(i));
}

# ExtraCells gas cells 16k and up - 1k/4k keep plain glass
for i in 2 .. 8 {
    etchGas(<extracells:storage.component>.definition.makeStack(i + 11), <extracells:storage.gas>.definition.makeStack(i));
}

# Flavor
<contenttweaker:etched_quartz_glass>.addTooltip("Acid-etched until the circuits can feel it.");
<appliedenergistics2:part:140>.addTooltip("Fluorinated glass, clearer than air.");
