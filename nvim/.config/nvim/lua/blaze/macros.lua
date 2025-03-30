--
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, true, true)

local default_macros = {
  l = "yoconsole.log('" .. esc .. "pa:" .. esc .. "la, " .. esc .. "pl",
}

for key, command in pairs(default_macros) do
  vim.fn.setreg(key, command)
end

-------------------------------------------------------------------------------------
local macros_javascript = {
  l = "yoconsole.log('" .. esc .. "pa:" .. esc .. "la, " .. esc .. "pl",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact,", "typescriptreact", "astro" },
  callback = function()
    for key, command in pairs(macros_javascript) do
      vim.fn.setreg(key, command)
    end
  end,
})
-----------------------------------------------------------------------------------
local macros_golang = {
  l = 'yofmt.Println("' .. esc .. "pa:" .. esc .. "la, " .. esc .. "pl",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    for key, command in pairs(macros_golang) do
      vim.fn.setreg(key, command)
    end
  end,
})
-----------------------------------------------------------------------------------
