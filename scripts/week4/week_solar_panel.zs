#priority -2

// 先清掉 Solar Flux 自带的面板/电池/镜面配方，下面整条重写
val recipesToRemove = [
    <solarflux:mirror>,
    <solarflux:solar_panel_1>,
    <solarflux:solar_panel_2>,
    <solarflux:solar_panel_3>,
    <solarflux:solar_panel_4>,
    <solarflux:solar_panel_5>,
    <solarflux:solar_panel_6>,
    <solarflux:solar_panel_7>,
    <solarflux:solar_panel_8>,
    <solarflux:photovoltaic_cell_1>,
    <solarflux:photovoltaic_cell_2>,
    <solarflux:photovoltaic_cell_3>,
    <solarflux:photovoltaic_cell_4>,
    <solarflux:photovoltaic_cell_5>,
    <solarflux:photovoltaic_cell_6>,
    <solarflux:solar_panel_wyvern>,
    <solarflux:solar_panel_draconic>,
    <solarflux:solar_panel_chaotic>,
    <solarflux:solar_panel_neutronium>,
    <solarflux:solar_panel_infinity>
] as IItemStack[];

for item in recipesToRemove {
    recipes.remove(item);
}

// z=-1408 配方A：输出 solar_panel_1
recipes.addShaped("solar_panel_1", <solarflux:solar_panel_1>, [
    [<solarflux:mirror>, <solarflux:mirror>, <solarflux:mirror>],
    [<ic2:component_heat_vent>, <compactsolars:compact_solar_block:2>, <ic2:component_heat_vent>],
    [<ic2:component_heat_vent>, <ic2:crafting:4>, <ic2:component_heat_vent>]
]);

// z=-1408 配方B：输出 solarflux:mirror
recipes.addShaped("solarflux_mirror", <solarflux:mirror>, [
    [<ic2:glass>, <ic2:glass>, <ic2:glass>],
    [<thermalfoundation:material:324>, <immersiveengineering:metal_decoration0:4>, <thermalfoundation:material:324>],
    [<thermalfoundation:material:324>, <thermalfoundation:material:324>, <thermalfoundation:material:324>]
]);

// z=-1410：输出 solar_panel_2
recipes.addShaped("solar_panel_2", <solarflux:solar_panel_2>, [
    [<solarflux:solar_panel_1>, <solarflux:solar_panel_1>, <solarflux:solar_panel_1>],
    [<solarflux:solar_panel_1>, <ic2:iridium_reflector>, <solarflux:solar_panel_1>],
    [<solarflux:solar_panel_1>, <solarflux:solar_panel_1>, <solarflux:solar_panel_1>]
]);

// z=-1412 配方A：输出 solar_panel_3
recipes.addShaped("solar_panel_3", <solarflux:solar_panel_3>, [
    [<solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>],
    [<botania:manaresource:2>, <solarflux:solar_panel_2>, <botania:manaresource:2>],
    [<solarflux:solar_panel_2>, <industrialforegoing:laser_lens:3>, <solarflux:solar_panel_2>]
]);

// z=-1412 配方B：输出 photovoltaic_cell_1
recipes.addShaped("photovoltaic_cell_1", <solarflux:photovoltaic_cell_1>, [
    [<solarflux:mirror>, <solarflux:mirror>, <solarflux:mirror>],
    [<ic2:advanced_heat_vent>.withTag({advDmg: 0}), <enderio:block_solar_panel>, <ic2:advanced_heat_vent>.withTag({advDmg: 0})],
    [<forestry:hardened_machine>, <forestry:hardened_machine>, <forestry:hardened_machine>]
]);

// z=-1414 配方A：输出 solar_panel_4
recipes.addShaped("solar_panel_4", <solarflux:solar_panel_4>, [
    [<solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>],
    [<actuallyadditions:item_crystal_empowered:1>, <solarflux:solar_panel_3>, <actuallyadditions:item_crystal_empowered:1>],
    [<solarflux:solar_panel_3>, <actuallyadditions:block_misc:9>, <solarflux:solar_panel_3>]
]);

// z=-1414 配方B：输出 photovoltaic_cell_2
recipes.addShaped("photovoltaic_cell_2", <solarflux:photovoltaic_cell_2>, [
    [<solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>],
    [<environmentaltech:connector>, <actuallyadditions:block_furnace_solar>, <environmentaltech:connector>],
    [<minecraft:sea_lantern>, <minecraft:sea_lantern>, <minecraft:sea_lantern>]
]);

