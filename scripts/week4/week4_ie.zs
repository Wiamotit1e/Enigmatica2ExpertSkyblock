#modloaded immersiveengineering industrialforegoing
#priority -2

import mods.immersiveengineering.BlastFurnace;

# ---=== Blast Furnace: steel from crushed iron dust ===---
# Iron ingots no longer smelt to steel. Iron ore must pass through a
# crusher first (any of the 12 process.crush machines), tying the
# process system into the Tier 1 mainline.
BlastFurnace.removeRecipe(<immersiveengineering:metal:8>);
BlastFurnace.addRecipe(<immersiveengineering:metal:8>, <ore:dustIron>, 1200, <immersiveengineering:material:7>);

# ---=== Blast Furnace Preheater: IF plastic insulation ===---
# The Improved Blast Furnace's preheaters are wrapped in industrial
# plastic - the first IE/IF bridge.
recipes.remove(<immersiveengineering:metal_device1:0>);
recipes.addShaped("W4 Blast Furnace Preheater",
    <immersiveengineering:metal_device1:0>,
    [[<industrialforegoing:plastic>, <immersiveengineering:material:20>, <industrialforegoing:plastic>],
    [<immersiveengineering:material:20>, <ore:plateIron>, <immersiveengineering:material:20>],
    [<industrialforegoing:plastic>, <immersiveengineering:material:20>, <industrialforegoing:plastic>]]);

# ---=== Creosote Impregnation: coal -> coal coke ===---
# Creosote's second life: impregnating coal doubles coke output.
recipes.addShapeless("W4 Creosote Impregnation",
    <immersiveengineering:material:6> * 2,
    [<minecraft:coal:*>, <liquid:creosote> * 250]);
