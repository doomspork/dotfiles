_FAVORITES = {
  "base16-harmonic-dark",
  "base16-nord",
  "embark",
  "japanesque",
  "kanagawa-dragon",
  "kanagawa-wave",
  "lucid",
  "miramare",
  "nisha",
  "onehalfdark",
  "shades_of_purple",
  "tone",
}

local randomFavorite = function()
  local color = _FAVORITES[math.random(#_FAVORITES)]
  vim.notify(color, "info", {
    render = "compact",
    timeout = 500
  })
  vim.cmd("colorscheme " .. color)
end

vim.api.nvim_create_user_command("Randomfavcolor", randomFavorite, { desc = "Set colorscheme to a random favorite" })

return {
  colorscheme = "kanagawa-wave",
}