// z=-1416 配方A：输出 solar_panel_5
recipes.addShaped("solar_panel_5", <solarflux:solar_panel_5>, [
    [<solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>],
    [<ic2:misc_resource:3>, <solarflux:solar_panel_4>, <ic2:misc_resource:3>],
    [<solarflux:solar_panel_4>, <nuclearcraft:lithium_ion_battery_elite>.withTag({maxTransfer: 102400000, capacity: 2048000000, energy: 0}), <solarflux:solar_panel_4>]
]);

// z=-1416 配方B：输出 photovoltaic_cell_3
recipes.addShaped("photovoltaic_cell_3", <solarflux:photovoltaic_cell_3>, [
    [<solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>],
    [<nuclearcraft:part:6>, <nuclearcraft:solar_panel_elite>, <nuclearcraft:part:6>],
    [<nuclearcraft:ingot:11>, <nuclearcraft:ingot:11>, <nuclearcraft:ingot:11>]
]);

// z=-1418 配方A：输出 solar_panel_6
recipes.addShaped("solar_panel_6", <solarflux:solar_panel_6>, [
    [<solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>],
    [<nuclearcraft:tritium_lamp>, <solarflux:solar_panel_5>, <nuclearcraft:tritium_lamp>],
    [<solarflux:solar_panel_5>, <extrautils2:opinium:3>, <solarflux:solar_panel_5>]
]);

// z=-1418 配方B：输出 photovoltaic_cell_4
recipes.addShaped("photovoltaic_cell_4", <solarflux:photovoltaic_cell_4>, [
    [<solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>],
    [<extrautils2:ineffableglass>, <extrautils2:passivegenerator>, <extrautils2:ineffableglass>],
    [<extrautils2:klein>, <extrautils2:klein>, <extrautils2:klein>]
]);

// z=-1420 配方A：输出 solar_panel_7
recipes.addShaped("solar_panel_7", <solarflux:solar_panel_7>, [
    [<solarflux:photovoltaic_cell_5>, <solarflux:photovoltaic_cell_5>, <solarflux:photovoltaic_cell_5>],
    [<environmentaltech:litherite>, <solarflux:solar_panel_6>, <environmentaltech:litherite>],
    [<solarflux:solar_panel_6>, <environmentaltech:lightning_cont_6>, <solarflux:solar_panel_6>]
]);

// z=-1420 配方B：输出 photovoltaic_cell_5
recipes.addShaped("photovoltaic_cell_5", <solarflux:photovoltaic_cell_5>, [
    [<solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>],
    [<thermalfoundation:material:264>, <environmentaltech:solar_cell_aethium>, <thermalfoundation:material:264>],
    [<appliedenergistics2:material:45>, <appliedenergistics2:material:45>, <appliedenergistics2:material:45>]
]);

// z=-1422 配方A：输出 solar_panel_8
recipes.addShaped("solar_panel_8", <solarflux:solar_panel_8>, [
    [<solarflux:photovoltaic_cell_6>, <solarflux:photovoltaic_cell_6>, <solarflux:photovoltaic_cell_6>],
    [<minecraft:dragon_breath>, <solarflux:solar_panel_7>, <minecraft:dragon_breath>],
    [<solarflux:solar_panel_7>, <extrautils2:teleporter:1>, <solarflux:solar_panel_7>]
]);

// z=-1422 配方B：输出 photovoltaic_cell_6
recipes.addShaped("photovoltaic_cell_6", <solarflux:photovoltaic_cell_6>, [
    [<solarflux:photovoltaic_cell_5>, <solarflux:photovoltaic_cell_5>, <solarflux:photovoltaic_cell_5>],
    [<draconicevolution:dragon_heart>, <appliedenergistics2:molecular_assembler>, <draconicevolution:dragon_heart>],
    [<psi:material:2>, <psi:material:2>, <psi:material:2>]
]);


// =========================================================
// 5x5 ExtendedCrafting 配方，等级 2
// z=-1424 ec_advanced_table，中心 slot12 是输出
// =========================================================

