require('maps')
require('settings')
require('plugs')
require('plug_settings')
require('lsp_config')

local has = vim.fn.has
local is_mac = has "macunix"

if is_mac then
  require('macos')
end
