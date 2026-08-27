#modloaded ae2stuff appliedenergistics2
#priority -2

# ---=== AE2Stuff devices ===---
# Previously untouched by pack scripts; cross-mod re-recipes for the AE2 chapter.

# Crystal Growth Chamber - pure crystal automation hub
recipes.remove(<ae2stuff:grower>);
recipes.addShaped("Crystal Growth Chamber",
    <ae2stuff:grower>,
    [[<appliedenergistics2:quartz_glass>, <appliedenergistics2:quartz_glass>, <appliedenergistics2:quartz_glass>],
    [<appliedenergistics2:quartz_growth_accelerator>, <teslacorelib:machine_case>, <appliedenergistics2:quartz_growth_accelerator>],
    [<appliedenergistics2:material:5>, <appliedenergistics2:fluix_block>, <appliedenergistics2:material:5>]]);

# Advanced Inscriber
recipes.remove(<ae2stuff:inscriber>);
recipes.addShaped("Advanced Inscriber",
    <ae2stuff:inscriber>,
    [[<appliedenergistics2:material:2>, <teslacorelib:machine_case>, <appliedenergistics2:material:2>],
    [<appliedenergistics2:material:10>, <appliedenergistics2:inscriber>, <appliedenergistics2:material:10>],
    [<appliedenergistics2:material:2>, <appliedenergistics2:material:24>, <appliedenergistics2:material:2>]]);

# Pattern Encoder
recipes.remove(<ae2stuff:encoder>);
recipes.addShaped("Pattern Encoder",
    <ae2stuff:encoder>,
    [[<appliedenergistics2:quartz_glass>, <minecraft:chest>, <appliedenergistics2:quartz_glass>],
    [<appliedenergistics2:material:52>, <teslacorelib:machine_case>, <appliedenergistics2:material:52>],
    [<ore:plateIron>, <appliedenergistics2:material:23>, <ore:plateIron>]]);

# Wireless Connector
recipes.remove(<ae2stuff:wireless>);
recipes.addShaped("Wireless Connector",
    <ae2stuff:wireless>,
    [[<appliedenergistics2:material:42>, <appliedenergistics2:quartz_glass>, <appliedenergistics2:material:42>],
    [<appliedenergistics2:material:9>, <teslacorelib:machine_case>, <appliedenergistics2:material:9>],
    [<appliedenergistics2:material:42>, <appliedenergistics2:quartz_glass>, <appliedenergistics2:material:42>]]);

# Wireless Setup Kit
recipes.remove(<ae2stuff:wireless_kit>);
recipes.addShaped("Wireless Setup Kit",
    <ae2stuff:wireless_kit>,
    [[null, <appliedenergistics2:material:42>, null],
    [<appliedenergistics2:material:52>, <appliedenergistics2:quartz_glass>, <appliedenergistics2:material:52>],
    [null, <ore:plateIron>, null]]);
