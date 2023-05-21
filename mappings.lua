local utils = require "astronvim.utils"
local is_available = utils.is_available

local maps = { n = {} }

-- Buffer Commands
maps.n["<leader>b"] = { name = "Buffers" }
maps.n["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" }
maps.n["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
}

-- maps.n["<leader>bc"] =
--   { function() require("astronvim.utils.buffer").close_all(true) end, desc = "Close all buffers except current" }
-- maps.n["<leader>bC"] = { function() require("astronvim.utils.buffer").close_all() end, desc = "Close all buffers" }

-- Top-level Commands
maps.n["<leader>c"] = {
  function()
    local bufs = vim.fn.getbufinfo { buflisted = true }
    require("astronvim.utils.buffer").close(0)
    if is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
  end,
  desc = "Close buffer"
}
maps.n["<leader>bC"] = {
  function()
    require("astronvim.utils.buffer").close_all()
    if is_available "alpha-nvim" then require("alpha").start(true) end
  end,
  desc = "Close all buffers"
}

if is_available "toggleterm.nvim" then
  maps.n["<leader>td"] = { function() utils.toggle_term_cmd "DOCKER_HOST=unix:///Users/e/.colima/default/docker.sock lazydocker" end, desc = "ToggleTerm lazydocker" }
  maps.n["<leader>gt"] = { function() utils.toggle_term_cmd "git log --all --graph --decorate --oneline" end, desc = "Git tree" }
end

-- Golang Commands
if is_available "gopher.nvim" then
  maps.n["<leader>G"] = {  name = " Go" }
  maps.n["<leader>G/"] = { "<cmd>GoCmt<cr>", desc = "Generate doc comment" }
  maps.n["<leader>Gm"] = { "<cmd>GoMod<cr>", desc = "Go mod" }
  maps.n["<leader>Gg"] = { "<cmd>GoGet<cr>", desc = "Go get" }
  maps.n["<leader>Gi"] = { "<cmd>GoImpl<cr>", desc = "Implement interface" }
  maps.n["<leader>GI"] = { "<cmd>GoInstallDeps<cr>", desc = "Implement interface" }
  maps.n["<leader>Ge"] = { "<cmd>GoIfErr<cr>", desc = "Generate if err" }
  maps.n["<leader>Gr"] = { "<cmd>GoTagRm<cr>", desc = "Remove struct tag" }
  maps.n["<leader>Ga"] = { "<cmd>GoTagAdd<cr>", desc = "Add struct tag" }
  maps.n["<leader>Gt"] = { "<cmd>GoTestsAdd -template testify<cr>", desc = "Generate testify" }
end

-- Rust Commands
if is_available "rust-tools.nvim" then
  maps.n["<leader>r"] = { name = " Rust" }
  maps.n["<leader>rr"] = { "<cmd>RustRunnables<cr>", desc = "Run targets" }
  maps.n["<leader>rd"] = { "<cmd>RustDebuggables<cr>", desc = "Debug targets" }
  maps.n["<leader>rc"] = { "<cmd>RustOpenCargo<cr>", desc = "Open cargo.toml" }
  maps.n["<leader>re"] = { "<cmd>RustExpandMacro<cr>", desc = "Expand macro under cursor" }
  maps.n["<leader>rp"] = { "<cmd>RustParentModule<cr>", desc = "Go to parent module" }
  maps.n["<leader>ro"] = { "<cmd>RustOpenExternalDocs<cr>", desc = "Open external docs" }
end

-- Typescript Commands
if is_available "typescript.nvim" then
  maps.n["<leader>T"] = { name = " Typescript" }
  maps.n["<leader>Ta"] = { "<cmd>TypescriptAddMissingImports<cr>", desc = "Add missing imports" }
  maps.n["<leader>Td"] = { "<cmd>TypescriptGoToSourceDefinition<cr>", desc = "Go to source definition" }
  maps.n["<leader>Tf"] = { "<cmd>TypescriptFixAll<cr>", desc = "Fix all" }
  maps.n["<leader>To"] = { "<cmd>TypescriptOrganizeImports<cr>", desc = "Organize imports" }
  maps.n["<leader>Tr"] = { "<cmd>TypescriptRenameFile<cr>", desc = "Rename file" }
  maps.n["<leader>Tu"] = { "<cmd>TypescriptRemoveUnused<cr>", desc = "Remove unused variables" }
end

return maps

-- ORIGINAL CONTENT BELOW

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
-- return {
  -- -- first key is the mode
  -- n = {
  --   -- second key is the lefthand side of the map
  --   -- mappings seen under group name "Buffer"
  --   ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
  --   ["<leader>bD"] = {
  --     function()
  --       require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
  --     end,
  --     desc = "Pick to close",
  --   },
  --   -- tables with the `name` key will be registered with which-key if it's installed
  --   -- this is useful for naming menus
  --   ["<leader>b"] = { name = "Buffers" },
  --   -- quick save
  --   -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  --   ["<leader>c"] = {
  --     function()
  --       local bufs = vim.fn.getbufinfo { buflisted = true }
  --       require("astronvim.utils.buffer").close(0)
  --       if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
  --     end,
  --     desc = "Close buffer"
  --   },
  -- },
  -- t = {
  --   -- setting a mapping to false will disable it
  --   -- ["<esc>"] = false,
  -- },
-- }
