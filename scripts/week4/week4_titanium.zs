#priority -2
#modloaded libvulpes nuclearcraft mekanism

# ######################################################################
#
# week4_titanium.zs
#
# The titanium rework. No more smelting rutile straight into titanium,
# no more crafting the ingot from nuggets, and the old one-step
# multiblock recipe (magnesium + salt + carbon + chlorine -> titanium)
# is gone. The full Kroll line:
#
# 9 nuggets -> rutile ore -> (crush) -> rutile dust
#   -> (NC Dissolver + liquid chlorine) -> titanium tetrachloride
#   -> (Advanced Metallurgic Fabricator + magnesium) -> titanium sponge
#   -> (furnace) -> titanium ingot
#
# ######################################################################

# The old direct smelt dies
furnace.remove(<libvulpes:ore0:8>);

# The old ingot crafts die (nugget compression, block decompression)
recipes.remove(<advancedrocketry:productingot:0>);

# Rutile ore is synthesized on the Advanced Metallurgic Fabricator
# (magnesium ore + salt + carbon plate + liquid chlorine), the same
# machine that later performs the Kroll reduction - the titanium line
# begins and ends on the metallurgy multiblock:
# MM (rutile synth) -> crush -> chlorinate -> MM (Kroll) -> smelt

# Rutile ore must be crushed: any crusher in the pack grinds it to dust
scripts.process.crush(<libvulpes:ore0:8>, <libvulpes:productdust:7> * 2);

# Chlorination: two rutile dusts meet liquid chlorine in the NC
# Dissolver and come out as titanium tetrachloride
mods.nuclearcraft.dissolver.addRecipe(<libvulpes:productdust:7> * 2, <liquid:liquidchlorine> * 500, <liquid:titanium_tetrachloride> * 500);

# Kroll reduction: the tetrachloride meets magnesium on the Advanced
# Metallurgic Fabricator (see modular_machinery/
# advanced_metallurgic_fabricator.zs) and becomes titanium sponge

# And only the sponge smelts into titanium
furnace.addRecipe(<advancedrocketry:productingot:0>, <contenttweaker:titanium_sponge>, 0.7);

# The smeltery loses every titanium melt (PlusTiC's rutile ore and
# titanium dust melts included), then regains exactly one: ingots may
# still melt for casting, but no ore or dust shortcut remains.
mods.tconstruct.Melting.removeRecipe(<liquid:titanium>);
mods.tconstruct.Melting.addRecipe(<liquid:titanium> * 144, <ore:ingotTitanium>);
