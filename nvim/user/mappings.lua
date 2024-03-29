local utils = require "astronvim.utils"

return {
  n = {
    ["<leader>te"] = { function() utils.toggle_term_cmd "iex" end, desc = "ToggleTerm iex" },
    ["<F1>"] = { ":Randomfavcolor<cr>", desc = "Random favorite colorscheme" },
    [";"] = { "za", desc = "Collapse code blocks" },
  }
}
