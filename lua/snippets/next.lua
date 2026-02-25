-- default func 
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- TypeScript React 스니펫
ls.add_snippets("typescriptreact", {
  s("dfunc", {
    t({"export default function () {", "  return (", "    "}),
    i(1),
    t({"", "  );", "}"}),
  }),
  s("rfc", {
    t({"export default function "}),
    i(1, "Component"),
    t({"() {", "  return (", "    <div>"}),
    i(2),
    t({"</div>", "  )", "}"}),
  }),
})

-- JavaScript React Snnippets
-- default function snippet

ls.add_snippets("javascriptreact", {
  s("dfunc", {
    t({"export default function () {", "  return (", "    "}),
    i(1),
    t({"", "  );", "}"}),
  }),
})

ls.add_snippets("typescriptreact", {
  s("dfunc", {
    t({"export default function () {", "  return (", "    "}),
    i(1),
    t({"", "  );", "}"}),
  }),
})

-- TypeScript React Async function snippet
ls.add_snippets("javascriptreact", {
  s("dafunc", {
    t({"export default async function () {", "  return (", "    "}),
    i(1),
    t({"", "  );", "}"}),
  }),
  s("rfc", {
    t({"export default function "}),
    i(1, "Component"),
    t({"() {", "  return (", "    <div>"}),
    i(2),
    t({"</div>", "  )", "}"}),
  }),
})



ls.add_snippets("typescriptreact", {
  s("dafunc", {
    t({"export default async function () {", "  return (", "    "}),
    i(1),
    t({"", "  );", "}"}),
  }),
  s("rfc", {
    t({"export default function "}),
    i(1, "Component"),
    t({"() {", "  return (", "    <div>"}),
    i(2),
    t({"</div>", "  )", "}"}),
  }),
})

-- JavaScript React Plain function snippet
ls.add_snippets("javascriptreact", {
  s("pfunc", {
    t({"export function () {", "  return (", "    "}),
    i(1),
    t({"", "  );", "}"}),
  }),
})

ls.add_snippets("typescriptreact", {
  s("pfunc", {
    t({"export function () {", "  return (", "    "}),
    i(1),
    t({"", "  );", "}"}),
  }),
})

ls.add_snippets("typescript", {
  s("zs", {
    t({"import z from \"zod\";", "", "export const "}),
    i(1, "schema"),
    t({" = z.object({", "  "}),
    i(2),
    t({"", "});"}),
  }),
})
