---
title: MiniFate
author: Alexander Gude and Charles Fyfe
date: Version 0.1

documentclass: article
classoption:
  - twocolumn
  - twoside
  - openany

fontfamily: tgpagella
fontsize: 12pt

papersize: letter
geometry: margin=2cm

header-includes: |
  \usepackage{include/dice}
---

\newcommand{\aspect}[1]{\textsc{#1}}
\newcommand{\skill}[1]{\textit{#1}}
\newcommand{\keyword}[1]{\textbf{#1}}

\newcommand{\df}[1]{\ifthenelse{\equal{#1}{+}}{\die+}{\ifthenelse{\equal{#1}{-}}{\die-}{\die{}}}}\;}

\newcommand{\roll}[1]{\foreach \val in {#1}{\df{\val}}}
