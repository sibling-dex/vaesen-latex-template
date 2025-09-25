%% Copyright 2025 Bulbaraf and Sibling_Dex
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status “maintained”.
% 
% The Current Maintainer of this work is Sibling_Dex.
%
% This work consists of the files vaesen-supplement.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vaesen-supplement}[2025 version]
%%========== ARTICLE =========%%
\DeclareOption{onepage}{\gdef\onlyonepage\true}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[10pt,a4paper,twocolumn]{report}
%%========= PACKAGES =========%%
\RequirePackage{multicol,float} 
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{geometry}
\geometry{
    textwidth=17cm,
    top=2.5cm,
    headsep=1cm,
    bottom=3cm,
    footskip=1.5cm
}
\setlength{\columnsep}{1cm}
\setcounter{tocdepth}{1}
%%========== FONTS ==========%%
\RequirePackage{babel}
\RequirePackage[autostyle]{csquotes}
    \MakeOuterQuote{"}
\RequirePackage{fontspec,pifont,bbding}
\setmainfont{BaskervilleF}
\setsansfont{Poppins}[
        Path = ./fonts/ ,
        Extension = .ttf ,
        UprightFont = *-Regular ,
        BoldFont = *-Bold ,
        ItalicFont = *-Italic ,
        BoldItalicFont = *-BoldItalic]
\newfontfamily\titlefont{Flareserif.otf}[Path = ./fonts/]
\newfontfamily\symbolfont{HermeticSpellbook.ttf}[Path = ./fonts/]
\newfontfamily\headerfont{Berolina.ttf}[Path = ./fonts/]
\newfontfamily\handwritten{HomemadeApple.ttf}[Path = ./fonts/]

\providecommand{\fakesc}[1]{{\footnotesize\bfseries\MakeUppercase{#1}}}
\providecommand{\HUGE}{\fontsize{32}{32}\selectfont}
\providecommand{\bigsymbol}[1]{{\fontsize{100pt}{75pt}\symbolfont#1}}
%%========== COLORS ==========%%
\RequirePackage[table,dvipsnames]{xcolor}
\definecolor{TitleBrown}{RGB}{72, 52, 23}
\definecolor{DragonRed}{RGB}{165, 60, 62}
\definecolor{Sand}{RGB}{230, 222, 215}
\definecolor{LightSand}{RGB}{242, 239, 237}
    \colorlet{textlight}{white}
    \colorlet{title}{TitleBrown}
    \colorlet{text}{black}
    \colorlet{secret}{DragonRed}
    \colorlet{accent}{TitleBrown}
    \colorlet{page}{white}
    \colorlet{box}{LightSand}
    \colorlet{row}{Sand}
%%======== TABLES ========%%
\RequirePackage{tabulary}
\RequirePackage{ragged2e}
    \tymax=\textwidth
    \def\arraystretch{1.5}
\AddToHook{env/tabular/before}{\rowcolors{1}{row}{}}
\AddToHook{env/tabularx/before}{\rowcolors{1}{row}{}}
\AddToHook{env/tabulary/before}{\rowcolors{1}{row}{}}
%%======== BACKGROUND ========%%
\RequirePackage{graphicx}
%% ======== COMMANDS ======== %%
\providecommand{\@NoIndentAfter}{\@ifnextchar\par{\def\par{\everypar{\setbox\z@\lastbox\everypar{}}\@restorepar}}{}}
\providecommand{\NoIndentAfterThis}{\@NoIndentAfter\par\par}
%%===== OLD ENVIRONMENTS =====%%
\RequirePackage{setspace,enumitem}
\onehalfspacing

\setlist[itemize]{before=\csname par\endcsname\raggedright,noitemsep,topsep=0.5em,leftmargin=1.5em,label=\ding{167}}
\setlist[enumerate]{noitemsep,topsep=0.5em,leftmargin=1.5em}
\setlist[description]{font=\tffamily\bfseries,topsep=0.5em,itemsep=0.5em,leftmargin=0pt}

\newcommand{\bolditem}[1]{\item {\scshape\bfseries\MakeLowercase{#1}}}
\newcommand\coloritem[2][accent]{{\color{#1}\item \scshape\bfseries\MakeLowercase{#2}}}

\AddToHook{env/itemize/after}{\NoIndentAfterThis}
\AddToHook{env/enumerate/after}{\NoIndentAfterThis}
\AddToHook{env/description/after}{\NoIndentAfterThis}
%% ==== NEW ENVIRONMENTS ==== %%
\renewenvironment{quote}%
    {\normalsize\centering
    \list{}{\leftmargin=1em
        \rightmargin\leftmargin}
        \item\relax}%
    {\endlist\NoIndentAfterThis}
\providecommand{\NPCquote}[1]{{\itshape#1}\par\vspace{0.5em}}
%%==== TITLE ====%%
\providecommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\providecommand{\credits}[1]{\gdef\@credits{#1}}
\providecommand{\introduction}[1]{\gdef\@introduction{#1}}
\gdef\@authorkey{by}
\gdef\@introkey{INTRODUCTION:}
\providecommand{\titlepicture}[1]{\gdef\@titlepicture{#1}}
\gdef\@titlepicture{example-image.jpg}

\providecommand{\titleline}{
\begin{center}
    \includegraphics[width=14cm]{img/line.png}
\end{center}
}
\providecommand{\dragonpicture}[1]{
    \begin{tikzpicture}
        \begin{scope}
            \clip (4,3.5) circle (35mm);
            \node[anchor=center] at (4,3.5) {\includegraphics[width=8cm,keepaspectratio]{#1}}; 
        \end{scope}
        \node[anchor=center] at (4,4) {\includegraphics[width=85mm]{img/Snake.png}};
    \end{tikzpicture}
}

\renewcommand*{\maketitle}{%
    \newgeometry{textwidth=17cm,top=2cm,bottom=1.5cm}
    \begin{titlepage}\centering
        \dragonpicture{\@titlepicture}
        
        \color{title}\fontsize{45}{45}\titlefont\MakeUppercase\@title\par
        
        \vspace{-12mm}\titleline
        
        \ifdefined\@subtitle
            \color{text}\Large\normalfont\bfseries\MakeUppercase\@subtitle\par
        \fi
        
        \vspace{4mm}
        
        \normalfont\normalsize\color{text}
        
        \ifdefined\@introduction
            \begin{minipage}{10cm}
                \begin{quote}\large\itshape
                    \@introkey~\@introduction
                \end{quote}
            \end{minipage}
        \fi
        
        \vspace{4mm}
        
        \@authorkey~\large\MakeUppercase{\@author}

        \vfill
        
        \includegraphics[width=5.6cm]{img/FLW.png}
        
        \vfill
        
        \begin{minipage}{\textwidth}
            \normalfont\footnotesize\@credits
        \end{minipage}
    \end{titlepage}
\restoregeometry
}
\renewcommand{\tableofcontents}{%
    \onecolumn
    \chapter{\contentsname}%
    \begin{center}
        \begin{minipage}{8cm}
            \@starttoc{toc}%
        \end{minipage}
    \end{center}
    \twocolumn
}
%%==== Float Control & Placement ====%%
\RequirePackage{stfloats}
\RequirePackage{cuted} % provides strip environment
%%==== TIKZ ====%%
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric}
%%==== Fading of image edges ====%% 
\usetikzlibrary{calc,fadings}

\tikzfading[name=fade l,left color=transparent!100,right color=transparent!0]
\tikzfading[name=fade r,right color=transparent!100,left color=transparent!0]
\tikzfading[name=fade d,bottom color=transparent!100,top color=transparent!0]
\tikzfading[name=fade u,top color=transparent!100,bottom color=transparent!0]

% this "frames" a rectangle node
\newcommand\framenode[2][10pt]{
    \fill[white,path fading=fade u] (#2.south west) rectangle ($(#2.south east)+(0, #1)$);
    \fill[white,path fading=fade d] (#2.north west) rectangle ($(#2.north east)+(0,-#1)$);
    \fill[white,path fading=fade l] (#2.south east) rectangle ($(#2.north east)+(-#1,0)$);
    \fill[white,path fading=fade r] (#2.south west) rectangle ($(#2.north west)+( #1,0)$);
}
\newcommand{\fuzzyimage}[1]{
    \noindent % \noindent is needed to make sure an image spans the full width of a column
    \begin{tikzpicture}
        \node[anchor=south west,inner sep=0] (image) at (0,0) {\includegraphics[width=\linewidth]{#1}};
        \framenode[1cm]{image} % opt. arg. is fade radius; mand. arg. is node name to frame
    \end{tikzpicture}
}
%%==== BOXES ====%%
\RequirePackage[most]{tcolorbox}
\tcbset{
    enhanced,
    sharp corners,
    beforeafter skip = 2em,
    wide/.style = {
        width = \textwidth,
        beforeafter skip = 1em,
    },
    empty/.style = {
        before upper = {},
    },
    NPC/.style = {
        fonttitle = \Large\bfseries\rmfamily,
        fontupper = \small\rmfamily,
    },
}
\newtcolorbox{panel}[2][]{
    left = 5mm,
    right = 5mm,
    top = 5mm,
    bottom = 5mm,
    fontupper = \small\sffamily,
    interior code = {
        \begin{scope}
            \clip ([xshift=-4mm,yshift=4mm]interior.north west) rectangle ([xshift=1cm,yshift=-1cm]interior.east);
            \node[anchor=north west] at ([xshift=-4mm,yshift=4mm]interior.north west) {\includegraphics[width=7cm,keepaspectratio]{img/border-top.png}};
        \end{scope}
        \begin{scope}
            \clip ([xshift=-1cm,yshift=1cm]interior.west) rectangle ([xshift=4mm,yshift=-4mm]interior.south east);
            \node[anchor=south east] at ([xshift=4mm,yshift=-4mm]interior.south east) {\includegraphics[width=7cm,keepaspectratio]{img/border-bottom.png}};
        \end{scope}
    },
    opacityfill = 0,
    title = \MakeUppercase{#2},
    detach title,
    fonttitle = \large\bfseries\sffamily,
    coltitle = text,
    before upper = {\vspace{.5em}\hfil\tcbtitle\hfil\par\vspace{.3em}},
    #1
}
\newtcolorbox{note}[1][]{ 
    left = 2em,
    right = 2em,
    top = 2em,
    bottom = 2em,
    boxrule = 1px,
    boxsep = 2mm,
    colback = box,
    colframe = accent,
    borderline = {2px}{2mm}{accent},
    #1
}
%%========= HEADINGS =========%%
\RequirePackage[bf,center,uppercase]{titlesec}
\setcounter{secnumdepth}{0}
%% ---------- PART ----------
\providecommand{\parthead}[1]{\gdef\theparthead{#1}}\parthead{example-image}
\providecommand{\partfoot}[1]{\gdef\thepartfoot{#1}}\partfoot{}
\titleformat{\part}{}{}{0pt}{
    \centering
    \theparthead\\
    \vspace{5mm}
    \color{title}\fontsize{36pt}{36pt}\titlefont\uppercase
}[
    \titleline
    \vspace{3mm}
    \thepartfoot
    \parthead{}\partfoot{}
]
\titlespacing*{\part}{0pt}{0pt}{0pt}
%% ---------- CHAPTER ----------
\gdef\thechapterhead{}
\providecommand{\chapterhead}[1]{
    \gdef\thechapterhead{\centering#1}
}
\titleformat{\chapter}{}{}{0pt}{\centering
    \begin{minipage}{8cm}
        \thechapterhead
    \end{minipage}\\
    \color{title}\bigsymbol{\Alph{chapter}}\\
    \fontsize{34pt}{34pt}\titlefont\uppercase
}[\titleline\gdef\thechapterhead{}]
\titlespacing*{\chapter}{0pt}{0pt}{5mm}
%% ---------- SECTIONS ----------
\providecommand{\heading}[1]{\noindent\hfil{\large\bfseries\MakeUppercase{#1}}\hfil\par}
\titleformat*{\section}{\centering\huge\headerfont}
\titlespacing*{\section}{0pt}{1em}{.5em}
\titlespacing*{\subsection}{0pt}{1em}{.5em}
\titlespacing*{\subsubsection}{0pt}{1em}{0pt}
%%========= HEADERS =========%%
\gdef\theheader{\MakeUppercase{\@title}}
\def\ps@plain{
    \def\@evenhead{}
    \let\@oddhead\@evenhead
    \def\@evenfoot{\hfill\textbullet~\thepage~\textbullet\hfill}
    \let\@oddfoot\@evenfoot
}
\def\ps@headings{
    \def\@evenhead{\small\hfill\textbullet~\chaptername~\thechapter~\textbullet\hfill}
    \let\@oddhead\@evenhead
    \def\@evenfoot{\hfill\textbullet~\thepage~\textbullet\hfill}
    \let\@oddfoot\@evenfoot
}
\pagestyle{headings}
