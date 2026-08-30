import mods.forestry.ThermionicFabricator;

mods.forestry.ThermionicFabricator.addCast(
    <ic2:crafting:1> * 2,
     [[<ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte}),<ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte}),<ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte})],
    [<minecraft:redstone>,<thermalfoundation:material:32>,<minecraft:redstone>],
    [<ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte}),<ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte}),<ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte})]],
    <liquid: glass> * 1000);