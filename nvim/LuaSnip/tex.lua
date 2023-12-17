local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  -- Combining text and insert nodes to create basic LaTeX commands
  s({trig="tt", dscr="Expands 't' into '\texttt{}'"},
    {
      t("\\texttt{"), -- remember: backslashes need to be escaped
      i(1),
      t("}"),
    }
  ),
  s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'",  snippetType = "autosnippet"},
    fmt(
      "\\frac{<>}{<>}",
      {
        i(1),
        i(2)
      },
      {delimiters = "<>", condition= in_mathzone}
    )
  ),
  s({trig="eq", dscr="A LaTeX equation environment"},
    fmt( -- The snippet code actually looks like the equation environment it produces.
      [[
      \begin{equation}
          <>
      \end{equation}
    ]],
      -- The insert node is placed in the <> angle brackets
      { i(1) },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  ),
  s({trig="env", snippetType="autosnippet"},
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),  -- this node repeats insert node i(1)
      }
    )
  ),
  s({trig="hr", dscr="The hyperref package's href{}{} command (for url links)"},
    fmta(
      [[\href{<>}{<>}]],
      {
        i(1, "url"),
        i(2, "display name"),
      }
    )
  ),
  s({trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command."},
    fmta("\\textit{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
  s({trig = "tbb", dscr = "Expands 'tbb' into LaTeX's textbf{} command.", snippetType="autosnippet"},
    fmta("\\textbf{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
  s({trig = "tbb", dscr = "Expands 'tbb' into LaTeX's textbf{} command." , snippetType = "autosnippet"},
    fmta("\\textbf{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
  s({trig = "mbb", dscr = "Expands 'mbb' into LaTeX's mathbf{} command." , snippetType = "autosnippet"},
    fmta("\\mathbf{<>}",
      {
        d(1, get_visual),
      }
    )
  ),
s({trig = "df", snippetType = "autosnippet"},
  { t("\\diff") },
  { condition = in_mathzone }
),
-- A fun zero subscript snippet
s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("0")
    }
  )
),
s({trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>$<>$",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  )
),
}
