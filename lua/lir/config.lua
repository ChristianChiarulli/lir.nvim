-----------------------------
-- Private
-----------------------------
local defaults_values = {
  show_hidden_files = false,
  devicons_enable = false,
  hide_cursor = false,
  on_init = function() end,
  mappings = {},
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = false,
    },
  },
  get_filters = nil,
}

-----------------------------
-- Export
-----------------------------

---@class lir.config
---@field values lir.config.values
local config = {}

---@class lir.config.values
---@field show_hidden_files boolean
---@field devicons_enable   boolean
---@field on_init           function
---@field mappings          table
---@field float             lir.config.values.float
---@field hide_cursor       boolean
---@field get_filters fun(): lir.config.filter_func[]
config.values = {}

---@alias lir.config.filter_func fun(files: lir_item[]): lir_item[]

---@class lir.config.values.float
---@field winblend        number
---@field win_opts         table
---@field curdir_window   lir.config.values.float.curdir_window

---@class lir.config.values.float.size_percentage
---@field width  number
---@field height number

---@class lir.config.values.float.curdir_window
---@field enable  boolean
---@field highlight_dirname boolean

---@param opts lir.config.values
function config.set_default_values(opts)
  config.values = vim.tbl_deep_extend("force", defaults_values, opts or {})

  -- For an empty table
  if vim.tbl_isempty(config.values.float) then
    config.values.float = defaults_values.float
  elseif vim.tbl_isempty(config.values.float.curdir_window) then
    config.values.float.curdir_window = defaults_values.float.curdir_window
  end
end

return config
