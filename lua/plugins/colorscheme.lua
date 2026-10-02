return {
	{"marko-cerovac/material.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("material").setup({
			flavor = "oceanic"
		})
	end
},
}

