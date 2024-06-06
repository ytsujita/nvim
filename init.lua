require("core.options")

if vim.g.vscode then
  local mappings = require("core.vscode_mappings")
  require("core.utils").load_mappings(mappings)
  require("core.vscode_plugin_setup")
else
  local mappings = require("core.mappings")
  require("core.utils").load_mappings(mappings)
  require("core.plugin_setup")
end
