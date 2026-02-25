require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Code Action Auto Import 
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code action" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- file explorer toggle
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- rust run code
map("n", "<Leader>rr", "<cmd>lua vim.cmd('RustLsp runnables')<CR>", { desc = "Rust runnables" })
map("n", "<Leader>rc", "<cmd>terminal cargo run<CR>", { desc = "Cargo run" })

map("n", "x", "_x", { desc = "Delete character without copying to register" })
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- select all 
map("n", "<C-a>", "ggVG", { desc = "Select all" })

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- terminal mode
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal escape" })

-- vertical and horizontal terminal
map("n", "<leader>tv", ":vsplit | terminal<CR>", {desc = "Vertical terminal"})
map("n", "<leader>th", ":split | terminal<CR>", {desc = "Horizontal terminal"})

local has_telescope, _ = pcall(require, "telescope")
if has_telescope then
  map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
  map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
  map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Grep string" })
  map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
  map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
end

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = "Copilot Accept", replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true })

-- comment key map
map("n", "<C-_>", function() require("Comment.api").toggle.linewise.current() end, { desc = "Comment toggle current line" })
map("v", "<C-_>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Comment toggle linewise" })

-- Diagnostic mappings for Rust warnings/errors
map("n", "<leader>r", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })

-- Additional useful LSP mappings
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- save cmd+S only for MAC
map({"n", "i", "v"}, "<D-s>", "<cmd>w<cr>", { desc = "Save file" })

-- delete word
map("n", "<leader>dw", "diw", { desc = "Delete inner word" })

-- delete line
map("n", "<leader>dl", "dd", { desc = "Delete line" })

-- control size using shift + arrow keys
map("n", "<D-Up>", ":resize +2<CR>")
map("n", "<D-Down>", ":resize -2<CR>")
map("n", "<D-Left>", ":vertical resize -2<CR>")
map("n", "<D-Right>", ":vertical resize +2<CR>")

-- Only for Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    map("n", "<leader>gr", "<cmd>GoRun<cr>", { desc = "Go Run" })
    map("n", "<leader>gt", "<cmd>GoTest<cr>", { desc = "Go Test" })
    map("n", "<leader>gi", "<cmd>GoImport<cr>", { desc = "Go Import" })

    -- 구조체 태그 관리 (JSON 등)
    map("n", "<leader>gat", "<cmd>GoAddTag<cr>", { desc = "Add Tags to Struct" })
    map("n", "<leader>grt", "<cmd>GoRmTag<cr>", { desc = "Remove Tags from Struct" })

    -- 코드 생성 및 수정
    map("n", "<leader>gie", "<cmd>GoIfErr<cr>", { desc = "Add If Error check" }) -- 에러 핸들링 자동 생성
    map("n", "<leader>gfs", "<cmd>GoFillStruct<cr>", { desc = "Fill Struct" }) -- 구조체 필드 자동 채우기
  end,

})

-- Go to definition 
map("n", "gv", function()
  vim.cmd("vsplit")
  vim.lsp.buf.definition()
end, { desc = "Go to definition in vsplit" })

-- Go to implementations
map("n", "gi", function()
  vim.cmd("vsplit")
  vim.lsp.buf.implementation()
end, { desc = "Go to implementation in vsplit" })

-- Go to references
map("n", "gr", function()
  vim.cmd("vsplit")
  vim.lsp.buf.references()
end, { desc = "Go to references in vsplit" })

-- jsx/tsx auto close tags
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescriptreact", "javascriptreact" },
  callback = function()
    vim.keymap.set("i", ">", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.fn.col(".")
      local before = line:sub(1, col - 1)
      
      -- <태그 형태 감지
      local tag = before:match("<(%w+)%s*$")
      if tag then
        -- <div></div> 생성하고 커서를 태그 사이로
        local closing = "</" .. tag .. ">"
        local left_moves = string.rep("<Left>", #closing)
        return ">" .. closing .. left_moves
      end
      return ">"
    end, { expr = true, buffer = true })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    -- gopls가 attach되어 있으면 포맷
    vim.lsp.buf.format({
      async = false,
      timeout_ms = 3000,
      filter = function(client)
        return client.name == "gopls"
      end
    })
  end,
})

