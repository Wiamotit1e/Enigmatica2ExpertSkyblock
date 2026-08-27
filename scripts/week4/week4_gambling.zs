#priority -2
#modloaded threng inworldcrafting

import mods.inworldcrafting.ExplosionCrafting;

# ######################################################################
#
# week4_gambling.zs
#
# The Divination Blast. Throw a speculation core on the ground and
# detonate it - TNT, creeper, anything that explodes. The blast tears
# the future open: every prize rolls its own chance (sums to 100, so
# expect about one reward per core - sometimes nothing, sometimes a
# handful). Server-side RNG, no crafting grid, no player context, no
# re-rolls. Detonate cores one at a time: a whole stack just burns.
#
# ######################################################################

# ########################
# 64x Speculation Core pool
# ########################

ExplosionCrafting.explodeItemRecipe(<minecraft:diamond_block> * 4, <threng:material:13>, 24);
ExplosionCrafting.explodeItemRecipe(<environmentaltech:erodium> * 2, <threng:material:13>, 20);
ExplosionCrafting.explodeItemRecipe(<thaumcraft:void_seed> * 4, <threng:material:13>, 15);
ExplosionCrafting.explodeItemRecipe(<minecraft:nether_star>, <threng:material:13>, 10);
ExplosionCrafting.explodeItemRecipe(<environmentaltech:litherite_crystal> * 2, <threng:material:13>, 8);
ExplosionCrafting.explodeItemRecipe(<avaritia:resource:3> * 8, <threng:material:13>, 7);
ExplosionCrafting.explodeItemRecipe(<botania:manaresource:5>, <threng:material:13>, 6);
ExplosionCrafting.explodeItemRecipe(<botania:manaresource:1> * 4, <threng:material:13>, 5);
ExplosionCrafting.explodeItemRecipe(<astralsorcery:itemcraftingcomponent:4> * 4, <threng:material:13>, 3);
ExplosionCrafting.explodeItemRecipe(<draconicevolution:draconium_ingot> * 8, <threng:material:13>, 1);
ExplosionCrafting.explodeItemRecipe(<draconicevolution:dragon_heart>, <threng:material:13>, 1);

# ########################
# Speculative Processor pool
# ########################

ExplosionCrafting.explodeItemRecipe(<draconicevolution:dragon_heart>, <threng:material:14>, 10);
ExplosionCrafting.explodeItemRecipe(<botania:manaresource:5> * 2, <threng:material:14>, 25);
ExplosionCrafting.explodeItemRecipe(<minecraft:nether_star> * 2, <threng:material:14>, 20);
ExplosionCrafting.explodeItemRecipe(<avaritia:resource:3> * 16, <threng:material:14>, 13);
ExplosionCrafting.explodeItemRecipe(<thaumcraft:void_seed> * 8, <threng:material:14>, 9);
ExplosionCrafting.explodeItemRecipe(<environmentaltech:pladium> * 2, <threng:material:14>, 8);
ExplosionCrafting.explodeItemRecipe(<minecraft:dragon_egg>, <threng:material:14>, 6);
ExplosionCrafting.explodeItemRecipe(<environmentaltech:ionite>, <threng:material:14>, 5);
ExplosionCrafting.explodeItemRecipe(<astralsorcery:itemcraftingcomponent:4> * 16, <threng:material:14>, 2);
ExplosionCrafting.explodeItemRecipe(<draconicevolution:chaos_shard>, <threng:material:14>, 1);
ExplosionCrafting.explodeItemRecipe(<randomthings:obsidianskull>, <threng:material:14>, 1);

# Ritual flavor
<threng:material:13>.addTooltip("It explodes into futures. Detonate with care.");
<threng:material:14>.addTooltip("It dreams of futures that might be. Detonate with care.");