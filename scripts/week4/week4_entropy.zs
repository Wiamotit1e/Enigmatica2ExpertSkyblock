#priority -2

import mods.botania.RuneAltar;
import mods.thaumcraft.Infusion;
import crafttweaker.item.IIngredient;

# ######################################################################
#
# week4_entropy.zs
#
# The Entropy Engine - and it runs on magic. Void seeds, the purest
# disorder the pack knows, dissolve on the Botania Runic Altar into
# Entropy Ash. The ash then binds with ender pearls around a void
# metal core in an infusion into an Entropy Core, which stabilizes
# the Draconic Core: the highest order is only held together by the
# purest disorder.
#
# ######################################################################

# A void seed, mana dust, a s'more and coal dust dissolve on the
# runic altar into entropy ash - the seed is the disorder, the rest
# is the ritual that grinds it fine
RuneAltar.addRecipe(<contenttweaker:entropy_ash> * 4,
[<thaumcraft:void_seed>, <thermalfoundation:material:1028>, <nuclearcraft:smore>, <ore:dustCoal>] as IIngredient[],
5000);

# The ash binds around a void metal core, held by infused pearls:
# disorder given a body
Infusion.registerRecipe("w4_entropy_core", "INFUSION",
<contenttweaker:entropy_core>, 12,
[<aspect:vitium> * 30, <aspect:perditio> * 30, <aspect:praecantatio> * 20],
<thaumcraft:ingot:1>,
[<contenttweaker:entropy_ash>, <contenttweaker:entropy_ash>, <contenttweaker:entropy_ash>, <contenttweaker:entropy_ash>,
<rftools:infused_enderpearl>, <rftools:infused_enderpearl>, <rftools:infused_enderpearl>, <rftools:infused_enderpearl>] as IIngredient[]);

<contenttweaker:entropy_ash>.addTooltip("Disorder, ground fine.");
<contenttweaker:entropy_core>.addTooltip("Order is only stable on a foundation of disorder.");
