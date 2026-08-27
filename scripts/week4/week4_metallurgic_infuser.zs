#priority -2
#modloaded mekanism plustic thermalfoundation

import mods.mekanism.infuser;

# ######################################################################
#
# week4_metallurgic_infuser.zs
#
# The Metallurgic Infuser gains four new infusion routes. No recipe
# is removed - the pack's defaults stay, these are alternative
# routes:
#
# - steel is pricier than iron but infuses 4x enriched alloy per
#   batch: redstone-efficient bulk production for the mid game;
# - osmiridium, the late-game alloy, shortcuts the basic control
#   circuit line (4 per batch): a sink for the metal, not a gate;
# - platinum and mana infused ingots replace enriched alloy as the
#   diamond-route base for reinforced alloy - the mana route pays
#   out 2x: magic remembers alloys twice as well as machines do.
#
# ######################################################################

infuser.addRecipe("REDSTONE", 20, <ore:ingotSteel>, <mekanism:enrichedalloy> * 4);
infuser.addRecipe("REDSTONE", 20, <plustic:osmiridiumingot>, <mekanism:controlcircuit> * 4);
infuser.addRecipe("DIAMOND", 10, <ore:ingotPlatinum>, <mekanism:reinforcedalloy>);
infuser.addRecipe("DIAMOND", 10, <thermalfoundation:material:136>, <mekanism:reinforcedalloy> * 2);
