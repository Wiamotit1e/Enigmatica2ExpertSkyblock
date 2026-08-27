#loader contenttweaker
#priority 8000

# ######################################################################
#
# Week 4 custom intermediate materials
#
# Loads after VanillaFactory.zs (#priority 9000) so the
# "ContentTweaker" creative tab exists before registration.
#
# ######################################################################

function buildItem(name as string) {
	val item = mods.contenttweaker.VanillaFactory.createItem(name);
	item.setCreativeTab(<creativetab:other>);
	item.register();
}

function buildFluid(name as string, color as int) {
	val fluid = mods.contenttweaker.VanillaFactory.createFluid(name, color);
	fluid.register();
}

buildItem("coarse_mechanism");               # Crude Mechanism, early game
buildItem("circuit_substrate");              # Machine Circuit Substrate, mid game
buildItem("thermal_prism");                  # Thermal Prism, mid-late game
buildItem("fusion_catalyst");                # Fusion Catalyst, late game
buildItem("titanium_sponge");                 # Titanium Sponge, Kroll-reduced titanium intermediate
buildItem("entropy_ash");                     # Entropy Ash, trash ground into disorder
buildItem("entropy_core");                    # Entropy Core, compressed and refined disorder
buildFluid("crude_life_essence", 0x752121);   # Crude Life Essence, stage 1 of the essence chain
buildFluid("refined_life_essence", 0xC22B2B); # Refined Life Essence, stage 2 of the essence chain
buildFluid("titanium_tetrachloride", 0xE8D9A3); # Titanium Tetrachloride, chlorinated rutile
buildFluid("uu_solution", 0xA06BDE);            # UU Solution, dilithium dissolved in liquid UU