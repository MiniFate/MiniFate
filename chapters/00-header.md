---
title: MiniFate
author: Alexander Gude and Charles Fyfe
date: Version 0.1

documentclass: article
classoption:
  # - twocolumn  # See Bug #12
  - twoside
  - openany

fontfamily: tgpagella
fontsize: 12pt

papersize: letter
geometry: top=4cm, bottom=4cm, outer=6cm, inner=3cm

header-includes: |
  \usepackage{include/dice}
  \usepackage[flushmargin,side]{footmisc}
  \usepackage{tcolorbox}
---

\newcommand{\aspect}[1]{\textsc{#1}}
\newcommand{\skill}[1]{\textit{#1}}
\newcommand{\keyword}[1]{\textbf{#1}}

\newcommand{\roll}[1]{\foreach \val in {#1}{\ifthenelse{\equal{\val}{+}}{\die+}{\ifthenelse{\equal{\val}{-}}{\die-}{\die{}}}\;}}

<!---
Redefine how footnotes are drawn. No number, and draw a box around the text.
-->
\renewcommand\thefootnote{}
\makeatletter
\renewcommand\@makefntext[1]{%
    \noindent
    \tcbox[colback=white,colframe=black,size=small]{
        \begin{minipage}{\marginparwidth}#1\end{minipage}}}
\makeatother

<!---
Add a bit of extra space between the text body and the footnotes in the margins
-->
\addtolength{\marginparsep}{1em}
