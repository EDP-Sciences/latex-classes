%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      edp-jp4  class for LaTeX2e                     %%
%%%      by  EDP Sciences                               %%
%%%      Version 1  December 1999                       %%
%%%      tex-support@edpsciences.com                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%%-----------------------------------------------------------------------------
%% --> THE CLASS OPTION MATERIAL
%%-----------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{edp-jp4}[2000/17/01 v1.2 EDP-Sciences]
\RequirePackage{cite}
\LoadClass[twoside]{article}
\PassOptionsToClass{twoside}{edp-jp4}
\relax
%
%%-----------------------------------------------------------------------------
%% --> THE TOP MATTER MATERIAL
%%-----------------------------------------------------------------------------
%
%===  maketitle
\renewcommand\maketitle{\par
  \begingroup
    \parindent \z@
    \let\@makefnmark\relax \let\@thefnmark\relax
    \@spcont
    \vbox{\hbox to\hsize{{\it\@NMJRNL@E}\hfill {\rm Pr\theproc-\thepage}}%
    \hbox{{\small \copyright{} EDP Sciences, Les Ulis}}}
    \@spcc
    \@maketitle
    \thispagestyle{plain}
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\and\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@title\@empty
  \normalfont\normalsize
}
\def\@maketitle{%
  \@settitle\@thanks\@setauthors
  }
