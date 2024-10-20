
local luasnip = require('luasnip')

luasnip.snippets.latex = {
    -- Basic LaTeX document structure
    luasnip.parser.parse_snippet("doc", "\\documentclass{article}\n\\begin{document}\n    ${0}\n\\end{document}"),
    
    -- Sectioning
    luasnip.parser.parse_snippet("sec", "\\section{${1:Section Title}}\n${0}"),
    luasnip.parser.parse_snippet("subsec", "\\subsection{${1:Subsection Title}}\n${0}"),
    luasnip.parser.parse_snippet("subsubsec", "\\subsubsection{${1:Subsubsection Title}}\n${0}"),

    -- Itemize and Enumerate
    luasnip.parser.parse_snippet("itemize", "\\begin{itemize}\n    \\item ${0}\n\\end{itemize}"),
    luasnip.parser.parse_snippet("enumerate", "\\begin{enumerate}\n    \\item ${0}\n\\end{enumerate}"),

    -- Figures
    luasnip.parser.parse_snippet("fig", "\\begin{figure}[h]\n    \\centering\n    \\includegraphics[width=\\textwidth]{${1:filename}}\n    \\caption{${2:Caption}}\n    \\label{fig:${3:label}}\n\\end{figure}"),

    -- Tables
    luasnip.parser.parse_snippet("tab", "\\begin{table}[h]\n    \\centering\n    \\begin{tabular}{|c|c|}\n        \\hline\n        ${1:Header1} & ${2:Header2} \\\\\n        \\hline\n        ${3:Row1Col1} & ${4:Row1Col2} \\\\\n        \\hline\n    \\end{tabular}\n    \\caption{${5:Caption}}\n    \\label{tab:${6:label}}\n\\end{table}"),

    -- Reference
    luasnip.parser.parse_snippet("ref", "\\cite{${1:reference}}"),
    
    -- Mathematical symbols
    luasnip.parser.parse_snippet("int", "\\int_{${1:a}}^{${2:b}} ${3:f(x)} dx"),
}


