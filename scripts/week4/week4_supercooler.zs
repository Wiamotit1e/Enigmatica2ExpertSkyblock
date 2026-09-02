#priority -2

import mods.nuclearcraft.supercooler;

# ######################################################################
#
# week4_supercooler.zs
#
# Week 4 air chain, step 1: compressed air -> liquid air.
#
# The stock Supercooler only chills reactor coolants (helium, nitrogen,
# hydrogen), so in a skyblock it sits idle until the reactor age. This
# recipe gives it early work: condense 20 mB of IC2 compressed air into
# 1 mB of liquid_air (the custom fluid from week4_custom_items.zs).
#
# The liquid air then goes to week4_centrifuge.zs, where it expands
# into 2x the nitrogen/oxygen of centrifuging the air directly, plus
# helium - the payoff for the extra machine pass.
#
# Loads at #priority -2 with the rest of week4, after the pack's
# NuclearCraft.zs (#priority 0), so nothing can overwrite it.
#
# ######################################################################

# 💧 1000 mB compressed air -> 50 mB liquid air (20:1 condensation)
mods.nuclearcraft.supercooler.addRecipe([
    <liquid:ic2air> * 1000,
    <liquid:liquid_air> * 50
]);
