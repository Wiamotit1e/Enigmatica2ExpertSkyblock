#priority -2
#modloaded threng

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI.removeAndHide as rh;
import mods.appliedenergistics2.Inscriber;
import mods.mekanism.infuser;
import mods.thermalexpansion.InductionSmelter;
import mods.forestry.Carpenter;
import mods.thaumcraft.Infusion;
import mods.astralsorcery.Altar;
import mods.actuallyadditions.Empowerer;
import mods.botania.RuneAltar;

# ######################################################################
#
# week4_lazyae2.zs
#
# Lazy AE2 (threng) rework: five of the six standalone machines are
# deleted - the ME Level Maintainer (meta 4) stays craftable and visible
# with its vanilla recipe intact - and every material gets a recipe on a
# different machine of the pack instead of a crafting grid. The Mass
# Assembler multiblock stays untouched and keeps consuming fluix steel,
# logic units and massively parallel processors.
#
# ######################################################################

# ########################
# Delete five of the six machines
# ########################

# Meta 4 (ME Level Maintainer) is kept: it is the auto-stocking machine
# and must stay craftable and visible in JEI. Meta 5 (Crystal Energizer)
# is deleted like the other four.
for i in 0 to 5 {
	if (i != 4) {
		val machine as IItemStack = <threng:machine>.definition.makeStack(i);
		recipes.remove(machine);
		rh(machine);
	}
}

# The inscriber press recipe for fluix-plated iron dies with the etcher
Inscriber.removeRecipe(<threng:material:2>);

# ########################
# Materials - one machine per step
# ########################

# Remove the old crafting recipes (the machine-only materials have none)
recipes.remove(<threng:material:1>);
recipes.remove(<threng:material:4>);
for i in 8 to 13 {
	recipes.remove(<threng:material>.definition.makeStack(i));
}

# Coal Dust - any crusher in the pack grinds a coal block into dust
scripts.process.crush(<ore:blockCoal>, <threng:material:3> * 9);

# Carbonic Fluix Complex - fluix infused with carbon in a Mekanism
# Metallurgic Infuser
infuser.addRecipe("CARBON", 20, <ore:crystalFluix>, <threng:material:1>);

# Fluix-Plated Iron Ingot - the Forestry Carpenter plates iron with
# carbonic complex under a bath of molten glass
Carpenter.addRecipe(<threng:material:2> * 4,
[[<threng:material:1>, <ore:ingotIron>, <threng:material:1>],
[<ore:ingotIron>, <ore:crystalFluix>, <ore:ingotIron>],
[<threng:material:1>, <ore:ingotIron>, <threng:material:1>]],
40, <liquid:glass> * 500);

# Fluix Steel Ingot - the Induction Smelter alloys plated iron with coal
InductionSmelter.addRecipe(<threng:material:0> * 2, <threng:material:2>, <threng:material:3>, 4000);

# Fluix Logic Unit - fluix steel plates around a carbonic core
recipes.addShaped("W4 Fluix Logic Unit",
<threng:material:4>,
[[<appliedenergistics2:quartz_glass>, <threng:material:0>, <appliedenergistics2:quartz_glass>],
[<threng:material:0>, <threng:material:1>, <threng:material:0>],
[<appliedenergistics2:quartz_glass>, <threng:material:0>, <appliedenergistics2:quartz_glass>]]);

# Resonating Crystal - the starlight altar tunes a diamond with pearl dust
Altar.addDiscoveryAltarRecipe("enigmatica2expert:shaped/internal/altar/w4_resonating_crystal",
<threng:material:5>, 400, 120,
[<ore:dustEnderPearl>, null, <ore:dustEnderPearl>,
null, <ore:gemDiamond>, null,
<ore:dustEnderPearl>, null, <ore:dustEnderPearl>] as IIngredient[]);

# Massively Parallel Processor - the Empowerer charges a circuit
# substrate between four resonating crystals
Empowerer.addRecipe(<threng:material:6>,
<contenttweaker:circuit_substrate>,
<threng:material:5>, <threng:material:5>, <threng:material:5>, <threng:material:5>,
20000, 120, [0.8, 0.1, 0.9]);

# ...or assembled on the Combination Crafting core - same materials as
# the Empowerer: one substrate on the core, four crystals around it
mods.extendedcrafting.CombinationCrafting.addRecipe(<threng:material:6>,
5000000, 500000,
<contenttweaker:circuit_substrate>,
[<threng:material:5>, <threng:material:5>, <threng:material:5>, <threng:material:5>]);

# Speculation Core (1x) - the Runic Altar solidifies a wild guess
RuneAltar.addRecipe(<threng:material:7> * 2,
[<minecraft:wheat>, <ore:enderpearl>, <ore:crystalCertusQuartz>, <ore:crystalCertusQuartz>, <ore:ingotGold>] as IIngredient[],
5000);

