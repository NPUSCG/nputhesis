\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nwpu}[2014/07/03 v0.01 NWPU]

\newif\iftw@side \tw@sidefalse
\DeclareOption{twoside}{%
    \global\tw@sidetrue{}%
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass{book}

\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage{footmisc,bm}
\RequirePackage{geometry}  % 版面修改
\RequirePackage{ctexcap}  % 中文标题 包含 CTEX
\RequirePackage{CJKulem} % 中文下划线 支持中文断行的下划线
\RequirePackage{fancyhdr} % 页脚页眉
\RequirePackage{caption}   % 使用该宏包产生警告 忽略
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{titletoc}
\RequirePackage{times}
\RequirePackage{mathptmx}
%\RequirePackage{color}

% 页边距设置
\geometry{paperwidth=210mm,paperheight=297mm,left=2.5cm,right=2.5cm,top=2.54cm,bottom=2.54cm}%
%\paperwidth=210mm
%\paperheight=297mm
%\textwidth=160mm
%\textheight=246.2mm
\topmargin=-10.4mm%
\headheight=17pt%
\footskip=8mm%
\headsep=5mm%
\iftw@side %
    \setlength{\oddsidemargin}{\oddsidemargin + 20pt} %
    \setlength{\evensidemargin}{\evensidemargin - 20pt} %
\fi

% 设置全文默认字号  TODO
\renewcommand{\normalsize}{\zihao{-4}}
\linespread{1.5}  % 参考书上说是用1.25表示1.5倍行距

% 标题设置
\CTEXsetup[name={,}, number={\arabic{chapter}},beforeskip={20pt}, afterskip={20pt}]{chapter}
\CTEXsetup[nameformat={\heiti\zihao{3}\bf}]{chapter}
\CTEXsetup[titleformat={\heiti\zihao{3}}]{chapter}
\CTEXsetup[format={\heiti\zihao{4}}]{section}
\CTEXsetup[format={\heiti\zihao{-4}}]{subsection}

\def\confont{\songti\zihao{-4}}
% 目录设置
\titlecontents{chapter}[0pt]{\confont}
    {\thecontentslabel\hspace{.5em}}{}{\hspace{.5em}\titlerule*{.}\contentspage}
%\titlecontents{chapter}[3em]{\vspace{3mm}\confont}{\thecontentslabel}%
%                {\thecontentslabel}{\titlerule*[0.5pc]{$\cdot$}\confont\contentspage}
\titlecontents{section}[15pt]{\confont}
    {\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[30pt]{\confont}
    {\thecontentslabel\quad}{}{\hspace{.5em}\titlerule*{.}\contentspage}
% 页眉 页脚
\pagestyle{fancy}

% 该句只能放在 \pagestyle{fancy} 之后否则不启作用
% 参考： http://bbs.ctex.org/forum.php?mod=viewthread&tid=59087
\renewcommand{\chaptermark}[1]{\markboth{%
    \if@mainmatter %
        \ifnum\arabic{chapter}>0 %
            \arabic{chapter}\quad %
        \fi%
    \fi#1}{}}
\fancyhf{}
\fancyhead[EC]{\songti\zihao{-5}西北工业大学博士学位论文}
\fancyhead[OC]{\songti\zihao{-5}\leftmark}
\fancyfoot[C]{\songti\zihao{5}\thepage}
\renewcommand{\headrule}{%
    \hrule width\headwidth height1.2pt \vspace{1pt}%
    \hrule width\headwidth}
\fancypagestyle{plain}{\thispagestyle{fancy}} % 为章节首页添加页眉
% 清除章节后空白页的页眉
\newcommand{\clearpagestyle}{\clearpage{\pagestyle{empty}\cleardoublepage}}

% 中文封面
\def\titleC#1#2{\def\@titleC{#1}\def\@titleCN{#2}}
\def\@titleC{}
\def\@titleCN{}
\def\authorC#1{\def\@authorC{#1}}\def\@authorC{}
\def\majorC#1{\def\@majorC{#1}}\def\@majorC{}
\def\supervisorC#1{\def\@supervisorC{#1}}\def\@supervisorC{}
\def\dateC#1{\def\@dateC{#1}}\def\@dateC{}

\def\classno#1{\def\@classno{#1}}\def\@classno{}
\def\secretlevel#1{\def\@secretlevel{#1}}\def\@secretlevel{}
\def\authorno#1{\def\@authorno{#1}}\def\@authorno{}

\def\makecoverO{
    \begin{titlepage}
        \linespread{1.25}
        \begin{center}
            \bf
            \hfill
            \newlength{\Mycode} \settowidth{\Mycode}{学校代码：2000000000}
            \newlength{\Name} \settowidth{\Name}{学校代码}
            \begin{minipage}{\Mycode}
                \makebox[\Name][s]{学校代码}：10699 \\
                \makebox[\Name][s]{分类号}：\@classno \\
                \makebox[\Name][s]{密级}：\@secretlevel \\
                \makebox[\Name][s]{学号}：\@authorno \\
            \end{minipage}
            \par\vspace{7cm}
            \zihao{1}
            \begin{minipage}[t]{2.5cm}
                ~题~目:
            \end{minipage}
            \begin{minipage}[t]{12cm}
                \begin{center}
                    \uline{\hfill\@titleC\hfill} \\
                    \ifthenelse{\isundefined{\@titleCN}}{%
                        \uline{\hfill\quad\hfill}}
                        {\uline{\hfill\@titleCN\hfill}}
                \end{center}
            \end{minipage}
            \par\vspace{4cm}
            \zihao{3}
            \begin{minipage}{7cm}
                作\qquad 者：\uline{\hfill\@authorC\hfill}
            \end{minipage}
            \par\vspace{3\baselineskip}
            \newlength{\Lname} \settowidth{\Lname}{申请学位日期}
            \begin{minipage}{10cm}
                \noindent
                \makebox[\Lname][s]{学科专业}：\uline{\hfill\@majorC\hfill} \par
                \vspace{0.5\baselineskip}
                \makebox[\Lname][s]{指导教师}：\uline{\hfill\@supervisorC\hfill} \par
                \vspace{0.5\baselineskip}
                \makebox[\Lname][s]{申请学位日期}：\uline{\hfill\@dateC\hfill} \par
            \end{minipage}
            \vspace{2\baselineskip}
        \end{center}
    \end{titlepage}
    \clearpagestyle
}

\def\makecoverC{
    \begin{titlepage}
    \linespread{1.25}
        \vspace*{2cm}
        \begin{center}

                \centerline{\zihao{3} 西~北~工~业~大~学}
            \vspace{5mm}
                \centerline{\zihao{1} 博~士~学~位~论~文}
            \vspace{3cm}
            \zihao{2}
            \begin{minipage}[t]{2cm}
                题~目:
            \end{minipage}
            \begin{minipage}[t]{10cm}
                \begin{center}
                    \uline{\hfill\@titleC\hfill} \\
                    \ifthenelse{\isundefined{\@titleCN}}{%
                        \uline{\hfill   \hfill}}
                        {\uline{\hfill\@titleCN\hfill}}
                \end{center}
            \end{minipage}
            \par\vspace{6cm}
            \zihao{3}
            \begin{minipage}{8cm}
                \noindent
                作\qquad 者：\uline{\hfill\@authorC\hfill}\par
                \vspace{1\baselineskip}
                学科专业：\uline{\hfill\@majorC\hfill}\par
                \vspace{1\baselineskip}
                指导教师：\uline{\hfill\@supervisorC\hfill}\par
            \end{minipage}
            \vspace{2\baselineskip}
            \par\makebox[30mm]{\@dateC}\hfill
        \end{center}
    \end{titlepage}
    \clearpagestyle
}

% 英文封面
\def\titleE#1{\def\@titleE{#1}}\def\@titleE{}
\def\authorE#1{\def\@authorE{#1}}\def\@authorE{}
\def\majorE#1{\def\@majorE{#1}}\def\@majorE{}
\def\supervisorE#1{\def\@supervisorE{#1}}\def\@supervisorE{}
\def\dateE#1{\def\@dateE{#1}}\def\@dateE{}

\def\makecoverE{
    \begin{titlepage}
    \linespread{1.25}
        \vspace*{1.5cm}
        \begin{center}
            {\bf\Large
            %\vspace{2\baselineskip}
            \@titleE \\
            \vspace{3\baselineskip}
            By \\
            \@authorE \\
            \vspace{1\baselineskip}
            Under the Supervision of Professor \\
            \@supervisorE }\\
            \Large
            \vspace{3\baselineskip}
            A Dissertation Submitted to \\
            Northwestern Polytechnical University \\
            \vspace{3\baselineskip}
            In partial fulfillment of the requirement\\
            For the degree of \\
            Doctor of \@majorE \\
            \vspace{3\baselineskip}
            Xi’an P. R. China \\
            \@dateE
        \end{center}
    \end{titlepage}
    \clearpagestyle
}

\def\makecover{\makecoverO\makecoverC\makecoverE}

% 中文摘要
\newenvironment{abstract}{%
  \chapter{摘 \quad 要}%\addcontentsline{toc}{chapter}{摘要}
    \newenvironment{keyword}{%
    \vspace{2\baselineskip}\par\textbf{关键词: }}{}}
  {\par}

% 英文摘要
\newenvironment{abstractE}{%
  \chapter{Abstract}%\addcontentsline{toc}{chapter}{Abstract}
    \newenvironment{keywordE}{%
    \vspace{2\baselineskip}\par\textbf{Keywords: }}{}}
  {\par}

% 表格
%\DeclareCaptionLabelFormat{bf-parens}{(\textbf{#2})}
\DeclareCaptionFont{song}{\songti\zihao{5}}
\captionsetup{labelsep=quad, font=song}
\renewcommand\thetable{\arabic{chapter}--\arabic{table}}
\setlength{\abovecaptionskip}{10pt}
\setlength{\belowcaptionskip}{10pt}

\renewcommand\thefigure{\arabic{chapter}--\arabic{figure}}
\renewcommand\theequation{\arabic{chapter}--\arabic{equation}}

% 设置线宽
\makeatletter
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
  \reserved@a\@xhline}
\makeatother
% 定义三线格式表格上下线宽度
\def\topline{\hlinewd{1pt}}
\def\bottomline{\hlinewd{1pt}}



\def\statement{
    \begin{titlepage}
        \linespread{1.5}
        \parskip=7pt
        \vspace*{0pt}
        \songti\zihao{4}
        \centerline{\bf 西北工业大学}
        \centerline{\bf 学位论文知识产权声明书}
        \songti\zihao{5}
        本人完全了解学校有关保护知识产权的规定，即：研究生在校攻读学位期间论
        文工作的知识产权单位属于西北工业大学。学校有权保留并向国家有关部门或机构送交论文的复印件和电
        子版。本人允许论文被查阅和借阅。学校可以将本学位论文的全部或部分内容编入有关数据
        库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。同时本人保证，
        毕业后结合学位论文研究课题再撰写的文章一律注明作者单位为西北工业大学。

        保密论文待解密后适用本声明。

        学位论文作者签名: \underline{\qquad\qquad\qquad} \qquad
        指导教师签名: \underline{\qquad\qquad\qquad}

        \hskip 3cm 年 \qquad 月 \qquad 日 \hskip 3cm 年 \qquad  月 \qquad  日

        \vspace*{30pt}
        \hrule
        \vspace*{50pt}
        \songti\zihao{4}
        \centerline{\bf 西北工业大学}
        \centerline{\bf 学位论文原创性声明}
        \songti\zihao{5}
        秉承学校严谨的学风和优良的科学道德，本人郑重声明：所呈交的学位论文，
        是本人在导师的指导下进行研究工作所取得的成果。尽我所知，除文中已经
        注明引用的内容和致谢的地方外，本论文不包含任何其他个人或集体已经公
        开发表或撰写过的研究成果，不包含本人或其他已申请学位或其他用途使用
        过的成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式表明。

        本人学位论文与资料若有不实，愿意承担一切相关的法律责任。

        \hskip 5cm 学位论文作者签名：\underline{\qquad\qquad\qquad}

        \hskip 8cm 年 \qquad  月 \qquad  日
    \end{titlepage}
    %\clearpagestyle
}