mods.extendedcrafting.TableCrafting.addShaped(2, <solarflux:solar_panel_wyvern> * 3, [
    [<solarflux:solar_panel_8>, <enderio:item_material:56>, <solarflux:solar_panel_8>, <contenttweaker:entropy_core>, <solarflux:solar_panel_8>],
    [<contenttweaker:entropy_core>, <enderio:item_capacitor_melodic>, <extendedcrafting:trimmed:4>, <enderio:item_capacitor_melodic>, <enderio:item_material:56>],
    [<solarflux:solar_panel_8>, <extendedcrafting:trimmed:4>, <draconicevolution:draconium_capacitor>, <extendedcrafting:trimmed:4>, <solarflux:solar_panel_8>],
    [<enderio:item_material:56>, <enderio:item_capacitor_melodic>, <extendedcrafting:trimmed:4>, <enderio:item_capacitor_melodic>, <contenttweaker:entropy_core>],
    [<solarflux:solar_panel_8>, <contenttweaker:entropy_core>, <solarflux:solar_panel_8>, <enderio:item_material:56>, <solarflux:solar_panel_8>]
]);


// =========================================================
// 7x7 ExtendedCrafting 配方，等级 3
// z=-1426 ec_elite_table，中心 slot24 是输出
// =========================================================

mods.extendedcrafting.TableCrafting.addShaped(3, <solarflux:solar_panel_draconic> * 3, [
    [<solarflux:solar_panel_wyvern>, <extendedcrafting:material:48>, <draconicevolution:wyvern_core>, <solarflux:solar_panel_wyvern>, <draconicevolution:wyvern_core>, <extendedcrafting:material:48>, <solarflux:solar_panel_wyvern>],
    [<extendedcrafting:material:48>, <enderio:block_solar_panel:5>, <extendedcrafting:material:12>, <nuclearcraft:rtg_californium>, <ic2:misc_resource:3>, <enderio:block_solar_panel:5>, <extendedcrafting:material:48>],
    [<draconicevolution:wyvern_core>, <ic2:misc_resource:3>, <mekanismgenerators:generator:5>, <mekanism:machineblock3:1>, <mekanismgenerators:generator:5>, <extendedcrafting:material:12>, <draconicevolution:wyvern_core>],
    [<solarflux:solar_panel_wyvern>, <nuclearcraft:rtg_californium>, <mekanism:machineblock3:1>, <draconicevolution:draconium_capacitor:1>, <mekanism:machineblock3:1>, <nuclearcraft:rtg_californium>, <solarflux:solar_panel_wyvern>],
    [<draconicevolution:wyvern_core>, <extendedcrafting:material:12>, <mekanismgenerators:generator:5>, <mekanism:machineblock3:1>, <mekanismgenerators:generator:5>, <ic2:misc_resource:3>, <draconicevolution:wyvern_core>],
    [<extendedcrafting:material:48>, <enderio:block_solar_panel:5>, <ic2:misc_resource:3>, <nuclearcraft:rtg_californium>, <extendedcrafting:material:12>, <enderio:block_solar_panel:5>, <extendedcrafting:material:48>],
    [<solarflux:solar_panel_wyvern>, <extendedcrafting:material:48>, <draconicevolution:wyvern_core>, <solarflux:solar_panel_wyvern>, <draconicevolution:wyvern_core>, <extendedcrafting:material:48>, <solarflux:solar_panel_wyvern>]
]);


