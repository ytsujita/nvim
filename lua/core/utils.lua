local M = {}
local merge_tb = vim.tbl_deep_extend

-- マッピング設定の読み込み用関数
-- target_mappings は { n = {}, i = {}, } のような形式
M.load_mappings = function(target_mappings, mapping_options)
  local function set_section_map(section_values)
    for mode, mode_values in pairs(section_values) do
      local default_opts = merge_tb("force", { mode = mode }, mapping_options or {})
      for keybind, mapping_info in pairs(mode_values) do
        local opts = merge_tb("force", default_opts, mapping_info.opts or { silent = true })
        mapping_info.opts, opts.mode = nil, nil
        opts.desc = mapping_info[2]
        vim.keymap.set(mode, keybind, mapping_info[1], opts)
      end
    end
  end
  set_section_map(target_mappings)
end

return M