# Speculation Core upgrades - each tier doubles the speculation
recipes.addShaped("W4 Speculation Core 2x",
<threng:material:8>,
[[<threng:material:7>, <ore:dustRedstone>, <threng:material:7>]]);
recipes.addShaped("W4 Speculation Core 4x",
<threng:material:9>,
[[<threng:material:8>, <ore:itemSilicon>, <threng:material:8>]]);
recipes.addShaped("W4 Speculation Core 8x",
<threng:material:10>,
[[<threng:material:9>, <ore:crystalFluix>, <threng:material:9>]]);
recipes.addShaped("W4 Speculation Core 16x",
<threng:material:11>,
[[<threng:material:10>, <threng:material:5>, <threng:material:10>]]);
recipes.addShaped("W4 Speculation Core 32x",
<threng:material:12>,
[[<threng:material:11>, <threng:material:4>, <threng:material:11>]]);
recipes.addShaped("W4 Speculation Core 64x",
<threng:material:13>,
[[<threng:material:12>, <threng:material:6>, <threng:material:12>]]);

# MA Controller - the speculative processor steers the mass assembler;
# the whole speculation chain now has a structural purpose
recipes.remove(<threng:big_assembler:2>);
recipes.addShaped("W4 MA Controller",
<threng:big_assembler:2>,
[[<threng:big_assembler:0>, <appliedenergistics2:molecular_assembler>, <threng:big_assembler:0>],
[<appliedenergistics2:part:16>, <threng:material:14>, <appliedenergistics2:part:16>],
[<threng:big_assembler:0>, <appliedenergistics2:interface>, <threng:big_assembler:0>]]);

# MA Crafting Coprocessor - speculation cores replace the old MPP slot:
# a 16x core makes one, a 32x core makes two, a 64x core makes four
recipes.remove(<threng:big_assembler:4>);
recipes.addShaped("W4 MA Coprocessor 16x",
<threng:big_assembler:4>,
[[<threng:big_assembler:0>, <appliedenergistics2:molecular_assembler>, <threng:big_assembler:0>],
[<appliedenergistics2:part:16>, <threng:material:11>, <appliedenergistics2:part:16>],
[<threng:big_assembler:0>, <appliedenergistics2:crafting_accelerator>, <threng:big_assembler:0>]]);
recipes.addShaped("W4 MA Coprocessor 32x",
<threng:big_assembler:4> * 2,
[[<threng:big_assembler:0>, <appliedenergistics2:molecular_assembler>, <threng:big_assembler:0>],
[<appliedenergistics2:part:16>, <threng:material:12>, <appliedenergistics2:part:16>],
[<threng:big_assembler:0>, <appliedenergistics2:crafting_accelerator>, <threng:big_assembler:0>]]);
recipes.addShaped("W4 MA Coprocessor 64x",
<threng:big_assembler:4> * 4,
[[<threng:big_assembler:0>, <appliedenergistics2:molecular_assembler>, <threng:big_assembler:0>],
[<appliedenergistics2:part:16>, <threng:material:13>, <appliedenergistics2:part:16>],
[<threng:big_assembler:0>, <appliedenergistics2:crafting_accelerator>, <threng:big_assembler:0>]]);

# Speculative Processor - infusion forces the 64x speculation to come true
Infusion.registerRecipe("w4_speculative_processor", "INFUSION",
<threng:material:14>, 25,
[<aspect:cognitio> * 40, <aspect:vitium> * 20, <aspect:perditio> * 20, <aspect:praecantatio> * 20],
<threng:material:13>,
[<threng:material:6>, <threng:material:4>, <threng:material:6>,
<threng:material:4>, <threng:material:13>, <threng:material:4>,
<threng:material:6>, <threng:material:4>, <threng:material:6>] as IIngredient[]);

# ...or infused around a rainbow stone instead of the 64x speculation core
Infusion.registerRecipe("w4_speculative_processor1", "INFUSION",
<threng:material:14>, 25,
[<aspect:cognitio> * 40, <aspect:vitium> * 20, <aspect:perditio> * 20, <aspect:praecantatio> * 20],
<extrautils2:decorativesolid:8>,
[<threng:material:6>, <threng:material:4>, <threng:material:6>,
<threng:material:4>, <threng:material:13>, <threng:material:4>,
<threng:material:6>, <threng:material:4>, <threng:material:6>] as IIngredient[]);

# The lotteries moved to week4/week4_gambling.zs: throw a speculation
# core on the ground and DETONATE it. In-world, server-side RNG, no
# crafting grid, no re-rolls.