mods.extendedcrafting.TableCrafting.addShaped(4, <solarflux:solar_panel_chaotic> * 4, [
    [<environmentaltech:solar_cont_4>, <thermaldynamics:duct_0:5>, <extendedcrafting:material:13>, <appliedenergistics2:crafting_storage_64k>, <mysticalagradditions:stuff:69>, <appliedenergistics2:crafting_storage_64k>, <extendedcrafting:material:13>, <thermaldynamics:duct_0:5>, <environmentaltech:solar_cont_4>],
    [<thermaldynamics:duct_0:5>, <solarflux:solar_panel_draconic>, <contenttweaker:benitoite>, <contenttweaker:anglesite>, <enderio:item_endergy_conduit:11>, <contenttweaker:anglesite>, <contenttweaker:benitoite>, <solarflux:solar_panel_draconic>, <thermaldynamics:duct_0:5>],
    [<extendedcrafting:material:13>, <contenttweaker:benitoite>, <solarflux:solar_panel_draconic>, <mekanism:basicblock2:4>.withTag({tier: 3}), <draconicevolution:chaotic_core>, <mekanism:basicblock2:3>.withTag({tier: 3}), <solarflux:solar_panel_draconic>, <contenttweaker:benitoite>, <extendedcrafting:material:13>],
    [<appliedenergistics2:crafting_storage_64k>, <contenttweaker:anglesite>, <mekanism:basicblock2:3>.withTag({tier: 3}), <solarflux:solar_panel_draconic>, <draconicevolution:reactor_component>, <solarflux:solar_panel_draconic>, <mekanism:basicblock2:4>.withTag({tier: 3}), <contenttweaker:anglesite>, <appliedenergistics2:crafting_storage_64k>],
    [<mysticalagradditions:stuff:69>, <enderio:item_endergy_conduit:11>, <draconicevolution:chaotic_core>, <draconicevolution:reactor_component>, <draconicevolution:reactor_core>, <draconicevolution:reactor_component>, <draconicevolution:chaotic_core>, <enderio:item_endergy_conduit:11>, <mysticalagradditions:stuff:69>],
    [<appliedenergistics2:crafting_storage_64k>, <contenttweaker:anglesite>, <mekanism:basicblock2:4>.withTag({tier: 3}), <solarflux:solar_panel_draconic>, <draconicevolution:reactor_component>, <solarflux:solar_panel_draconic>, <mekanism:basicblock2:3>.withTag({tier: 3}), <contenttweaker:anglesite>, <appliedenergistics2:crafting_storage_64k>],
    [<extendedcrafting:material:13>, <contenttweaker:benitoite>, <solarflux:solar_panel_draconic>, <mekanism:basicblock2:3>.withTag({tier: 3}), <draconicevolution:chaotic_core>, <mekanism:basicblock2:4>.withTag({tier: 3}), <solarflux:solar_panel_draconic>, <contenttweaker:benitoite>, <extendedcrafting:material:13>],
    [<thermaldynamics:duct_0:5>, <solarflux:solar_panel_draconic>, <contenttweaker:benitoite>, <contenttweaker:anglesite>, <enderio:item_endergy_conduit:11>, <contenttweaker:anglesite>, <contenttweaker:benitoite>, <solarflux:solar_panel_draconic>, <thermaldynamics:duct_0:5>],
    [<environmentaltech:solar_cont_4>, <thermaldynamics:duct_0:5>, <extendedcrafting:material:13>, <appliedenergistics2:crafting_storage_64k>, <mysticalagradditions:stuff:69>, <appliedenergistics2:crafting_storage_64k>, <extendedcrafting:material:13>, <thermaldynamics:duct_0:5>, <environmentaltech:solar_cont_4>]
]);


mods.extendedcrafting.TableCrafting.addShaped(4, <solarflux:solar_panel_neutronium>, [
    [<quark:rune:16>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <avaritia:block_resource:2>, <contenttweaker:pride_flag>, <avaritia:block_resource:2>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <quark:rune:16>],
    [<extrautils2:decorativesolid:8>, <contenttweaker:anglesite>, <contenttweaker:anglesite>, <contenttweaker:benitoite>, <extendedcrafting:crafting_core>, <contenttweaker:benitoite>, <contenttweaker:anglesite>, <contenttweaker:anglesite>, <extrautils2:decorativesolid:8>],
    [<extrautils2:decorativesolid:8>, <contenttweaker:anglesite>, <contenttweaker:benitoite>, <extendedcrafting:material:13>, <thermalexpansion:frame:148>, <extendedcrafting:material:13>, <contenttweaker:benitoite>, <contenttweaker:anglesite>, <extrautils2:decorativesolid:8>],
    [<avaritia:block_resource:2>, <contenttweaker:benitoite>, <extendedcrafting:material:13>, <avaritia:resource:5>, <avaritia:block_resource>, <avaritia:resource:5>, <extendedcrafting:material:13>, <contenttweaker:benitoite>, <avaritia:block_resource:2>],
    [<contenttweaker:pride_flag>, <extendedcrafting:crafting_core>, <thermalexpansion:frame:148>, <avaritia:block_resource>, <solarflux:solar_panel_chaotic>, <avaritia:block_resource>, <thermalexpansion:frame:148>, <extendedcrafting:crafting_core>, <contenttweaker:pride_flag>],
    [<avaritia:block_resource:2>, <contenttweaker:benitoite>, <extendedcrafting:material:13>, <avaritia:resource:5>, <avaritia:block_resource>, <avaritia:resource:5>, <extendedcrafting:material:13>, <contenttweaker:benitoite>, <avaritia:block_resource:2>],
    [<extrautils2:decorativesolid:8>, <contenttweaker:anglesite>, <contenttweaker:benitoite>, <extendedcrafting:material:13>, <thermalexpansion:frame:148>, <extendedcrafting:material:13>, <contenttweaker:benitoite>, <contenttweaker:anglesite>, <extrautils2:decorativesolid:8>],
    [<extrautils2:decorativesolid:8>, <contenttweaker:anglesite>, <contenttweaker:anglesite>, <contenttweaker:benitoite>, <extendedcrafting:crafting_core>, <contenttweaker:benitoite>, <contenttweaker:anglesite>, <contenttweaker:anglesite>, <extrautils2:decorativesolid:8>],
    [<quark:rune:16>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <avaritia:block_resource:2>, <contenttweaker:pride_flag>, <avaritia:block_resource:2>, <extrautils2:decorativesolid:8>, <extrautils2:decorativesolid:8>, <quark:rune:16>]
]);

