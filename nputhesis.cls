%% 
%% This is file `nputhesis.cls'.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nputhesis}[2015/10/23 v0.02 NPU]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass{book}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{caption}
\RequirePackage{ulem}
\RequirePackage[UTF8]{ctexcap} % TODO make utf8 as parameter

\geometry{paperwidth=210mm,paperheight=297mm,%
  left=2.5cm,right=2.5cm,top=2.54cm,bottom=2.54cm}
\topmargin=-10.4mm
\headheight=17pt
\footskip=8mm
\headsep=5mm

\CTEXsetup[name={,}, number={\arabic{chapter}},%
  beforeskip={20pt}, afterskip={20pt}]{chapter}
\CTEXsetup[nameformat={\heiti\zihao{3}\bf}]{chapter}
\CTEXsetup[titleformat={\heiti\zihao{3}}]{chapter}
\CTEXsetup[format={\heiti\zihao{4}}]{section}
\CTEXsetup[format={\heiti\zihao{-4}}]{subsection}

% content setting
\def\@contentfont{\songti\zihao{-4}}
\titlecontents{chapter}[0pt]{\@contentfont}
  {\thecontentslabel\hspace{.5em}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[15pt]{\@contentfont}
  {\thecontentslabel\quad}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[30pt]{\@contentfont}
  {\thecontentslabel\quad}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{%
  \if@mainmatter%
    \ifnum\arabic{chapter}>0%
      \arabic{chapter}\quad%
    \fi
  \fi#1}{}}
\fancyhf{}
\fancyhead[EC]{\songti\zihao{-5}\npu@rightmark}
\fancyhead[OC]{\songti\zihao{-5}\leftmark}
\fancyfoot[C]{\songti\zihao{5}\thepage}
\renewcommand{\headrule}{%
  \hrule width\headwidth height2.8pt \vspace{1pt}%
  \hrule width\headwidth height0.8pt}
\fancypagestyle{plain}{\thispagestyle{fancy}}
\newcommand{\clearpagestyle}{\clearpage{\pagestyle{empty}\cleardoublepage}}

% define var
\def\title{\@ifnextchar[\@@title{\@@title[]}}
\def\author{\@ifnextchar[\@@author{\@@author[]}}
\def\major{\@ifnextchar[\@@major{\@@major[]}}
\def\supervisor{\@ifnextchar[\@@supervisor{\@@supervisor[]}}
\def\applydate{\@ifnextchar[\@@applydate{\@@applydate[]}}

\def\@@title[#1]#2{\def\@title@en{#1}\def\@title{#2}}
\def\@@author[#1]#2{\def\@author@en{#1}\def\@author{#2}}
\def\@@major[#1]#2{\def\@major@en{#1}\def\@major{#2}}
\def\@@supervisor[#1]#2{\def\@supervisor@en{#1}\def\@supervisor{#2}} 
\def\@@applydate[#1]#2{\def\@applydate@en{#1}\def\@applydate{#2}}
\def\@title{} \def\@author{} \def\@major{} \def\@supervisor{} \def\@applydate{}

\def\schoolno#1{\def\@schoolno{#1}}\def\@schoolno{}
\def\classno#1{\def\@classno{#1}}\def\@classno{}
\def\secretlevel#1{\def\@secretlevel{#1}}\def\@secretlevel{}
\def\authorno#1{\def\@authorno{#1}}\def\@authorno{}
\def\support#1{\def\@support{#1}}\def\@support{}

% set normal font size
\renewcommand{\normalsize}{\zihao{-4}}
\linespread{1.5}

% cover
\def\makeoutercover{
  \begin{titlepage}
    \linespread{1.25}
    \begin{center}
      \bf
      \hfill
      \newlength{\max@length}
      \settowidth{\max@length}{\npu@schoolno\npu@comma 2000000000}
      \newlength{\name@length}
      \settowidth{\name@length}{\npu@schoolno}
      \begin{minipage}{\max@length}
        \makebox[\name@length][s]{\npu@schoolno}\npu@comma \@schoolno\\
        \makebox[\name@length][s]{\npu@classno}\npu@comma \@classno\\
        \makebox[\name@length][s]{\npu@secretlevel}\npu@comma \@secretlevel\\
        \makebox[\name@length][s]{\npu@authorno}\npu@comma \@authorno\\
      \end{minipage}
      \par\vspace{7cm}
      \zihao{1}
      \begin{minipage}[t]{2cm}
        \hfill\npu@title\\
      \end{minipage}
      %\hbox to 2.5cm{\hfill \npu@title}
      \setbox123=\hbox{
        \begin{minipage}[t]{10cm}
          \begin{center}
            \@title
          \end{center}
        \end{minipage} }
      \setbox124=\hbox{
        \begin{minipage}[t]{10cm}
          \begin{center}
            \uline{\hfill\quad\hfill}\\
            \uline{\hfill\quad\hfill}\\
          \end{center}
        \end{minipage} }
      \hskip-1cm
      \copy123\kern-\wd123\box124
      \par\vspace{4cm}
      \zihao{3}
      \begin{minipage}{5cm}
        {\kaishu\npu@author} \uline{\hfill\@author\hfill}
      \end{minipage}
      \par\vspace{3\baselineskip}
      \settowidth{\name@length}{\npu@applydate}
      \begin{minipage}{10cm}
        \noindent
        \makebox[\name@length][s]{\npu@major} \uline{\hfill\@major\hfill} \par
        \vspace{0.5\baselineskip}
        \makebox[\name@length][s]{\npu@supervisor} \uline{\hfill\@supervisor\hfill} \par
        \vspace{0.5\baselineskip}
        \makebox[\name@length][s]{\npu@applydate} \uline{\hfill\@applydate\hfill} \par
      \end{minipage}
      \vspace{2\baselineskip}
    \end{center}
  \end{titlepage}
  \clearpagestyle}

\def\makeinnercover@zh{
  \begin{titlepage}
    \linespread{1.25}
    \vspace*{2cm}
    \begin{center}
      \settowidth{\name@length}{\zihao{3}\npu@schoolname}
      \divide\name@length by 12 
      \multiply\name@length by 17
      \makebox[\name@length][s]{\zihao{3}\npu@schoolname}
      \vskip5mm
      \settowidth{\name@length}{\zihao{1}\npu@degree}
      \divide\name@length by 12 
      \multiply\name@length by 17
      \makebox[\name@length][s]{\zihao{1}\npu@degree}
      \vskip5mm
      \centerline{\zihao{4}\npu@degreeclass}
      \vskip5cm
      \zihao{2}
      \begin{minipage}[t]{2.5cm}
        \hfil\npu@title\npu@comma
      \end{minipage}
      \setbox123=\hbox{
        \begin{minipage}[t]{10cm}
          \begin{center}
            \@title
          \end{center}
        \end{minipage}}
      \setbox124=\hbox{
        \begin{minipage}[t]{10cm}
          \begin{center}
            \uline{\hfill\quad\hfill}\\
            \uline{\hfill\quad\hfill}\\
          \end{center}
        \end{minipage}}
      \hskip-1cm
      \copy123\kern-\wd123\box124
      \par\vspace{4cm}
      \zihao{3}
      \settowidth{\name@length}{\npu@major}
      \begin{minipage}{8cm}
        \noindent
        \makebox[\name@length][s]{\npu@author}\npu@comma\uline{\hfill\@author\hfill}\par
        \vspace{1\baselineskip}
        \makebox[\name@length][s]{\npu@major}\npu@comma\uline{\hfill\@major\hfill}\par
        \vspace{1\baselineskip}
        \makebox[\name@length][s]{\npu@supervisor}\npu@comma\uline{\hfill\@supervisor\hfill}\par
        \vspace{1\baselineskip}
      \end{minipage}
      \vspace{2\baselineskip}
      \par\makebox[30mm]{\@applydate}\hfill
    \end{center}
  \end{titlepage}
  \clearpagestyle}

\def\makeinnercover@en{
  \begin{titlepage}
    \linespread{1.25}
    \vspace*{1.5cm}
    \zihao{3}
    \begin{center}
      {\bf
        %\Large
        Title: \@title@en \\
        \vspace{3\baselineskip}
        \zihao{-3}
        By\\
        \@author@en \\
        \vspace{1\baselineskip}
        Under the Supervision of Professor\\
        \@supervisor@en\\}
      %\Large
      \vspace{4\baselineskip}
      A Dissertation Submitted to\\
      Northwestern Polytechnical University\\
      \vspace{1\baselineskip}
      In partial fulfillment of the requirement\\
      For the degree of\\
      Doctor of \@major@en\\
      \vspace{4\baselineskip}
      Xi'an P. R. China\\
      \@applydate@en
    \end{center}
  \end{titlepage}
  \clearpagestyle}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \vspace*{\fill}
  \begin{center}
    \Large This Page Intentionally Left Blank!
  \end{center}
  \vspace{\fill}
  \thispagestyle{empty}
  \newpage
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}

\newenvironment{abstract}{%
  \chapter{\npu@abstract}%\addcontentsline{toc}{chapter}{\npu@abstract}%
  \newenvironment{keywords}{%
    \vspace{2\baselineskip}\par\textbf{\npu@keywords\npu@comma}}{}
  }{\vfill\zihao{5}\@support}

\newenvironment{Abstract}{%
  \chapter{\npu@Abstract}%\addcontentsline{toc}{chapter}{\npu@Abstract}%
  \newenvironment{Keywords}{%
    \vspace{2\baselineskip}\par\textbf{\npu@Keywords\npu@comma}}{}}{}

\def\makecover{\makeoutercover\makeinnercover@zh\makeinnercover@en}
\let\npu@frontmatter\frontmatter
\def\frontmatter{\npu@frontmatter\pagenumbering{Roman}}

\let\npu@tableofcontents\tableofcontents
\def\tableofcontents{\npu@tableofcontents%
  \addcontentsline{toc}{chapter}{\npu@contents}}

\DeclareCaptionFont{song}{\songti\zihao{5}}
\captionsetup{labelsep=quad, font=song}
\setlength{\abovecaptionskip}{10pt}
\setlength{\belowcaptionskip}{10pt}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}

\let\npu@bibliographystyle\bibliographystyle
\def\bibliographystyle#1{%
  \addcontentsline{toc}{chapter}{\bibname}%
  \npu@bibliographystyle{#1}}

\def\Appendix{\chapter{\npu@appendix}}
\def\Thanks{\chapter{\npu@thanks}}
\def\Work{\chapter{\npu@work}}

\def\statement{
  \begin{titlepage}
    \linespread{1.5}
    \parskip=7pt
    \vspace*{0pt}
    \songti\zihao{4}
    \centerline{\bf \npu@schoolname}
    \centerline{\bf \npu@p@statement}
    \songti\zihao{5}
    \npu@longp@statement\par
    \npu@a@signature\npu@comma\underline{\qquad\qquad\qquad} \hfill
    \npu@s@signature\npu@comma\underline{\qquad\qquad\qquad} \par
    \hskip 3cm \npu@ymd \hfill\hskip 3cm \npu@ymd
    \vspace*{30pt}
    \hbox to \hsize{\leaders\hbox to 1em{\hss--\hss}\hfill}

    \vspace*{50pt}
    \songti\zihao{4}
    \centerline{\bf \npu@schoolname}
    \centerline{\bf \npu@c@statement}
    \songti\zihao{5}
    \npu@longc@statement\par
    \hskip5.5cm
    \hfill\npu@a@signature\npu@comma\underline{\qquad\qquad\qquad}\par
    \hfill\hskip8.5cm \npu@ymd
  \end{titlepage}}

\input{npuphd.cfg}

\endinput
