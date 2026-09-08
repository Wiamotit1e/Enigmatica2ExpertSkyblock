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
buildItem("etched_quartz_glass");            # Etched Quartz Glass, HF-etched substrate for advanced storage cells
buildItem("fusion_catalyst");                # Fusion Catalyst, late game
buildItem("titanium_sponge");                 # Titanium Sponge, Kroll-reduced titanium intermediate
buildItem("entropy_ash");                     # Entropy Ash, trash ground into disorder
buildItem("entropy_core");                    # Entropy Core, compressed and refined disorder
buildItem("pride_flag");                      # Pride Flag, the whole pack in one rainbow
buildItem("pride_fuel");                      # Pride Fuel, UU-matter pressed into rainbow
buildItem("depleted_pride_fuel");             # Depleted Pride Fuel, burned-out pride that still dreams
buildItem("aro_pride_flag");                  # Aro Pride Flag, mid game: an empowerer presses a white crystal between four heads
buildItem("aro_pride_fuel");                  # Aro Pride Fuel, mid game: two LEU-235 blocks and two MOX cells pressed around the flag
buildItem("depleted_aro_pride_fuel");         # Depleted Aro Pride Fuel, spent fuel that cracks back into its parts
buildItem("pan_pride_flag");                  # Pan Pride Flag, mid game: four pancakes baked into flags on a rune altar
buildItem("gay_men_pride_flag");              # Gay Men Pride Flag, the altar trap: an ethereal slate left in the blood altar is gone before you notice
buildFluid("crude_life_essence", 0x752121);   # Crude Life Essence, stage 1 of the essence chain
buildFluid("refined_life_essence", 0xC22B2B); # Refined Life Essence, stage 2 of the essence chain
buildFluid("titanium_tetrachloride", 0xE8D9A3); # Titanium Tetrachloride, chlorinated rutile
buildFluid("uu_solution", 0xA06BDE);            # UU Solution, dilithium dissolved in liquid UU
buildFluid("liquid_air", 0xA9D0F5);           # Liquid Air, week4 air-chain hub: supercooler -> centrifuge (week4_supercooler.zs / week4_centrifuge.zs)