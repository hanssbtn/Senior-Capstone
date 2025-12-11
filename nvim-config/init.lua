vim.opt.tabstop = 4
vim.g.python_recommended_style = 1
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.g.mapleader = ","
vim.o.expandtab = false
vim.o.relativenumber = true
vim.opt.statuscolumn = "%s %{v:relnum} %{v:lnum}"
vim.o.list = true
vim.o.listchars = 'tab:» ,lead:•,trail:•,nbsp:␣'

vim.keymap.set('v', '<S-A-j>', ":'<,'>m'>+1<CR>gv=gv", { noremap = true, desc = 'Move selected lines down' })
vim.keymap.set('v', '<S-A-k>', ":'<,'>m'<-2<CR>gv=gv", { noremap = true, desc = 'Move selected lines up' })
vim.keymap.set({'n', 'v'} , '<leader>x', '"_x', { noremap = true, desc = 'Delete 1 character under the cursor without assigning to register' })
vim.keymap.set({'n', 'v'} , '<leader>X', '"_X', { noremap = true, desc = 'Delete 1 character before the cursor without assigning to register' })
vim.keymap.set({'n', 'v'} , '<leader>c', '"_c', { noremap = true, desc = 'Change without assigning to register' })
vim.keymap.set({'n', 'v'} , '<leader>d', '"_d', { noremap = true, desc = 'Delete without assigning to register' })
vim.keymap.set({'n', 'v'} , '<leader>D', '"_D', { noremap = true, desc = 'Delete until end of line without assigning to register' })
vim.keymap.set({'n', 'v'} , '<leader>dd', '"_dd', { noremap = true, desc = 'Delete line without assigning to register' })
vim.keymap.set({'n', 'v'} , '<leader>C', '"_C', { noremap = true, desc = 'Change to end of line without assigning to register' })
vim.keymap.set('n', '<leader>o', 'o<Esc>', { noremap = true, desc = 'Add new line without entering insert mode' })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { noremap = true, desc = 'Add new line without entering insert mode' })
vim.keymap.set('n', '<leader><Tab>', function()
	local cursor_pos = vim.fn.getcurpos()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('0i<Tab><C-c>', true, false, true), 'n', false)
	vim.fn.setpos('.', cursor_pos)
end, { noremap = true, desc = 'Add tab without entering insert mode' })
vim.keymap.set({'n', 'v'}, '<leader>r', [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><left>]], { noremap = true, desc = 'Replace highlighted text with another' })
vim.keymap.set({'i', 'v'}, '<C-Space>', '<C-\\><C-N>', { noremap = true, desc = 'Change to normal mode' })
vim.keymap.set('n', '<leader>h', ':set hls! <CR>', { noremap = true, desc = 'Toggle search highlight' })
vim.keymap.set('n', '<leader>l', function()
	vim.fn.setreg('/', '')
end, { noremap = true, desc = 'Clear search register and highlight' })
vim.keymap.set('n', '<M-S-a>', 'ggVG', { noremap = true, desc = 'Select all text' })
vim.keymap.set('v', '<M-S-a>', '<C-\\><C-N>ggVG', { noremap = true, desc = 'Select all text' })
vim.keymap.set('n', '<F10>', function()
	if (vim.api.nvim_get_option_value('mouse', { scope = 'global' }) == 'nvi') then
		vim.opt.mouse = ''
	else
		vim.opt.mouse = 'nvi'
	end
	vim.notify(string.format('vim.opt.mouse:get(): %s', vim.api.nvim_get_option_value('mouse', { scope = 'global' })), vim.log.levels.INFO)
end, { noremap = true, desc = 'Toggle mouse support' })

vim.keymap.set('n', '<S-A-j>', function()
  local count = vim.v.count > 0 and vim.v.count or 1
  -- The :m .+1 command moves the current line to one line below the current position.
  for _ = 1, count do
	vim.cmd('m .+1')
	vim.cmd('normal! ==')
  end
end, { noremap = true, desc = 'Move line down' })

vim.keymap.set('n', '<S-A-k>', function()
  local count = vim.v.count > 0 and vim.v.count or 1
  -- The :m .-2 command moves the current line to one line above the current position.
  for _ = 1, count do
	vim.cmd('m .-2')
	vim.cmd('normal! ==')
  end
end, { noremap = true, desc = 'Move line up' })

vim.keymap.set('n', '<S-A-k>', function()
  local count = vim.v.count > 0 and vim.v.count or 1
  -- The :m .-2 command moves the current line to one line above the current position.
  for _ = 1, count do
	vim.cmd('m .-2')
	vim.cmd('normal! ==')
  end
end, { noremap = true, desc = 'Move line up' })

require('config.lazy')