mods.extendedcrafting.TableCrafting.addShaped(4, <solarflux:solar_panel_infinity>, [
    [<extrautils2:compressedcobblestone:7>, <extrautils2:ingredients:16>, <environmentaltech:void_ore_miner_cont_6>, <extrautils2:rainbowgenerator>, <tconstruct:materials:50>, <extrautils2:rainbowgenerator>, <environmentaltech:void_ore_miner_cont_6>, <extrautils2:passivegenerator:8>, <extrautils2:compressedcobblestone:7>],
    [<extrautils2:passivegenerator:8>, <environmentaltech:void_res_miner_cont_6>, <thermalexpansion:frame:148>, <storagedrawers:upgrade_creative>, <thermalexpansion:frame:148>, <storagedrawers:upgrade_creative>, <thermalexpansion:frame:148>, <environmentaltech:void_res_miner_cont_6>, <extrautils2:ingredients:16>],
    [<environmentaltech:void_ore_miner_cont_6>, <thermalexpansion:frame:148>, <avaritia:resource:5>, <extracells:storage.component:3>, <avaritia:resource:5>, <extracells:storage.component:3>, <avaritia:resource:5>, <thermalexpansion:frame:148>, <environmentaltech:void_ore_miner_cont_6>],
    [<extrautils2:rainbowgenerator>, <storagedrawers:upgrade_creative>, <extracells:storage.component:3>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <extracells:storage.component:3>, <storagedrawers:upgrade_creative>, <extrautils2:rainbowgenerator>],
    [<tconstruct:materials:50>, <thermalexpansion:frame:148>, <avaritia:resource:5>, <avaritia:resource:6>, <solarflux:solar_panel_neutronium>, <avaritia:resource:6>, <avaritia:resource:5>, <thermalexpansion:frame:148>, <tconstruct:materials:50>],
    [<extrautils2:rainbowgenerator>, <storagedrawers:upgrade_creative>, <extracells:storage.component:3>, <avaritia:resource:6>, <avaritia:resource:6>, <avaritia:resource:6>, <extracells:storage.component:3>, <storagedrawers:upgrade_creative>, <extrautils2:rainbowgenerator>],
    [<environmentaltech:void_ore_miner_cont_6>, <thermalexpansion:frame:148>, <avaritia:resource:5>, <extracells:storage.component:3>, <avaritia:resource:5>, <extracells:storage.component:3>, <avaritia:resource:5>, <thermalexpansion:frame:148>, <environmentaltech:void_ore_miner_cont_6>],
    [<extrautils2:ingredients:16>, <environmentaltech:void_res_miner_cont_6>, <thermalexpansion:frame:148>, <storagedrawers:upgrade_creative>, <thermalexpansion:frame:148>, <storagedrawers:upgrade_creative>, <thermalexpansion:frame:148>, <environmentaltech:void_res_miner_cont_6>, <extrautils2:ingredients:16>],
    [<extrautils2:compressedcobblestone:7>, <extrautils2:passivegenerator:8>, <environmentaltech:void_ore_miner_cont_6>, <extrautils2:rainbowgenerator>, <tconstruct:materials:50>, <extrautils2:rainbowgenerator>, <environmentaltech:void_ore_miner_cont_6>, <extrautils2:passivegenerator:8>, <extrautils2:compressedcobblestone:7>]
]);