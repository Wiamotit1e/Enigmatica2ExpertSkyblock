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

buildItem("coarse_mechanism");   # Crude Mechanism, early game
buildItem("circuit_substrate");  # Machine Circuit Substrate, mid game
buildItem("thermal_prism");      # Thermal Prism, mid-late game
buildItem("fusion_catalyst");    # Fusion Catalyst, late game
