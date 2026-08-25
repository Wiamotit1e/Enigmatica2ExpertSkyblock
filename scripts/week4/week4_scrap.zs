#priority -2
#modloaded nuclearcraft

# ######################################################################
#
# week4_scrap.zs
#
# The Scrap Refining Line - mountains of waste become veins of ore.
# Cobblestone melts in the NC Melter into Molten Scrap, which the NC
# Crystallizer presses into a Scrap Crystal. The crystal is then
# DETONATED (see week4_gambling.zs) - the blast sorts the waste into
# whatever mineral veins were hiding inside it.
#
# ######################################################################

# Stage 1 - the Melter reduces sixteen cobblestone to a bucket of melt
mods.nuclearcraft.melter.addRecipe(<minecraft:cobblestone> * 16, <liquid:molten_scrap> * 1000);

# Stage 2 - the Crystallizer presses a bucket of melt into a crystal
mods.nuclearcraft.crystallizer.addRecipe(<liquid:molten_scrap> * 1000, <contenttweaker:scrap_crystal>);
