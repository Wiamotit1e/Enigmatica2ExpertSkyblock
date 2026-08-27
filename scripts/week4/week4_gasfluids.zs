#priority -2
#modloaded industrialforegoing

import mods.industrialforegoing.FluidDictionary;

# ######################################################################
#
# week4_gasfluids.zs
#
# The gas-fluid bridge. Mekanism stores ethene, deuterium and tritium
# as GASES; NuclearCraft stores the same substances as FLUIDS. The
# two registries never meet, so the same molecule was two different
# materials depending on which mod made it.
#
# Mekanism registers a liquid form for each of the three (liquidethene,
# liquiddeuterium, liquidtritium) that its Rotary Condensentrator
# converts natively, gas <-> liquid. The IF Fluid Dictionary Converter
# bridges the Mek liquids to the NC fluids at 1:1 in both directions:
#
#   NC fluid <-> (Fluid Dictionary Converter) <-> Mek liquid
#            <-> (Rotary Condensentrator) <-> Mek gas
#
# Deliberately string-based: the fluids resolve at runtime inside the
# converter tile, so the pairs work no matter which mod registers
# which name first.
#
# ######################################################################

# Deuterium
FluidDictionary.add("liquiddeuterium", "deuterium", 1.0);
FluidDictionary.add("deuterium", "liquiddeuterium", 1.0);

# Tritium
FluidDictionary.add("liquidtritium", "tritium", 1.0);
FluidDictionary.add("tritium", "liquidtritium", 1.0);

# Ethylene
FluidDictionary.add("liquidethene", "ethene", 1.0);
FluidDictionary.add("ethene", "liquidethene", 1.0);
