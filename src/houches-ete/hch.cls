%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      hch  class for LaTeX2e                         %%
%%%      Pierre Damphousse                              %%
%%%      for EDP Sciences                               %%
%%%      Version 1.1.  April 1999                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%%-----------------------------------------------------------------------------
%% --> THE CLASS OPTION MATERIAL
%%-----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hch}[1999/11/01 v1.1 EDP-Sciences]
\RequirePackage{cite}
\LoadClass[twoside]{article}
\PassOptionsToClass{twoside}{hch}
\relax
%
%%-----------------------------------------------------------------------------
%% --> THE TOP MATTER MATERIAL
%%-----------------------------------------------------------------------------
%
%===  maketitle
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \@maketitle
    \thispagestyle{plain}
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@authorsup\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\authorsup\relax
  \global\let\date\relax
  \global\let\and\relax
  \normalfont\normalsize
}
\def\@maketitle{%
  \thispagestyle{empty}
  \vbox{\@setcourse\@settitle\@setauthors\@setphoto}
  \@setcontents
  \@setbegin}
%%
\def\date#1{\relax}
%
%-A- course 
\def\Course#1{\global\def\@MSSG@Crs{COURSE #1}}
\def\Seminar#1{\global\def\@MSSG@Smnr{SEMINAR #1}\@seminartrue}
\newif\if@seminar
\@seminarfalse
\def\@setcourse{\null\@spcc\begin{center}\fontsize{10}{12}\selectfont\if@seminar{\rmfamily\@MSSG@Smnr}%
\else{\rmfamily\@MSSG@Crs}\fi\end{center}\@spcc}
%
%-B- title
\def\title#1{\global\def\@title{\uppercase{#1}}\global\def\@title@@{\uppercase{#1}}
  \global\def\leftmark{\def\\{\ }#1}\global\def\rightmark{\@MSSG@TtrGlbl}}
\newbox\@b@rnngttl
\def\runningtitle#1{\global\setbox\@b@rnngttl=\hbox{#1}
                    \ifdim\wd\@b@rnngttl>0.9\hsize\relax\else\global\def\@MSSG@rnnghd{#1}\fi}
\def\@settitle{\def\thanks##1{\unskip{}}\begin{center}\fontsize{12}{15}\selectfont\sffamily\bfseries
              \@title\end{center}\@spc}
%
%-C- authors and address
\newcount\@c@thrs\newdimen\@d@thrs
%
\def\@thri{\relax}\def\@thrii{\relax}
\def\@ddrssi{\relax}\def\@ddrssii{\relax}
\def\@thrhdngi{\relax}\def\@thrhdngii{\relax}
%
\def\author#1{%
  \global\advance\@c@thrs by 1
  \global\expandafter\def\csname @thr\romannumeral\@c@thrs\endcsname{\hbox to0.48\hsize{%
    \fontsize{11}{13}\selectfont\rmfamily\hfill\uppercase{#1}\hfill}}
  \global\expandafter\def\csname @thr@@\romannumeral\@c@thrs\endcsname{{\fontsize{11}{13}\selectfont\rmfamily#1}}
  \global\expandafter\def\csname @thrhdng\romannumeral\@c@thrs\endcsname{#1}}
\def\authorsup#1{\def\@authorsup{#1}}
\let\@authorsup\@empty
%
\def\address#1{%
\global\expandafter\def\csname @ddrss\romannumeral\@c@thrs\endcsname{%
\vtop{\fontsize{9}{11}\selectfont
\hsize=0.48\hsize \begin{center}{\itshape #1}\end{center}}}}
\def\inst{\@ifnextchar[{\@instF}{\@instf}}
\def\@instF[#1]#2{\unskip$^{#2}$\footnotetext[#2]{#1}}
\def\@instf#1{\unskip$^{#1}$}
\def\fnmsep{$^,$}
%
\def\@setauthors{%
\ifnum\the\@c@thrs=1
{\global\@d@thrs=0.26\hsize\global\def\@thrs@@{\@thr@@i}}\else
{\global\@d@thrs=0.02\hsize\global\def\@thrs@@{\@thr@@i{} and \@thr@@ii}}\fi
\halign{\hskip\@d@thrs\hfil##\hfil \cr \@thri\@thrii\cr \@ddrssi\@ddrssii\cr}}
%
%-D- photo
\def\@setphoto{\@spcc\hbox to\hsize{\hfill
\vbox{\offinterlineskip\hsize=11cm\hrule
\hbox to11cm{\vrule\hfill\@boat{3.75cm}{3.75cm} PHOTO: height 7.5cm, width 11cm\hfill\vrule}
\hrule}\hfill}
\vskip-50pt}
%
%-E- contents
%
\def\@setcontents{\newpage\pagestyle{empty}\null\@spcont
\fontsize{9}{11}\selectfont\rmfamily\tableofcontents}
%
%-F- first page odf the paper : \@setbegin
\def\ps@plain{
  \def\@evenhead{}%
  \def\@oddhead{}%
  \def\@evenfoot{}%
  \def\@oddfoot{\hbox to\hsize{\hfill\lower-15pt\hbox{\fontsize{8}{10}\selectfont\rmfamily
\copyright{} EDP Sciences, Springer-Verlag 1999}}}
}
\def\@setbegin{\newpage\null\@spc%
\begin{center}\fontsize{12}{15}\selectfont\sffamily\bfseries\@title@@\end{center}
  \@thanks 
  \renewcommand\thefootnote{\arabic{footnote}}%
  \fontsize{11}{13}\selectfont\rmfamily
  \ifx\@empty\@authorsup
  \@spc\begin{center}\@thrs@@\end{center}\@spcx\else
  \@spc\begin{center}\@authorsup\end{center}\@spcx\fi}%
%
%-G- footnote and thanks
\addtolength{\skip\footins}{12pt}
\def\thanks#1{\protected@xdef\@thanks{\@thanks
        \protect\footnotetext[0]{\unskip\hskip-15pt#1}}%
}
%-H- figures
\renewcommand\figurename{Fig.}
\renewcommand\tablename{Table}
\def\fnum@figure{\figurename~\thefigure}
\def\fnum@table{\tablename~\thetable}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\small{\bf #1.}~#2}}%
  \ifdim \wd\@tempboxa >\hsize
    {\small{\bf #1.}~#2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%%%
%%-----------------------------------------------------------------------------
%% --> SECTIONING MATERIAL
%%-----------------------------------------------------------------------------
\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \footnotesize
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m\itemsep=0pt}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
%
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \sffamily\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
%
\renewcommand{\section}{\@startsection%
{section}%
{1}%
{\z@ }%
{-3.5ex \@plus -1ex \@minus -.2ex}%
{2.3ex \@plus .2ex}%
{\fontsize{10}{12}\selectfont\sffamily\bfseries}}
%
\renewcommand{\subsection}{\@startsection%
{subsection}
{2}
{\z@ }
{-3.25ex\@plus -1ex \@minus -.2ex}
{1.5ex \@plus .2ex}
{\fontsize{10}{13}\selectfont\sffamily\itshape}}
%
\renewcommand{\subsubsection}{\@startsection%
{subsubsection}
{3}{\z@ }
{-3.25ex\@plus -1ex \@minus -.2ex}
{1.5ex \@plus .2ex}
{\sffamily\normalfont}}
%
\@addtoreset{equation}{section}
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}
\def\Appendix{\section*{Appendix}\addcontentsline{toc}{section}{Appendix}
\renewcommand{\theequation}{\Alph{section}.\arabic{equation}}
  \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}\appendix\null}
%%-----------------------------------------------------------------------------
%% --> METRIC DATA
%%-----------------------------------------------------------------------------
\setlength\oddsidemargin {-30pt}\setlength\evensidemargin{-30pt}
\setlength{\textwidth}{115mm}\setlength{\textheight}{184mm}
\headheight=12.45pt
\setcounter{tocdepth}{2}
\overfullrule=10pt
%- espaces
\def\@spc{\vskip8mm plus 0mm minus3mm}
\def\@spcx{\vskip13mm plus 0mm minus3mm}
\def\@spcc{\vskip18mm plus 0mm minus 3mm}
\def\@spcont{\vspace*{-30pt}}
\def\@boat#1#2{\setbox50=\null\ht50=#1\dp50=#2\box50}
%%-----------------------------------------------------------------------------
%% --> MESSAGES
%%-----------------------------------------------------------------------------
\def\@MSSG@TtrGlbl{The title will be set by the publisher.}
\def\@MSSG@Crs{COURSE 1}
\def\@MSSG@rnnghd{Give a shorter title using $\backslash${\tt runningtitle}}
%%-----------------------------------------------------------------------------
%% --> HEAD and FOOT
%%-----------------------------------------------------------------------------
\def\ps@headings{\ps@empty
  \def\@evenhead{\normalfont\normalsize{\normalsize\thepage}\hfil \rightmark{}{}\hfil}%
  \def\@oddhead{\normalfont\hfil\ifvoid\@b@rnngttl
         \setbox60=\hbox{\normalsize\normalfont\@thrhdngi\ifnum\the\@c@thrs=1\relax
                         \else,\fi\@thrhdngii: \leftmark{}{}}% here \fi :\ifnum\the\@c@thrs=1
         \ifdim\wd60>0.9\hsize{\@MSSG@rnnghd}\else\box60\fi%(\ifdim\wd60>0.9\hsize)
                                \else\@MSSG@rnnghd\fi% (\ifvoid\@b@rnngttl)
  \hfil{\normalsize{\thepage}}}%\@oddhead
  \let\@mkboth\markboth}
%
\def\ps@myheadings{\ps@headings\let\@mkboth\@gobbletwo}
\pagestyle{headings}
%%-----------------------------------------------------------------------------
%% --> FLOAT
%%-----------------------------------------------------------------------------
\setcounter{topnumber}{2}
\renewcommand\topfraction{.95}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.7}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.05}
\renewcommand\floatpagefraction{.95}
%%-----------------------------------------------------------------------------
%% --> ACKNOWLEDGEMENT
%%-----------------------------------------------------------------------------
% Define `acknowledgement' environment
\def\acknowledgements{\par\addvspace{17pt}\footnotesize\rmfamily\trivlist\item[]}
\def\endacknowledgements{\endtrivlist\addvspace{6pt}}
%
%-->  LATIN ABBREVIATIONS
%................ ................ ................ ................  ................
\def\cf{\emph{cf.\/}}\def\ie{\emph{i.e.\/}}\def\etc{etc.}
\def\apriori{\emph{a priori\/}}\def\afortiori{\emph{a fortiori\/}}
\def\loccit{\emph{a loc. cit.\/}}\def\etal{\emph{et al.\/}}
\def\vg{\emph{v.g.\/}}
\def\TitreGlobal#1{\global\def\@MSSG@TtrGlbl{#1}}
%\def\@setphoto{\@spcc\hbox to\hsize{\hfill
% \vbox{\hsize=11cm\hbox to11cm{\hfill\@boat{3.5cm}{3.5cm}\hfill}}
% \hfill}}
\def\FirstPage#1{\setcounter{page}{#1}}
%--> MACROS FOR MATHEMATICS
%................ ................ ................ ................  ................
\def\xQuaternion{\mathbb{H}} \def\xC{\mathbb{C}} \def\xR{\mathbb{R}}
\def\xQ{\mathbb{Q}} \def\xZ{\mathbb{Z}} \def\xN{\mathbb{N}}
\def\xP{\mathbb{P}} \def\xA{\mathbb{A}}
%--
\def\xCzero{{\rm C}^{0}}
\def\xCone{{\rm C}^{1}} 
\def\xCtwo{{\rm C}^{2}} 
\def\xCinfty{{\rm C}^{\infty}} 
\def\xCn#1{{\rm C}^#1}
%--
\def\xHzero{{\rm H}^{0}}
\def\xHone{{\rm H}^{1}}
\def\xHtwo{{\rm H}^{2}} 
\def\xHinfty{{\rm H}^{\infty}}
\def\xHn#1{{\rm H}^#1}
%
\def\xWzero{{\rm W}^{0}}
\def\xWone{{\rm W}^{1}}
\def\xWtwo{{\rm W}^{2}} 
\def\xWinfty{{\rm W}^{\infty}}
\def\xWn#1{{\rm W}^#1}
%
\def\xLzero{{\rm L}^{0}}
\def\xLone{{\rm L}^{1}}
\def\xLtwo{{\rm L}^{2}} 
\def\xLinfty{{\rm L}^{\infty}} 
\def\xLn#1{{\rm L}^#1}
%-- 
\def\xDif{{\rm D}}
\def\xdif{\,{\rm d}}
%-- 
\def\xdrv#1#2{\frac{{\rm d}#1}{{\rm d}#2}}%  "d#1 over d#2"
\def\xDrv#1#2{\frac{{\rm d}}{{\rm d}#2}#1}%  "d   over d#2  #1"
%--
\def\xker{\mathop{\rm ker\,}\nolimits}
\def\xcoker{\mathop{\rm coker\,}\nolimits}
\def\xim{\mathop{\rm im\,}\nolimits}
\def\xcoim{\mathop{\rm coim\,}\nolimits}
\def\xdim{\mathop{\rm dim\,}\nolimits}
\def\xcodim{\mathop{\rm codim\,}\nolimits}
\def\xtr{\mathop{\rm tr\,}\nolimits}
\def\xHom{\mathop{\rm Hom\,}\nolimits}
\def\xExt{\mathop{\rm Ext\,}\nolimits}
\def\xTor{\mathop{\rm Tor\,}\nolimits}
%--
\def\xGL{\mathop{\rm GL\,}\nolimits}
\def\xSL{\mathop{\rm SL\,}\nolimits}
\def\xPSL{\mathop{\rm PSL\,}\nolimits}
\def\xSO{\mathop{\rm SO\,}\nolimits}
\def\xSU{\mathop{\rm SU\,}\nolimits}
%
\normalsize
\endinput
