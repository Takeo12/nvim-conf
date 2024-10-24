local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Placeholder for snippets
local snippets = {
    -- \documentclass without options
    s("dcl", { t("\\documentclass{"), i(1, "class"), t("} "), i(0) }),

    -- \documentclass with options
    s("dclo", { t("\\documentclass["), i(1, "options"), t("]{"), i(2, "class"), t("} "), i(0) }),

    -- Template snippet
    s("tmplt", {
        t("\\documentclass{"), i(1, "article"), t("}\n\n"),
        t("\\usepackage{import}\n"),
        t("\\usepackage{pdfpages}\n"),
        t("\\usepackage{transparent}\n"),
        t("\\usepackage{xcolor}\n"),
        i(2), t("\n\n"),
        t("\\newcommand{\\incfig}[2][1]{%\n    \\def\\svgwidth{#1\\columnwidth}\n    \\import{./figures/}{#2.pdf_tex}\n}\n"),
        i(3), t("\n\n\\pdfsuppresswarningpagegroup=1\n\n\\begin{document}\n    "),
        i(0),
        t("\n\\end{document}\n")
    }),

    -- \newcommand
    s("nc", { t("\\newcommand{\\\\"), i(1, "cmd"), t("}["),
              i(2, "opt"), t("]{"), i(3, "realcmd"), t("} "), i(0) }),

    -- \usepackage
    s("up", { t("\\usepackage["), i(1, "options"), t("]{"), i(2, "package"), t("} "), i(0) }),

    -- \newunicodechar
    s("nuc", { t("\\newunicodechar{"), i(1), t("}{"), i(2, "\\ensuremath"), t("}{"), i(3, "tex-substitute"), t("} "), i(0) }),

    -- \DeclareMathOperator
    s("dmo", { t("\\DeclareMathOperator{"), i(1), t("}{"), i(2), t("} "), i(0) }),

    -- \begin{}...\end{} block
    s("begin", {
        t("\\begin{"), i(1, "env"), t("}\n\t"),
        i(0), t("\n\\end{"), i(1), t("}\n")
    }),

    -- \maketitle
    s("mkt", { t("\\maketitle\n") }),

    -- tabular environment
    s("tab", {
        t("\\begin{"), i(1, "tabular"), t("}{"), i(2, "c"), t("}\n\t"),
        i(0), t("\n\\end{"), i(1), t("}\n")
    }),

    -- thm (theorem-like) environment with optional author
    s("thm", {
        t("\\begin["), i(1, "author"), t("]{"), i(2, "thm"), t("}\n\t"),
        i(0), t("\n\\end{"), i(2), t("}\n")
    }),

    -- center environment
    s("center", {
        t("\\begin{center}\n\t"),
        i(0), t("\n\\end{center}\n")
    }),

    -- align(ed) environment
    s("ali", {
        t("\\begin{align"), i(1, "ed"), t("}\n\t\\label{eq:"), i(2), t("}\n\t"),
        i(0), t("\n\\end{align"), i(1), t("}\n")
    }),

    -- gather(ed) environment
    s("gat", {
        t("\\begin{gather"), i(1, "ed"), t("}\n\t"),
        i(0), t("\n\\end{gather"), i(1), t("}\n")
    }),

    -- equation environment
    s("eq", {
        t("\\begin{equation}\n\t"),
        i(0), t("\n\\end{equation}\n")
    }),

    -- labeled equation environment
    s("eql", {
        t("\\begin{equation}\n\t\\label{eq:"), i(2), t("}\n\t"),
        i(0), t("\n\\end{equation}\n")
    }),

    -- unnumbered equation environment
    s("eq*", {
        t("\\begin{equation*}\n\t"),
        i(0), t("\n\\end{equation*}\n")
    }),

    -- unnumbered equation: \[ ... \]
    s("\\", {
        t("\\[\n\t"),
        i(0), t("\n\\]\n")
    }),

    -- eqnarray environment
    s("eqnarray", {
        t("\\begin{eqnarray}\n\t"),
        i(0), t("\n\\end{eqnarray}\n")
    }),

    -- \label
    s("lab", { t("\\label{"), i(1, "eq:fig:tab:"), i(0), t("}\n") }),

    -- enumerate environment
    s("enum", {
        t("\\begin{enumerate}\n\t\\item "), i(0),
        t("\n\\end{enumerate}\n")
    }),

    -- enumerate environment with (a), (b), ...
    s("enuma", {
        t("\\begin{enumerate}[(a)]\n\t\\item "), i(0),
        t("\n\\end{enumerate}\n")
    }),

    -- enumerate environment with (i), (ii), ...
    s("enumi", {
        t("\\begin{enumerate}[(i)]\n\t\\item "), i(0),
        t("\n\\end{enumerate}\n")
    }),

    -- itemize environment
    s("item", {
        t("\\begin{itemize}\n\t\\item "), i(0),
        t("\n\\end{itemize}\n")
    }),

    -- item
    s("it", { t("\\item "), i(1), t("\n") }),

    -- description environment
    s("desc", {
        t("\\begin{description}\n\t\\item["), i(1), t("] "), i(0),
        t("\n\\end{description}\n")
    }),

    -- Endless new item
    s("]i", {
        t("\\item "), i(1),
        t("\n\t"), i(0), t("]i")
    }),

    -- Matrix environments
    s("mat", {
        t("\\begin{"), i(1, "p/b/v/V/B/small"), t("matrix}\n\t"),
        i(0), t("\n\\end{"), i(1), t("matrix}\n")
    }),

    -- Cases environment
    s("cas", {
        t("\\begin{cases}\n\t"),
        i(1, "equation"), t(", &\\text{ if }"), i(2, "case"), t("\\\\\n\t"),
        i(0), t("\n\\end{cases}\n")
    }),

    -- split environment
    s("spl", {
        t("\\begin{split}\n\t"),
        i(0), t("\n\\end{split}\n")
    }),

    -- document part (part, chapter, section, etc.)
    s("part", {
        t("\\part{"), i(1, "part name"), t("} % (fold)%\n\\label{prt:"), i(2, "$1"),
        t("}\n\t"), i(0), t("\n% part $2 (end)\n")
    }),

    s("cha", {
        t("\\chapter{"), i(1, "chapter name"), t("}%\n\\label{cha:"), i(2, "$1"),
        t("}\n\t"), i(0)
    }),

    s("sec", {
        t("\\section{"), i(1, "section name"), t("}%\n\\label{sec:"), i(2, "$1"),
        t("}\n\t"), i(0)
    }),

    -- Same for subsection, subsubsection, paragraph, subparagraph, etc.
    -- Define similar snippets as above for "sub", "sub*", "ssub", "par", etc.

    -- \noindent
    s("ni", { t("\\noindent\n\t"), i(0) }),

    -- Figure environment
    s("fig", {
        t("\\begin{figure}\n\\begin{center}\n\t\\includegraphics[scale="), i(1), t("]{Figures/"),
        i(2), t("}\n\\end{center}\n\\caption{"), i(3), t("}\n\\label{fig:"), i(4),
        t("}\n\\end{figure}\n\t"), i(0)
  })
}


ls.add_snippets("latex", snippets)
