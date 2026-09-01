# ######################################################################
#
# week4_crucible.zs
#
# Crucible steel: a thaumic route to the TE Steel Ingot
# (thermalfoundation:material:160). Iron goes in; ignis tempers it,
# potentia hardens it. A magic-side answer to the furnace line for
# players already standing over a crucible.
#
# ######################################################################

import mods.thaumcraft.Crucible;

# Steel Ingot - iron + 10 ignis + 10 potentia
mods.thaumcraft.Crucible.registerRecipe(
    "W4 Crucible Steel",
    "",
    <thermalfoundation:material:160>,
    <minecraft:iron_ingot>,
    [<aspect:ignis> * 10, <aspect:potentia> * 10]
);
