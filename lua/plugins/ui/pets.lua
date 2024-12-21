return {
	"giusgad/pets.nvim",
	cmd = {
		"PetsNew",
		"PetsNewCustom",
		"PetsList",
		"PetsKill",
		"PetsKillAll",
		"PetsRemove",
		"PetsRemoveAll",
		"PetsPauseToggle",
		"PetsHideToggle",
		"PetsIdleToggle",
		"PetsSleepToggle",
	},
	dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
	opts = {
		row = 7,
	},
}
