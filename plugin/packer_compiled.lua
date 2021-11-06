-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/yadunut/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/yadunut/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/yadunut/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/yadunut/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yadunut/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  coq_nvim = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/coq_nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/monokai.nvim"
  },
  ["nlua.nvim"] = {
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17plugins.nlua\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/opt/nlua.nvim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21plugins.nvim-cmp\frequire\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "nlua.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2ˆ\2\0\0\4\0\14\0\0214\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0003\1\6\0003\2\a\0:\2\b\1>\0\2\0014\0\3\0%\1\t\0>\0\2\0027\0\n\0%\1\v\0%\2\f\0%\3\r\0>\0\4\1G\0\1\0\28<cmd>NvimTreeToggle<cr>\15<leader>tt\6n\bmap\nutils\24update_focused_file\1\0\2\15update_cwd\2\venable\2\1\0\2\15update_cwd\2\15auto_close\2\nsetup\14nvim-tree\frequire\30nvim_tree_respect_buf_cwd\6g\bvim\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28plugins.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\1\2ˆ\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\20~/org/inbox.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\1\2‰\1\0\0\2\0\a\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\0014\0\0\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0>\0\2\1G\0\1\0\rprojects\19load_extension\14telescope\1\0\1\17silent_chdir\1\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\2‡\1\0\0\4\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0%\2\4\0%\3\5\0>\0\4\0014\0\0\0%\1\6\0>\0\2\0027\0\a\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\27<cmd>TroubleToggle<cr>\15<leader>tr\6n\bmap\nutils\frequire\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  vim = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\24colorscheme dracula\bcmd\bvim\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/yadunut/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\28plugins.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21plugins.nvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2ˆ\2\0\0\4\0\14\0\0214\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0003\1\6\0003\2\a\0:\2\b\1>\0\2\0014\0\3\0%\1\t\0>\0\2\0027\0\n\0%\1\v\0%\2\f\0%\3\r\0>\0\4\1G\0\1\0\28<cmd>NvimTreeToggle<cr>\15<leader>tt\6n\bmap\nutils\24update_focused_file\1\0\2\15update_cwd\2\venable\2\1\0\2\15update_cwd\2\15auto_close\2\nsetup\14nvim-tree\frequire\30nvim_tree_respect_buf_cwd\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\1\2‡\1\0\0\4\0\b\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0%\2\4\0%\3\5\0>\0\4\0014\0\0\0%\1\6\0>\0\2\0027\0\a\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\27<cmd>TroubleToggle<cr>\15<leader>tr\6n\bmap\nutils\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: vim
time([[Config for vim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\24colorscheme dracula\bcmd\bvim\0", "config", "vim")
time([[Config for vim]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\1\2ˆ\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\20~/org/inbox.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\1\2‰\1\0\0\2\0\a\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\0014\0\0\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0>\0\2\1G\0\1\0\rprojects\19load_extension\14telescope\1\0\1\17silent_chdir\1\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nlua.nvim ]]

-- Config for: nlua.nvim
try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17plugins.nlua\frequire\0", "config", "nlua.nvim")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