%-A- Headings 
\def\@NMJRNL@E{J. Phys. IV France {\bf \thevol} {\rm (\number\year)}}%
\newcounter{vol}
\setcounter{vol}{1}
\def\Volume#1{\setcounter{vol}{#1}}
\newcounter{proc}
\setcounter{proc}{1}
\def\Proceedings#1{\setcounter{proc}{#1}}
\def\TitreGlobal#1{\global\def\@MSSG@TtrGlbl{#1}}
\def\FirstPage#1{\setcounter{page}{#1}}
%
%-B- title
\def\title#1{\global\def\@title{{#1}}
  \global\def\leftmark{\def\\{\ }#1}\global\def\rightmark{\@MSSG@TtrGlbl}}
\newbox\@b@rnngttl
\def\runningtitle#1{\global\setbox\@b@rnngttl=\hbox{\uppercase{#1}}
                    \ifdim\wd\@b@rnngttl>0.9\hsize\relax\else\global\def\@MSSG@rnnghd{\uppercase{#1}}\fi}
\def\@settitle{{\fontsize{14}{12}\selectfont\sffamily\bfseries\@title}\@pc\def\thanks##1{\unskip{}}}
%
%-C- authors and address
\def\@setauthors{\begingroup\trivlist
  \item\relax\fontsize{11}{13}\selectfont\rmfamily\@@th@rs\ignorespaces
  \institute{\box\@b@ddrss@}
  \endtrivlist\endgroup}
\def\email#1{{e-mail: \tt#1}}
\newcount\@c@thr@\@c@thr@=0
\def\author#1{\global\advance\@c@thr@ by 1
          \global\expandafter\edef\csname @thr@\romannumeral\@c@thr@\endcsname{#1}
          \global\expandafter\def\csname @ddrss@\romannumeral\@c@thr@\endcsname{}
          \global\expandafter\def\csname @scndddrss@\romannumeral\@c@thr@\endcsname{}
          \global\expandafter\def\csname @smddrss@\romannumeral\@c@thr@\endcsname{}}%\author
%    Elaborating the two author lists (First page and heading)
\newcount\@y\newcount\@x
\def\@cnjctn{\ifnum\the\@c@thr@=1\null\else{{\ and\ }}\fi}
\def\@@th@rs{\@x=0\global\@y=\@c@thr@\global\advance\@y by -1
\loop\advance\@x by 1
\ifnum\the\@x<\the\@y\csname  @thr@\romannumeral\@x\endcsname\ignorespaces
            ${}^{\csname  @ddrss@\romannumeral\@x\endcsname
                 \csname  @smddrss@\romannumeral\@x\endcsname
                 \csname  @scndddrss@\romannumeral\@x\endcsname}$,
\repeat
\csname  @thr@\romannumeral\@y\endcsname\ignorespaces
            ${}^{\csname  @ddrss@\romannumeral\@y\endcsname
                 \csname  @smddrss@\romannumeral\@y\endcsname
                 \csname  @scndddrss@\romannumeral\@y\endcsname}$\@cnjctn
\csname  @thr@\romannumeral\@c@thr@\endcsname\ignorespaces
            ${}^{\csname  @ddrss@\romannumeral\@c@thr@\endcsname
                 \csname  @smddrss@\romannumeral\@c@thr@\endcsname
                 \csname  @scndddrss@\romannumeral\@c@thr@\endcsname}$}%\@@th@rs
\def\@qq#1#2{\vrule height#1 depth#2 width0pt}
\def\@hspc{\kern1pt}
\def\@hspcc{\kern2pt}
\def\@hspccc{\kern3pt}
\def\@hspn{\kern-1.5pt}
\newcount\@c@ddrss@\newbox\@b@ddrss@
%
\def\@dd@ddrss@#1{%
\global\setbox51=\vbox{\unvbox\@b@ddrss@
  \vbox{\baselineskip=11pt\noindent{${}^{\the\@c@ddrss@}$\ }\@qq{11pt}{0pt}\textit{#1}}}
  \global\setbox\@b@ddrss@=\vbox{\unvbox51}}%
%
\def\@dd@scndddrss@#1{%
\global\setbox51=\vbox{\unvbox\@b@ddrss@
  \vbox{\baselineskip=11pt\noindent{${}^{\the\@c@ddrss@}$\ }\@qq{11pt}{0pt}\textit{#1}}}
  \global\setbox\@b@ddrss@=\vbox{\unvbox51}}
%
\def\address#1{\global\advance\@c@ddrss@ by 1\@dd@ddrss@{#1}
  \expandafter\edef\csname @ddrss@\romannumeral\@c@thr@\endcsname{\@hspc\number\@c@ddrss@}}
\def\secondaddress#1{\global\advance\@c@ddrss@ by 1\@dd@scndddrss@{#1}
  \expandafter\edef\csname @scndddrss@\romannumeral\@c@thr@\endcsname%
{,\@hspcc\number\@c@ddrss@}}%\secondaddress#1
\def\sameaddress#1{\expandafter\edef\csname @smddrss@\romannumeral\@c@thr@\endcsname{\@hspc{}#1}}
\def\institute#1{\@pc\normalsize\ignorespaces{#1}\@pc}

%
%-D- first page odf the paper : \@setbegin
\def\ps@plain{
  \def\@evenhead{}%
  \def\@oddhead{}%
  \def\@evenfoot{}%
  \def\@oddfoot{}
}
%
%-E- footnote and thanks
\addtolength{\skip\footins}{12pt}
\def\thanks#1{\protected@xdef\@thanks{\@thanks
        \protect\footnotetext[0]{#1}}%
}
%-F- figures
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
%-G- abstract
\renewenvironment{abstract}{%
        \small\@pc\begin{center}%
          {\section*{\abstractname}\vspace*{-1em}}%
        \end{center}\quotation\noindent\ignorespaces}{\endquotation\@pc}
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
{\fontsize{10}{12}\selectfont\sffamily\bfseries\uppercase}}
%
\renewcommand{\subsection}{\@startsection%
{subsection}
{2}
{\z@ }
{-3.25ex\@plus -1ex \@minus -.2ex}
{1.5ex \@plus .2ex}
{\fontsize{10}{13}\selectfont\sffamily\bfseries}}
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
\def\Appendix{\section*{Appendix}
\renewcommand{\theequation}{\Alph{section}.\arabic{equation}}
  \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}\appendix\null}
%%-----------------------------------------------------------------------------
%% --> METRIC DATA
%%-----------------------------------------------------------------------------
\setlength\oddsidemargin {-30pt}\setlength\evensidemargin{-30pt}
\setlength{\textwidth}{144mm}\setlength{\textheight}{207mm}
\headheight=12.45pt
%- espaces
\def\@pc{\vskip2mm plus 0mm minus1mm}
\def\@spc{\vskip8mm plus 0mm minus3mm}
\def\@spcx{\vskip13mm plus 0mm minus3mm}
\def\@spcc{\vskip32mm plus 0mm minus 3mm}
\def\@spcont{\vspace*{-42pt}}
\def\@boat#1#2{\setbox50=\null\ht50=#1\dp50=#2\box50}
%%-----------------------------------------------------------------------------
%% --> MESSAGES
%%-----------------------------------------------------------------------------
\def\@MSSG@TtrGlbl{JOURNAL DE PHYSIQUE IV}
\def\@MSSG@rnnghd{WILL BE SET BY THE PUBLISHER}
%%-----------------------------------------------------------------------------
%% --> HEAD and FOOT
%%-----------------------------------------------------------------------------
\def\ps@headings{\ps@empty
  \def\@evenhead{\normalfont\normalsize{{\rm Pr\theproc-\thepage}}\hfil \rightmark{}{}\hfil}%
  \def\@oddhead{\hfil\normalfont\normalsize\@MSSG@rnnghd\hfil{\rm Pr\theproc-\thepage}}%
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
%
\normalsize
\endinput

