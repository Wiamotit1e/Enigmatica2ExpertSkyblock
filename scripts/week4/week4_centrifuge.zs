#priority -2

import mods.nuclearcraft.centrifuge;

# ######################################################################
#
# week4_centrifuge.zs
#
# Week 4 air chain, step 2: air -> nitrogen + oxygen (+ helium).
#
# Two routes for the same bucket of compressed air:
#
#   Direct:  1000 mB ic2air     -> 400 N  + 100 O
#   Detour:  1000 mB liquid_air -> 16000 N + 4000 O + 400 He
#
# liquid_air condenses 20:1 from ic2air (week4_supercooler.zs), so the
# detour turns the same 20000 mB of compressed air into 16000 N +
# 4000 O + 400 He: exactly 2x the nitrogen/oxygen of the direct route,
# plus helium. The trade: one extra Supercooler pass, and a slower
# (4.0x vs 2.0x) and hungrier (4.0x vs 1.4x power) centrifuge run.
#
# Outputs are the pack's own gases: oxygen feeds rocket fuel
# (AdvancedRocketry.zs), nitrogen is otherwise only obtainable from
# Nitrogen Collectors (Tooltips.zs), and helium appears nowhere else
# in the pack scripts.
#
# Loads at #priority -2 with the rest of week4, after the pack's
# NuclearCraft.zs (#priority 0), so nothing can overwrite it.
#
# ######################################################################

# Direct route: compressed air -> nitrogen + oxygen (cheap, no helium)
mods.nuclearcraft.centrifuge.addRecipe([
    <liquid:ic2air> * 1000,
    <liquid:nitrogen> * 400,
    <liquid:oxygen> * 100,
    null,
    null,
    2.0,    # time multiplier
    1.4     # power multiplier
]);

# Detour: liquid air -> 2x the gases + helium (see header for the math)
mods.nuclearcraft.centrifuge.addRecipe([
    <liquid:liquid_air> * 1000,
    <liquid:nitrogen> * 16000,
    <liquid:oxygen> * 4000,
    <liquid:helium> * 400,
    null,
    4.0,    # time multiplier
    4.0     # power multiplier
]);
