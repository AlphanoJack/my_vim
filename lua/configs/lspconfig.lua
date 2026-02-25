require("nvchad.configs.lspconfig").defaults()

local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

-- 새로운 방식: vim.lsp.config 사용
local servers = {
  html = {},
  cssls = {},
  gopls = {
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_markers = {"go.work", "go.mod", ".git"},
  },
  ts_ls = {
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    root_markers = {"package.json", "tsconfig.json", "jsconfig.json", ".git"},
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
        },
        suggest = {
          autoImports = true,  -- 자동 import 제안
        },
      },
    },
  },
  sqls = {
    settings = {
      sqls = {
        connections = {
          {
            driver = "postgresql",
            dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=yourpassword dbname=yourdb sslmode=disable",
          },
        },
      },
    },
  },
}

-- 각 서버 설정
for name, config in pairs(servers) do
  vim.lsp.config(name, vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach,
    on_init = on_init,
  }, config))
end

-- 서버 활성화
vim.lsp.enable({"html", "cssls", "gopls", "ts_ls", "sqls"})

-- Diagnostic 설정
vim.o.updatetime = 300
vim.diagnostic.config({
  virtual_text = true,
  float = {
    border = "rounded",
    source = true,
    wrap = true,
    max_width = 80,
  },
})

-- CursorHold 자동 표시
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = {"BufLeave", "CursorMoved", "InsertEnter"},
    })
  end
})
