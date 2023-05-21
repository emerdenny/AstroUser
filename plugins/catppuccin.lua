return {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    require("catppuccin").setup({
      -- flavour = "latte"
      flavour = "frappe"
      -- flavour = "macchiato"
      -- flavour = "mocha"
    })
  end
}
