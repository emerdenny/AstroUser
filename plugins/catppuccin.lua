return {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha"
    })
  end
}
