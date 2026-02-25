-- ~/.config/nvim/lua/configs/nvim-autopairs.lua 생성
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  check_ts = true,
})

-- HTML/JSX 태그 자동 닫기 규칙 추가
npairs.add_rules({
  Rule("<", ">", { "html", "javascriptreact", "typescriptreact" })
    :with_pair(cond.before_regex("%a+"))
    :with_move(cond.none())
    :with_cr(cond.none()),
})
