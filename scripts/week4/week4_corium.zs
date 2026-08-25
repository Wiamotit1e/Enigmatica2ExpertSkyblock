#priority -2
#modloaded nuclearcraft thermalexpansion industrialforegoing randomthings forestry

import mods.thermalexpansion.Transposer;
import mods.industrialforegoing.FluidDictionary;
import mods.forestry.Carpenter;

# ######################################################################
#
# week4_corium.zs
#
# Corium is the pack's rite of passage into the fusion age. Melt a
# fission reactor on purpose, pump the pool, and spend the buckets:
#
# - the NC Fusion Core must be QUENCHED in a corium bath at the
#   Carpenter. Every fusion line in the pack consumes that core (NC
#   fusion, the Mekanism fusion reactor, the DE fusion crafting core),
#   so one deliberate meltdown sits on every end-game road;
# - the Fluid Transposer brews the transmutations below, one bucket
#   of corium per craft, consumed for real;
# - the same machine bathes an empty Time in a Bottle in the melt:
#   time dilates inside corium, so the bottle comes out holding half
#   an hour;
# - the Fluid Dictionary Converter distills the melt back into molten
#   salt reactor fuel - meltdowns become a reprocessing step.
#
# ######################################################################

# ########################
# The Rite of Quenching
# ########################

# The fusion core is forged in the heart of a dying fission reactor
recipes.remove(<nuclearcraft:fusion_core>);
Carpenter.addRecipe(<nuclearcraft:fusion_core>,
[[<nuclearcraft:part:6>, <botania:manaresource:5>, <nuclearcraft:part:6>],
[<nuclearcraft:gem:1>, <nuclearcraft:fission_block>, <nuclearcraft:gem:1>],
[<nuclearcraft:part:6>, <nuclearcraft:gem:1>, <nuclearcraft:part:6>]],
40, <liquid:corium> * 10000);

# ########################
# The Brews
# ########################

# A void seed germinates in the melt into a void metal ingot
Transposer.addFillRecipe(<thaumcraft:ingot:1>, <thaumcraft:void_seed>, <liquid:corium> * 1000, 250000);

# Four ender pearls soak up the melt and become an infused pearl
Transposer.addFillRecipe(<rftools:infused_enderpearl>, <minecraft:ender_pearl> * 4, <liquid:corium> * 1000, 250000);

# ########################
# The Corium Paradox
# ########################

# Time dilates inside the melt: an empty bottle bathed in corium comes
# out holding half an hour
Transposer.addFillRecipe(<randomthings:timeinabottle>.withTag({timeData: {storedTime: 36000}}),
<randomthings:timeinabottle>, <liquid:corium> * 1000, 250000);

# ########################
# The Corium Fuel Cycle
# ########################

# Distill the melt back into molten salt reactor fuel
FluidDictionary.add("corium", "uranium_235_fluoride_flibe", 1.0);

# And the premium: plutonium, no breeder reactor required - four
# buckets of corium per bucket of the good stuff
FluidDictionary.add("corium", "plutonium_239_fluoride_flibe", 0.25);
