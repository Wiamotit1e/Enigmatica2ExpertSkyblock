#modloaded thaumicenergistics thaumcraft appliedenergistics2
#priority -2

# ---=== Thaumic Energistics: essentia cell assembly ===---
# The stock cell recipes (quartz glass + redstone + iron ingots +
# component) are reworked into the pack's AE2 cell idiom
# (AppliedEnergistics.zs newCellRecipe): quartz glass + redstone +
# iron chest + iron plates + component. The shapeless housing route
# (AE2 storage housing + component, ThE's component2cell recipes)
# stays untouched. The essentia components keep their original
# arcane-crafted recipes.
# week4: every essentia cell uses the HF-etched glass
# (week4/week4_hf.zs), like every other storage cell in the pack.

recipes.remove(<thaumicenergistics:essentia_cell_1k>);
recipes.addShaped("W4 Essentia Cell 1k", <thaumicenergistics:essentia_cell_1k>,
    [[<contenttweaker:etched_quartz_glass>, <ore:dustRedstone>, <contenttweaker:etched_quartz_glass>],
    [<ore:dustRedstone>, <thaumicenergistics:essentia_component_1k>, <ore:dustRedstone>],
    [<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);

recipes.remove(<thaumicenergistics:essentia_cell_4k>);
recipes.addShaped("W4 Essentia Cell 4k", <thaumicenergistics:essentia_cell_4k>,
    [[<contenttweaker:etched_quartz_glass>, <ore:dustRedstone>, <contenttweaker:etched_quartz_glass>],
    [<ore:dustRedstone>, <thaumicenergistics:essentia_component_4k>, <ore:dustRedstone>],
    [<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);

recipes.remove(<thaumicenergistics:essentia_cell_16k>);
recipes.addShaped("W4 Essentia Cell 16k", <thaumicenergistics:essentia_cell_16k>,
    [[<contenttweaker:etched_quartz_glass>, <ore:dustRedstone>, <contenttweaker:etched_quartz_glass>],
    [<ore:dustRedstone>, <thaumicenergistics:essentia_component_16k>, <ore:dustRedstone>],
    [<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);

recipes.remove(<thaumicenergistics:essentia_cell_64k>);
recipes.addShaped("W4 Essentia Cell 64k", <thaumicenergistics:essentia_cell_64k>,
    [[<contenttweaker:etched_quartz_glass>, <ore:dustRedstone>, <contenttweaker:etched_quartz_glass>],
    [<ore:dustRedstone>, <thaumicenergistics:essentia_component_64k>, <ore:dustRedstone>],
    [<ore:plateIron>, <ironchest:iron_chest>, <ore:plateIron>]]);
