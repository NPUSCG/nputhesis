%% 
%% This is file `nputhesis.cls'.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nputhesis}[2018/04/21 v0.4 NPU]

\newif\if@npu@phd
\newif\if@npu@blankinfo
\newif\if@npu@multibib
\@npu@multibibfalse
\@npu@blankinfofalse
\DeclareOption{phd}{\@npu@phdtrue}
\DeclareOption{ma}{\@npu@phdfalse}
\DeclareOption{blankinfo}{\@npu@blankinfotrue}
\DeclareOption{multibib}{\@npu@multibibtrue}
\DeclareOption{UTF8}{\PassOptionsToPackage{\CurrentOption}{ctex}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{phd}
\ProcessOptions \relax
\LoadClass{book}

\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{caption}
\RequirePackage{ulem}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{setspace}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{graphicx}
\RequirePackage[heading=true,zihao=-4]{ctex}
\RequirePackage{ifxetex}
\ifxetex
  \setmainfont{Times New Roman}
\fi

\if@npu@multibib
  \RequirePackage{multibib}
\fi

\geometry{paperwidth=210mm,paperheight=297mm,%
  left=2.5cm,right=2.5cm,top=2.54cm,bottom=2.54cm}
\topmargin=-10.4mm
\headheight=17pt
\footskip=8mm
\headsep=5mm

\ifx\ctexset\undefined
  \CTEXsetup[name={,}, number={\arabic{chapter}},%
    beforeskip={20pt}, afterskip={20pt}]{chapter}
  \CTEXsetup[nameformat={\heiti\zihao{3}\bf}]{chapter}
  \CTEXsetup[titleformat={\heiti\zihao{3}}]{chapter}
  \CTEXsetup[format={\heiti\zihao{4}}]{section}
  \CTEXsetup[format={\heiti\zihao{-4}}]{subsection}
\else
  \ctexset{
    contentsname = {\npu@contents}
  }
  % title format of chapter
  \ctexset{
    chapter/name={,},
    chapter/number=\arabic{chapter},
    chapter/beforeskip={20bp},
    chapter/afterskip={20bp},
    chapter/format={\heiti\zihao{3}\centering}
  }
  % title format of section
  \ctexset{
    section/name={,},
    % section/beforeskip={10pt},
    % section/afterskip={0pt},
    section/format={\heiti\zihao{4}}
  }
  % title format of subsection
  \ctexset{
    subsection/name={,},
    % subsection/beforeskip={10pt},
    % subsection/afterskip={0pt},
    subsection/format={\heiti\zihao{-4}}
  }
\fi
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
\renewcommand\chaptermark[1]{\markboth{%
  \if@mainmatter%
    %\ifnum\arabic{chapter}>0%
      \arabic{chapter}\quad%
    %\fi%
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
\def\@title{}\def\@title@en{}
\def\@author{}\def\@author@en{}
\def\@major{}\def\@major@en{}
\def\@supervisor{}\def\@supervisor@en{}
\def\@applydate{}\def\@applydate@en{}
\def\npu@empty{}

\def\schoolno#1{\def\@schoolno{#1}}\def\@schoolno{}
\def\classno#1{\def\@classno{#1}}\def\@classno{}
\def\secretlevel#1{\def\@secretlevel{#1}}\def\@secretlevel{}
\def\authorno#1{\def\@authorno{#1}}\def\@authorno{}
\def\support#1{\def\@support{#1}}\def\@support{}

\if@npu@phd
  \def\npu@degreename@en{Doctor}
\else
  \def\npu@degreename@en{Master}
\fi

% set normal font size
\renewcommand{\normalsize}{\zihao{-4}}
\linespread{1.5}

% cover
\def\makeoutercover{
  \begin{titlepage}
    \linespread{1.25}
    \begin{center}
      \hfill\bf % default \bf font
      \newlength{\max@length}
      \settowidth{\max@length}{\npu@schoolno\npu@comma 2000000000}
      \newlength{\name@length}
      \settowidth{\name@length}{\npu@schoolno}
      \begin{minipage}{\max@length}
        \begin{tabular}{|c|c|}\hline
        \makebox[\name@length][s]{\npu@schoolno}   & \@schoolno    \\ \hline
        \makebox[\name@length][s]{\npu@classno}    & \@classno     \\ \hline
        \makebox[\name@length][s]{\npu@secretlevel}& \@secretlevel \\ \hline
        \makebox[\name@length][s]{\npu@authorno}   & \@authorno    \\ \hline
        \end{tabular}
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
        \makebox[\name@length][s]{\npu@major}%
          {\uline{\hfill{\@major}\hfill}}    \par
        \vspace{0.5\baselineskip}
        \makebox[\name@length][s]{\npu@supervisor}%
          {\uline{\hfill\@supervisor\hfill}} \par
        \vspace{0.5\baselineskip}
        \makebox[\name@length][s]{\npu@applydate}%
          {\uline{\hfill\@applydate\hfill}}  \par
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
        \makebox[\name@length][s]{\npu@author}\npu@comma%
          \uline{\hfill\@author\hfill}     \par
        \vspace{0.25\baselineskip}
        \makebox[\name@length][s]{\npu@major}\npu@comma%
          \uline{\hfill\@major\hfill}     \par
        \vspace{0.25\baselineskip}
        \makebox[\name@length][s]{\npu@supervisor}\npu@comma%
          \uline{\hfill\@supervisor\hfill}\par
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
        \ifx\@author@en\npu@empty\quad\else\@author@en\fi\\
        \vspace{1\baselineskip}
        Under the Supervision of Professor\\
        \ifx\@supervisor@en\npu@empty\quad\else\@supervisor@en\fi\\}
      %\Large
      \vspace{4\baselineskip}
      A Dissertation Submitted to\\
      Northwestern Polytechnical University\\
      \vspace{1\baselineskip}
      In partial fulfillment of the requirement\\
      For the degree of\\
      \npu@degreename@en\  of \@major@en\\
      \vspace{4\baselineskip}
      Xi'an P. R. China\\
      \@applydate@en
    \end{center}
  \end{titlepage}
  \clearpagestyle}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \hbox{}
  \vspace*{\fill}
  \begin{center}\Large
    \if@npu@blankinfo
      \textcolor{gray!60}{This Page Intentionally Left Blank!}
    \fi
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

\DeclareCaptionFont{song}{\songti\zihao{5}}  % command defined in package caption
\captionsetup{labelsep=quad, font=song}
\setlength{\abovecaptionskip}{10pt}
\setlength{\belowcaptionskip}{10pt}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}

\let\npu@chapter\chapter
\def\npu@star@chapter#1{\npu@chapter{#1}}
\def\chapter{\secdef\npu@chapter\npu@star@chapter}

\newcounter{npu@c@appendix}
\setcounter{npu@c@appendix}{0}
\def\Appendix{ \addtocounter{npu@c@appendix}{1}\chapter{\npu@appendix\Alph{npu@c@appendix}}}
\def\Thanks{\chapter{\npu@thanks}}

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

% ref amsthdoc.pdf
\newtheoremstyle{nputheorem}% name
  {0pt}% Space above
  {0pt}% Space below
  {\itshape}% Body font
  {}% Indent amount
  {\bfseries}% Theorem head font
  {}% Punctuation after theorem head
  {.5em}% Space after theorem head
  {}% Theorem head spec (can be left empty, meaning ‘normal’ )

\theoremstyle{nputheorem} % set default style to nputheorem

\input{nputhesis.cfg}

\if@npu@multibib
  \newcites{@work}{\npu@work}
  \newcommand\Work[3][nputhesis]{%
    \usecounter{enumiv}
    \nocite@work{#3}
    \bibliographystyle@work{#1}
    \bibliography@work{#2}
  }
\else
  \def\Work{\chapter{\npu@work}}
\fi

\endinput
