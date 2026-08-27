#priority -2
#modloaded libvulpes nuclearcraft mekanism

# ######################################################################
#
# week4_titanium.zs
#
# The titanium rework. The old one-step
# multiblock recipe (magnesium + salt + carbon + chlorine -> titanium)
# is gone. The full Kroll line:
#
#   rutile ore -> (Macerator) -> crushed -> (Ore Washer) -> purified
#   -> (NC Dissolver + liquid chlorine) -> titanium tetrachloride x2
#   -> (Advanced Metallurgic Fabricator + magnesium) -> titanium sponge
#   -> (furnace) -> titanium ingot
#
# The chemistry only accepts JAOPCA purified crushed titanium: titanium
# dust has too many alternative sources to anchor the 8x yield, so dust
# is a material, not a feedstock.
#
# ######################################################################

# Rutile ore is synthesized on the Advanced Metallurgic Fabricator
# (magnesium ore + salt + carbon plate + liquid chlorine), the same
# machine that later performs the Kroll reduction - the titanium line
# begins and ends on the metallurgy multiblock:
# MM (rutile synth) -> crush -> purify -> chlorinate -> MM (Kroll) -> smelt

# Every crusher except the IC2 Macerator grinds rutile straight into
# two titanium dusts. The Macerator keeps JAOPCA's recipe (rutile ->
# crushed) so the purified-crushed IC2 chain stays intact.
scripts.process.crush(<libvulpes:ore0:8>, <libvulpes:productdust:7> * 2, "Except: Macerator");

# Chlorination: one purified crushed titanium meets liquid chlorine in
# the NC Dissolver and comes out as two buckets of titanium
# tetrachloride. Four batches of Kroll reduction run off each purified.
mods.nuclearcraft.dissolver.addRecipe(<jaopca:item_crushedpurifiedtitanium>, <liquid:liquidchlorine> * 1000, <liquid:titanium_tetrachloride> * 1000);

# Kroll reduction: the tetrachloride meets magnesium on the Advanced
# Metallurgic Fabricator (see modular_machinery/
# advanced_metallurgic_fabricator.zs) and becomes titanium sponge

# And only the sponge smelts into titanium (the libvulpes ingot, not
# the advancedrocketry productingot, which is Titanium Aluminide)
furnace.addRecipe(<libvulpes:productingot:7>, <contenttweaker:titanium_sponge>, 0.7);
