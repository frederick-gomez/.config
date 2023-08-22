vim.g.mapleader = " "

--copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--replace all words under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

--Source the current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

--Keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Save current file
vim.keymap.set("n", "zz", "<Cmd>update<cr>")

--Tabs and buffers
vim.keymap.set("n", "<leader>nn", "<Cmd>tabnew<CR>")

--Switch to last buffer
vim.keymap.set("n", "<leader>bb", " <c-^><CR>")

--Exit terminal mode
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })

vim.api.nvim_exec(
	[[
let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \      '+': 'clip.exe',
            \      '*': 'clip.exe',
            \    },
            \   'paste': {
            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \   },
            \   'cache_enabled': 0,
            \ }
]],
	true
)
