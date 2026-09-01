#modloaded astralsorcery

import mods.astralsorcery.Altar;
import crafttweaker.item.IIngredient;

# ######################################################################
#
# week4_starcharts.zs
#
# Constellation papers without the Iridescent Altar. Vanilla Astral
# Sorcery only hands them out from ancient-shrine chests - which do
# not exist in a void world - or brews them at the T4 Iridescent Altar
# (parchment + feather + ink + 2 starmetal dust, plus each
# constellation's own signature items). Needing T4 to get the first
# paper is backwards: papers are what you use to discover the dim
# constellations, focus altars and attune crystals in the first place.
#
# Every constellation - 5 bright, 7 dim and the 4 hidden ones - gets a
# plain crafting recipe that keeps the altar brew's "drawing" layout
# with the starmetal dust swapped for aquamarine:
#
#              feather
#   aquamarine  parchment  aquamarine
#              <ink dye>
#
# The ink slot is what sets the 16 recipes apart: a crafting table
# matches on inputs only, so identical grids would leave just the
# first-registered paper (aevitas) craftable. Each constellation draws
# with the dye closest to its own colour (ConstellationRegistry in the
# astral sorcery jar):
#
#   aevitas green       armara white        discidia red       evorsio black
#   vicio cyan          lucerna yellow      mineralis brown    octans lightBlue
#   bootes magenta      fornax orange       horologium purple  pelotrio pink
#   gelu silver         ulteria blue        alcara gray        vorux lime
#
# The Iridescent brews are removed afterwards so each paper exists
# exactly once. They are removed by registry name -
# "astralsorcery:shaped/internal/altar/constellationpaper/<name>" is
# how the mod registers them, and Altar.removeAltarRecipe(String) is
# the modern API (the old remove-by-output call logs two error lines
# per invocation).
#
# ######################################################################

# ########################
# Cheap star charts - the drawing table on a plain crafting grid
# ########################

val constellations as string[] = [
    "aevitas", "armara", "discidia", "evorsio", "vicio",
    "lucerna", "mineralis", "octans", "bootes", "fornax", "horologium", "pelotrio",
    "gelu", "ulteria", "alcara", "vorux"
];

# Ink dye per constellation, positional match with the list above.
val inks as IIngredient[] = [
    <ore:dyeGreen>, <ore:dyeWhite>, <ore:dyeRed>, <ore:dyeBlack>,
    <ore:dyeCyan>, <ore:dyeYellow>, <ore:dyeBrown>, <ore:dyeLightBlue>,
    <ore:dyeMagenta>, <ore:dyeOrange>, <ore:dyePurple>, <ore:dyePink>,
    <ore:dyeSilver>, <ore:dyeBlue>, <ore:dyeGray>, <ore:dyeLime>
];

for i, name in constellations {
    val path as string = "astralsorcery.constellation." ~ name;
    recipes.addShaped("W4 Star Chart " ~ name,
        <astralsorcery:itemconstellationpaper>.withTag({astralsorcery: {constellationName: path}}),
        [[null, <minecraft:feather>, null],
        [<ore:gemAquamarine>, <astralsorcery:itemcraftingcomponent:5>, <ore:gemAquamarine>],
        [null, inks[i], null]]);
}

# ########################
# Retire the Iridescent Altar brews (level 3 = trait altar)
# ########################

for name in constellations {
    Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/constellationpaper/" ~ name);
}
