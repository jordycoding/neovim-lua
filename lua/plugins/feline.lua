local ctp_feline = require('catppuccin.groups.integrations.feline')
local navic = require("nvim-navic")

local components = {
    active = {},
    inactive = {}
}
table.insert(components.active, {})

table.insert(components.active[1], {
    provider = function()
        return navic.get_location()
    end,
    enabled = function()
        return navic.is_available()
    end
})

require('feline').setup({
    components = ctp_feline.get(),
})
require("feline").winbar.setup({ components = components })
