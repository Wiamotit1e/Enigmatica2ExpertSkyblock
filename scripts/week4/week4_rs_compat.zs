#priority -2
#modloaded refinedstorage

# ######################################################################
#
# week4_rs_compat.zs
#
# Refined Storage controller remake, moved out of week4_recipes.zs.
# Refined Storage is not part of base E2ES, so this file only loads
# when it is installed. Bracket handlers resolve at parse time, so
# they must live behind #modloaded rather than a runtime
# isNull(itemUtils.getItem(...)) guard.
#
# ######################################################################

recipes.remove(<refinedstorage:controller>);
recipes.addShaped("W4 RS Controller",
<refinedstorage:controller>,
[[<appliedenergistics2:smooth_sky_stone_block>, <contenttweaker:circuit_substrate>, <appliedenergistics2:smooth_sky_stone_block>],
[<appliedenergistics2:fluix_block>, <appliedenergistics2:energy_acceptor>, <appliedenergistics2:fluix_block>],
[<refinedstorage:interface>, <ore:pearlFluix>, <refinedstorage:interface>]]);
