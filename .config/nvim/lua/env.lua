-- mise
if vim.fn.executable 'mise' == 1 then
  vim.env.PATH = vim.env.HOME .. '/.local/share/mise/shims:' .. vim.env.PATH
end
