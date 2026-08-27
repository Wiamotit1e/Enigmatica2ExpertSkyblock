#modloaded industrialforegoing immersiveengineering teslacorelib
#priority -2

# ---=== Tree Fluid Extractor: treated-wood frame ===---
# The extractor now stands on a treated-wood frame - IF's opening
# machine reaches back into the IE coke-oven line.
recipes.remove(<industrialforegoing:tree_fluid_extractor>);
recipes.addShaped("W4 Tree Fluid Extractor",
    <industrialforegoing:tree_fluid_extractor>,
    [[<ore:gearIron>, <minecraft:furnace>, <ore:gearIron>],
    [<immersiveengineering:treated_wood:0>, <minecraft:redstone>, <immersiveengineering:treated_wood:0>],
    [<immersiveengineering:treated_wood:0>, <minecraft:stone>, <immersiveengineering:treated_wood:0>]]);

# ---=== Latex Processing Unit: IE fluid pump + machine case ===---
# The pump the IE gate rewards finally has its designated home.
recipes.remove(<industrialforegoing:latex_processing_unit>);
recipes.addShaped("W4 Latex Processing Unit",
    <industrialforegoing:latex_processing_unit>,
    [[<ore:ingotIron>, <immersiveengineering:metal_device0:5>, <ore:ingotIron>],
    [<ore:gearIron>, <teslacorelib:machine_case>, <ore:gearIron>],
    [<ore:ingotIron>, <minecraft:redstone>, <ore:ingotIron>]]);

# ---=== Plastic: extracted from dry rubber, not furnace-smelted ===---
# Plastic production moves from the furnace to Tier 1 machines:
# IC2 Extractor or Mekanism Enrichment Chamber.
furnace.remove(<industrialforegoing:plastic>);
scripts.process.extract(<industrialforegoing:dryrubber>, <industrialforegoing:plastic>, "");
