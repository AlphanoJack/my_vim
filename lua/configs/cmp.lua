local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },    -- ← LSP 정보 (타입, 함수 시그니처 등)
    { name = "luasnip" },     -- 스니펫
    { name = "buffer" },      -- 버퍼 텍스트 (지금 Text로 나오는 것)
    { name = "path" },        -- 파일 경로
  },
})
