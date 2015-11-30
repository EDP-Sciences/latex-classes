%% This is file 'ifpen-ogst.cls'
%%
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\def\filedate{2015/11/30}
\def\fileversion{2.1}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ifpen-ogst}
              [\filedate\space v\fileversion\space
              ^^JLaTeX Class for Oil & Gas Science and Technology
              (JCC and EDP Sciences)]
%
% 1.0 2010/02/01 Première version
% 1.1 2011/03/10 \bibfont définit avec \def (à cause de certaines
%                versions de natbib.sty)
% 1.2 2011/04/19 Changement de nom de ifp-ogst.cls en ifpen-ogst.cls
%                Quelques détails de mises en page revus
\LoadClass[twoside, twocolumn]{article}
%
%%%%%%%%%%%%%%%%%%%%
%%% Class option %%%
%%%%%%%%%%%%%%%%%%%%
%
\DeclareOption{ascii}{%
  \def\ogst@input{\RequirePackage[ascci]{inputenc}}%
}
\DeclareOption{latin1}{%
  \def\ogst@input{\RequirePackage[latin1]{inputenc}}%
}
\DeclareOption{latin9}{%
  \def\ogst@input{\RequirePackage[latin9]{inputenc}}%
}
\DeclareOption{ansinews}{%
  \def\ogst@input{\RequirePackage[ansinews]{inputenc}}%
}
\DeclareOption{applemac}{%
  \def\ogst@input{\RequirePackage[applemac]{inputenc}}%
}
\DeclareOption{utf8}{%
  \def\ogst@input{\RequirePackage[utf8]{inputenc}}%
}
%
\DeclareOption{cm}{%
  \def\ogst@font{%
    \RequirePackage{textcomp}%
  }%
}
\DeclareOption{lm}{%
  \def\ogst@font{%
    \RequirePackage{lmodern}%
    \RequirePackage{textcomp}%
    \def\textcompsubstdefault{lm}%
  }
}
\DeclareOption{tx}{%
  \def\ogst@font{%
    \RequirePackage{txfonts}%
    \RequirePackage{textcomp}%
    \def\textcompsubstdefault{lm}%
  }%
}
%
\DeclareOption{english}{%
  \def\ogst@language{\RequirePackage[frenchb, english]{babel}}%
}
\DeclareOption{francais}{%
  \def\ogst@language{\RequirePackage[english, frenchb]{babel}}%
}
%
\DeclareOption{showoverfull}{\setlength\overfullrule{0pt}}
\DeclareOption{hideoverfull}{\setlength\overfullrule{5pt}}
%
\DeclareOption{bibnumber}{%
  \def\ogst@biblio{%
    \bibpunct{[}{]}{,}{n}{}{}%
    \def\@biblabel##1{##1}%
    \bibliographystyle{unsrtnat}%
    % Pour que cela fonctionne avec certaines versions de natbib, il
    % ne faut pas supposer que \bibfont préexiste
%    \renewcommand\bibfont{\@BibliographyFont}%
    \def\bibfont{\@BibliographyFont}%
    \setlength{\bibsep}{0pt}%
  }
}
\DeclareOption{bibauthoryear}{%
  \def\ogst@biblio{%
    \bibpunct{(}{)}{,}{a}{}{}%
    \bibliographystyle{unsrtnat}%
    % Pour que cela fonctionne avec certaines versions de natbib, il
    % ne faut pas supposer que \bibfont préexiste
%    \renewcommand\bibfont{\@BibliographyFont}%
    \def\bibfont{\@BibliographyFont}%
    \setlength{\bibsep}{0pt}%
  }%
}
%
% default options
\ExecuteOptions{tx,english,utf8,showoverfull,bibnumber}
%
\ProcessOptions
% Required packages
\RequirePackage{calc}
\RequirePackage[T1]{fontenc}
\ogst@input % input method (RequirePackage[<method>]{inputenc})
\ogst@font % font
\RequirePackage[official]{eurosym}
% one column = 84mm, columnsep = 6mm => textwidth = 84x2+6 = 174mm
\RequirePackage[dvips, a4paper, twocolumn, twoside,
                top=1in, textheight=230mm,
                left=16mm, textwidth=174mm, columnsep=6mm,
                marginpar=0in, marginparsep=0in,
                headheight=16pt, nofoot]{geometry}
% For amssymb (if txfonts is in use)
\let\iint\relax
\let\iiint\relax
\let\iiiint\relax
\let\idotsint\relax
\let\openbox\relax
%
\RequirePackage{amsmath, amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{cuted}
% To avoid error with dblfloatfix
\let\@setmarks\relax
\RequirePackage{graphicx}
\RequirePackage{url, enumerate}
\RequirePackage[sort&compress]{natbib}
\ogst@biblio
\RequirePackage{xspace}
\ogst@language % (RequirePackage[<languages>]{babel}
%
%%%%%%%%%%%%%%%%%
%%% Registers %%%
%%%%%%%%%%%%%%%%%
%
% common counter for theorem-like environments
%%%\newcounter{allthmlike}[section]
% number of \thanks
\newcount\@thankscpt
\newcommand\@thankssymbol{%
  \ifcase \@thankscpt
  \or *%
  \or **%
  \or ***%
  \or ****%
  \or *****%
  \or ******%
  \else
    \ClassError{ifpen-ogst}
               {You can't use more than 6 \noexpand\thanks}
               {For more than 6\noexpand\thanks, declare
                 \noexpand\letterthanks\space before.}
  \fi
}
\newcommand\letterthanks{%
  \def\@thankssymbol{%
    \@alph\@thankssymbol
  }%
}
\newcommand\fnsep{\unskip$^,$}
% number of institutes
\newcounter{@institutecpt}
% gap between caption and float
\newlength{\@figgap}
\setlength{\@figgap}{12pt}
% Total height of figure
\newlength{\@floatheight}
%
%%%%%%%%%%%%%%%%%%%%%%%%
%%% Predefined names %%%
%%%%%%%%%%%%%%%%%%%%%%%%
%
\addto\captionsfrench{%
  \def\proofname{Preuve}%
  \def\andname{, }%
  \def\andlastname{{} et }%
  \def\andtwoname{{} et }%
  \def\acknowledgementname{Remerciements}%
  \def\tablename{\MakeUppercase{Tableau}}%
  \def\correspondingauthorname{Auteur à contacter}%
  \def\@datereceiptname{Les dates de réception et d'acceptation}%
  \def\@dateacceptancename{seront indiquées par l'éditeur.}%
  \let\listFB\listORI \def\itemize{%
    \ifnum \@itemdepth >\thr@@\@toodeep \else \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter \list \csname\@itemitem\endcsname {%
      \setlength{\topsep}{0pt}%
      \setlength{\partopsep}{0pt}%
      \setlength{\itemsep}{0pt}%
      \setlength{\labelwidth}{9pt}%
      \setlength{\labelsep}{0pt}%
      \setlength{\itemindent}{0pt}%
      \setlength{\leftmargin}{9pt}%
      \def\makelabel##1{\rlap{##1}\hss}%
    }%
    \fi }%
} \addto\captionsenglish{%
  \def\proofname{Proof}%
  \def\andname{, }%
  \def\andlastname{{} and }% was {, and }
  \def\andtwoname{{} and }%
  \def\acknowledgementname{Acknowledgements}%
  \def\tablename{\MakeUppercase{Table}}%
  \def\correspondingauthorname{Corresponding author}%
  \def\@datereceiptname{The date of receipt and acceptance}%
  \def\@dateacceptancename{will be inserted by the editor.}%
  \renewcommand\labelitemi{--}%
  \renewcommand\labelitemii{--}%
  \renewcommand\labelitemiii{--}%
  \renewcommand\labelitemiv{--}%
  \def\itemize{%
    \ifnum \@itemdepth >\thr@@\@toodeep \else \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter \list \csname\@itemitem\endcsname {%
      \setlength{\topsep}{0pt}%
      \setlength{\partopsep}{0pt}%
      \setlength{\itemsep}{0pt}%
      \setlength{\labelwidth}{9pt}%
      \setlength{\labelsep}{0pt}%
      \setlength{\itemindent}{0pt}%
      \setlength{\leftmargin}{9pt}%
      \def\makelabel##1{\rlap{##1}\hss}%
    }%
    \fi }%
} \newcommand\CopyrightTitlename{%
  Copyright \copyright{} 2010 IFPEN Energies nouvelles%
} \newcommand\CopyrightBodyname{%
  Permission to make digital or hard copies of part or all of this
  work for personal or classroom use is granted without fee provided
  that copies are not made or distributed for profit or commercial
  advantage and that copies bear this notice and the full citation on
  the first page. Copyrights for components of this work owned by
  others than IFP Energies nouvelles must be honored. Abstracting with
  credit is permitted. To copy otherwise, to republish, to post on
  servers, or to redistribute to lists, requires prior specific
  permission and/or a fee: Request permission from Documentation, IFP
  Energies nouvelles, fax. +33 1 47 52 70 78, or
  \url{revueogst@ifpen.fr}.  }
\newcommand\HeadPagename{%
  Oil \& Gas Science and Technology --- Rev. IFP Energies nouvelles%
}
\newcommand\DOIname{%
  DOI: will be set by the publisher
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Font definitions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%
% baselineskip is always 1.2xfontsize
% no \small, \large and cie. in order to be as free as possible!
%
\newcommand\@HeadFont{\normalfont\fontsize{8pt}{9.6pt}\selectfont}
\newcommand\@HeadPageFont{\normalfont\normalsize}
\newcommand\@TitleFont{\normalfont\fontsize{22pt}{26.4pt}\sffamily\bfseries}
\newcommand\@SubtitleFont{\normalfont\fontsize{17pt}{20.4pt}\sffamily\bfseries}
\newcommand\@AuthorFont{\normalfont\fontsize{12pt}{14.4pt}\sffamily}
\newcommand\@InstituteFont{\normalfont\fontsize{8pt}{12}\sffamily\slshape}
\newcommand\@ThanksFont{\normalfont\fontsize{8pt}{9.6pt}\selectfont}
\newcommand\@ThanksEmail{\normalfont\fontsize{8pt}{9.6pt}\selectfont}
\newcommand\@FootnoteFont{\normalfont\fontsize{8pt}{9.6pt}\selectfont}
\newcommand\@EmailFont{\normalfont\fontsize{8pt}{9.6pt}\sffamily\slshape}
\newcommand\@ResumeTitleFont{\normalfont\normalsize\bfseries}
\newcommand\@ResumeFont{\normalfont\normalsize}
\newcommand\@AbstractTitleFont{\normalfont\normalsize\bfseries\itshape}
\newcommand\@AbstractFont{\normalfont\normalsize\itshape}
\newcommand\@SectionFont{\normalfont\normalsize\sffamily\bfseries}
\newcommand\@SubsectionFont{\normalfont\normalsize\sffamily\bfseries}
\newcommand\@SubsubsectionFont{%
  \normalfont\fontsize{9pt}{10.8pt}\sffamily\bfseries}
\newcommand\@ParagraphFont{\normalfont\normalsize\itshape}
\newcommand\@BibliographyFont{\normalfont\fontsize{9pt}{10.8pt}\selectfont}
\newcommand\@TitleTheoremFont{\normalfont\normalsize\bfseries}
\newcommand\@TitleAcknowledgementFont{\fontsize{9pt}{10.8pt}\itshape}
\newcommand\@TextAcknowledgementFont{%
  \normalfont\fontsize{9pt}{10.8pt}\selectfont}
\newcommand\@CaptionFont{\normalfont\fontsize{8pt}{9.6pt}\selectfont}
\newcommand\@CaptionTitleFont{}
\newcommand\@DatesFont{%
  \normalfont\fontsize{9pt}{10.8pt}\itshape
  \raggedleft
}
\newcommand\@CopyrightFont{\fontsize{8pt}{9.6pt}\itshape}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Length definitions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\setlength{\parskip}{0pt plus1pt}
\newlength{\@VSpaceBeforeTitle}
\setlength{\@VSpaceBeforeTitle}{2.5cm}
\newlength{\@VSpaceAfterTitle}
\setlength{\@VSpaceAfterTitle}{20pt}
\newlength{\@VSpaceBeforeInstitute}
\setlength{\@VSpaceBeforeInstitute}{10pt}
\newlength{\@VSpaceBeforeThanks}
\setlength{\@VSpaceBeforeThanks}{10pt}
\newlength{\@VSpaceBeforeEmail}
\setlength{\@VSpaceBeforeEmail}{10pt}
%
%%%%%%%%%%%%%%%%%%%
%%% header page %%%
%%%%%%%%%%%%%%%%%%%
%
\fancypagestyle{firstpage}{%
  \fancyhf{} % clear all
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
  \fancyhead[L]{%
    \minipage[t][\baselineskip]{\linewidth}
      \@HeadFont
      \itshape
      \HeadPagename\\
      \upshape
      \CopyrightTitlename\\
      \DOIname
    \endminipage
  }%
}
\fancypagestyle{otherpage}{%
  \fancyhf{} % clear all
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
  \fancyhead[LE]{\@HeadPageFont\thepage}%
  \fancyhead[CE]{%
    \@HeadFont
    \itshape
    \HeadPagename
  }%
  \fancyhead[RO]{\@HeadPageFont\thepage}%
  \fancyhead[CO]{%
    \@HeadFont
    \itshape
    \def\\{\unskip\space\ignorespaces}
    \@headerauthor\space/
    \@headertitle
  }%
}
\pagestyle{otherpage}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% One column introduction %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand\headnote[1]{\def\@headnote{#1}}
\renewcommand\title[2][]{%
  \ifx\relax#1\relax
    \def\@headertitle{#2}%
  \else
    \def\@headertitle{#1}%
  \fi
  \def\@title{#2}%
}
\newcommand\titlerunning[1]{\def\@titlerunning{#1}}
\newcommand\subtitle[1]{\def\@subtitle{#1}}
\renewcommand\author[1]{\def\@author{#1}}
\newcommand\authorrunning[1]{\def\@authorrunning{#1}}
\newcommand\offprints[1]{\def\@offprints{#1}}
\newcommand\institute[1]{\def\@institute{#1}}
% change 1.2
\renewcommand\abstract[1]{\def\@abstract{#1}}
\newcommand\resume[1]{\def\@resume{#1}}
% end change 1.2
% add 1.2
\newcommand\englishtitle[1]{{\@AbstractTitleFont #1~{\mdseries---}}}
\newcommand\frenchtitle[1]{{\@AbstractTitleFont #1~{\mdseries---}}}
% end add 1.2
\def\UrlFont{}
\newcommand\inst[1]{\unskip$^{#1}$\ignorespaces}
\DeclareUrlCommand\@email{\urlstyle{same}} % \@e-mail: \@email
\newtoks\@emailhook
\newtoks\@emptytoks
\newcommand\email[1]{%
  \@emailhook\expandafter{%
    \the\@emailhook
    \@email{#1} \and
  }%
}
\renewcommand\date[2]{
  \def\@datereceipt{#1}%
  \def\@dateacceptance{#2}%
}
%
% default values
\def\@headnote{}
\def\@title{%
  \ClassError{ifpen-ogst}
             {No title given}
             {You have to define a title with \noexpand\title{your title}.}
}
\def\@titlerunning{}
\def\@subtitle{}
\def\@author{%
  \ClassError{ifpen-ogst}
             {No author given}
             {You have to indicate author(s) with
               \noexpand\author{author name \noexpand\and\space author
               name ...}.}
}
\def\@authorrunning{}
\def\@offprints{}
\def\@institute{}
\def\@abstract{%
  \ClassError{ifpen-ogst}
             {No abstract given}
             {You have to define an abstract with
               \noexpand\abstract{your abstract (in english)}.}%
}
\def\@abstractsubtitle{}
\def\@resume{%
  \ClassError{ifpen-ogst}
             {No r'esum'e given}
             {You have to define an r'esum'e with
               \noexpand\resume{your abstract (in french)}.}%
}
\def\@resumesubtitle{}
\def\@datereceipt{\@datereceiptname}
\def\@dateacceptance{\@dateacceptancename}
%
% Parse authors, institutes, thanks, and email 
%
\def\@parseauthor{%
  \count@ \z@
  \expandafter\@countand\@author\and\@nil\and
  \gdef\@headerauthor{}%
  \def\@typeauthor{0}%
  \ifnum\count@=1\relax
    % no \and to process
    % one author in header
    \def\@typeauthor{1}%
  \else\ifnum\count@=2\relax
    % juste one \and
    \let\@andlastauthor\andtwoname
    % two author in header
    \def\@typeauthor{2}%
  \else % > 2
    % real list
    \let\@andauthor\andname
    \let\@andlastauthor\andlastname
    % one author et al. in header
    \def\@typeauthor{3}%
  \fi\fi
  \@AuthorFont
  \expandafter\@typesetauthor\@author\and\@nil\and
}
\def\@countand#1\and{%
  \def\@rg{#1}%
  \ifx\@rg\@nnil\else
    \advance\count@ \@ne
    \expandafter\@countand
  \fi
}
\def\@typesetauthor#1\and{%
  \def\@rg{#1}%
  \advance\count@ \m@ne
  \ifnum\count@>-1\relax
    % for header
    \ifnum\@typeauthor>0
      \@extractauthor
      \gdef\@headerauthor{\@currentheaderauthor}%
      \ifcase\@typeauthor
        % 0 impossible
        \or
        % 1 -> nothing to do
          % no more author
          \def\@typeauthor{0}%
        \or
        % 2 -> and
          \protected@xdef\@headerauthor{%
            \@headerauthor\space and
          }
          % add the next author
          \def\@typeauthor{-1}%
        \or
        % 3 -> et al.
          \protected@xdef\@headerauthor{%
            \@headerauthor\space et al.%
          }
          % no more author
          \def\@typeauthor{0}%
      \fi
    \else\ifnum\@typeauthor<0
      \@extractauthor
      \protected@xdef\@headerauthor{%
        \@headerauthor \@currentheaderauthor
      }
    \fi\fi
    % for first page
    \ifnum\count@=0\relax
       #1
    \else\ifnum\count@=1\relax
      #1\@andlastauthor
    \else
      #1\@andauthor
    \fi\fi
    \expandafter\@typesetauthor
  \fi
}
\def\@extractauthor{%
  % examine \@rg = <first name> <name>
  % exctract first letter of <first name>
  % and add <name>. Result in \@currentheaderauthor
  \def\@currentheaderauthor{}%
  \expandafter\@@extractauthor\@rg\inst\thanks\@nil
}
\def\@@extractauthor#1#2 #3\inst#4\thanks#5\@nil{%
  \def\@currentheaderauthor{#1 #3}%
}
%
\def\@parseinstitute{%
  \count@ \z@
  \expandafter\@countand\@institute\and\@nil\and
  \setcounter{@institutecpt}{0}%
  \@InstituteFont
  \expandafter\@typesetinstitute\@institute\and\@nil\and
}
\def\@typesetinstitute#1\and{%
  \def\@rg{#1}%
  \advance\count@ \m@ne
  \refstepcounter{@institutecpt}%
  \ifnum\count@>-1\relax
    \the@institutecpt\space\space #1\\
    \expandafter\@typesetinstitute
  \fi
}
%
\def\@parseemail{%
  \count@ \z@
  \expandafter\@countand\the\@emailhook\@nil\and
  \setcounter{@institutecpt}{0}%
  \@EmailFont
  e-mail: \null
  \expandafter\@typesetemail\the\@emailhook\@nil\and
}
\def\@typesetemail#1\and{%
  \def\@rg{#1}%
  \advance\count@ \m@ne
  \refstepcounter{@institutecpt}%
  \ifnum\count@>-1\relax
    \ifnum\count@=0\relax
      \unskip#1
    \else
     \unskip#1\unskip\space---\space\null 
    \fi
    \expandafter\@typesetemail
  \fi
}
%
\newenvironment{abstract@margin}
{%
  \list{}{%
    \listparindent 0em
    \itemindent    \listparindent
    \leftmargin    1.5cm
    \rightmargin   \leftmargin
    \parsep        \z@ \@plus\p@
  }%
  \item\relax
}
{\endlist}
%
% real command to typeset introduction
%
\renewcommand\maketitle{%
  \thispagestyle{firstpage}
  \begin{strip}
    % head first page
    \vbox to0pt{%
      \@HeadFont
      \minipage{\linewidth}
        \strut
        \@headnote
        \strut
      \endminipage
      \vss
    }
    \par\vspace{\@VSpaceBeforeTitle}
    \begin{center}
      % title
      {\@TitleFont \@title\par}
      \vspace{\@VSpaceAfterTitle}
      % subtitle
      \ifx\relax\@subtitle\relax\else
        {\@SubtitleFont \@subtitle\par}
        \vspace{\@VSpaceAfterTitle}
      \fi
      %author
      % special \thanks
      \@thankscpt \z@
      \def\@thanks{}%
      \def\thanks##1{%
        \advance\@thankscpt \@ne
        \@thankssymbol
        \protected@xdef\@thanks{%
          \@thanks
          \advance\@thankscpt \@ne
          \protect\@thankssymbol ##1
        }%
        \ignorespaces
      }%
      \newcommand\correspondingauthor{%
        \thanks{\correspondingauthorname}%
        \xspace
      }
      % process \and display author(s) and build header
      \@parseauthor
      % display institute(s)
      \ifx\@institute\empty
      \else
        \par\vspace{\@VSpaceBeforeInstitute}
        \@FootnoteFont
        \@parseinstitute
      \fi
      % display email
      \ifx\@emailhook\@emptytoks
      \else
        \par\vspace{\@VSpaceBeforeEmail}
        \@EmailFont
        \@parseemail
      \fi
      % display thanks
      \ifx\@thanks\empty
      \else
        \par\vspace{\@VSpaceBeforeThanks}
        \@ThanksFont
        \@thankscpt \z@
        \@thanks
      \fi
    \end{center}
    % abstract (french one)
    \ifx\@resume\empty\else
      \begin{abstract@margin}
        \selectlanguage{french}%
        \@ResumeTitleFont
        \abstractname~{\mdseries---}
% remove 1.2
%        \ifx\@resumesubtitle\empty\else
%          \@resumesubtitle~{\mdseries---}
%        \fi
% end remove 1.2
        \@ResumeFont
        \@resume
      \end{abstract@margin}
    \fi
    % abstract (english one)
    \begin{abstract@margin}
      \selectlanguage{english}%
      \@AbstractTitleFont
      \abstractname~{\mdseries---}
% remove 1.2
%        \ifx\@abstractsubtitle\empty\else
%          \@abstractsubtitle~{\mdseries---}
%        \fi
% end remove 1.2
      \@AbstractFont
      \@abstract
    \end{abstract@margin}
    % final header
    \ifx\@authorrunning\empty
    \else
      \gdef\@headerauthor{\@authorrunning}
    \fi
    \ifx\@titlerunning\empty
    \else
      \gdef\@headertitle{\@titlerunning}
    \fi
    % if header too long then raise an error
    \setbox0=\hbox{%
      \@HeadFont
      \def\\{\unskip\space\ignorespaces}%
      \@headerauthor\space/
      \@headertitle
    }%
    \setlength{\@tempdima}{\linewidth-\widthof{\@HeadPageFont 88}-12pt}%
    \ifdim\wd0>\@tempdima
      \ClassError{ifpen-ogst}
                 {Title too long. Use \noexpand\titlerunning\space
                   or/and \noexpand\authorrunning}
                 {Title was automatically build with title and authors
                 given. The result is too large. Or your
                 \noexpand\titlerunning\space or/and
                 \noexpand\authorrunning\space are too long.}
    \fi
  \end{strip}
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dates and Copyright %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\AtEndDocument{%
  {\@DatesFont
    \@datereceipt\\
    \@dateacceptance
    \par
  }%
  \begin{strip}
    \null \par
  \end{strip}
  \par\vspace*{\stretch{1}}\noindent
  \makebox[\columnwidth][l]{%
    \setlength{\fboxsep}{6pt}%
    \fbox{%
      \begin{minipage}{174mm-12pt-2\fboxrule}%
        \@CopyrightFont
        {\centering \CopyrightTitlename\par}
        \CopyrightBodyname
      \end{minipage}%
    }%
  }%
  \par
}
%
%%%%%%%%%%%%%%%%%%%%%%
%%% section macros %%%
%%%%%%%%%%%%%%%%%%%%%%
%
\def\Special@bs{\let\\\newline}
\renewcommand\part{%
  \ClassError{ifpen-ogst}
             {Macro \noexpand\part\space isn't allowed}
             {You can use only macros from  \noexpand\section\space to
             \noexpand\paragraph}%
}
\renewcommand\section{%
  \@startsection {section}{1}{\z@}%
  {-21dd plus-4pt minus-4pt}%
  {10.5dd plus 4pt minus4pt}%
  {\@SectionFont\raggedright\Special@bs\MakeUppercase}%
}
\renewcommand\subsection{%
  \@startsection{subsection}{2}{\z@}%
  {-21dd plus-4pt minus-4pt}%
  {10.5dd plus 4pt minus4pt}%
  {\@SubsectionFont\raggedright}%
}
\renewcommand\subsubsection{%
  \@startsection{subsubsection}{3}{\z@}%
  {-13dd plus-4pt minus-4pt}%
  {5.5pt}%
  {\@SubsubsectionFont\raggedright}%
}
\renewcommand\paragraph{%
  \@startsection{paragraph}{4}{\z@}%
  {-13dd plus-4pt minus-4pt}%
  {5.5pt}%
  {\@ParagraphFont\raggedright}%
}
\renewcommand\subparagraph{%
  \ClassError{ifpen-ogst}
             {Macro \noexpand\subparagraph\space isn't allowed}
             {You can use only macros from  \noexpand\section\space to
             \noexpand\paragraph}
}
%
%%%%%%%%%%%%%%%%%%%%%%
%%% Aknowledgement %%%
%%%%%%%%%%%%%%%%%%%%%%
%
\newenvironment{acknowledgement}
{\section*{\acknowledgementname}}{}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% modified standard description environment %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\renewenvironment{description}[1][]
{%
  \list{}
       {%
         \setlength{\leftmargin}{0pt}%
         \setlength{\labelsep}{0pt}%
         \ifnum\@listdepth<2
           \setlength{\labelwidth}
                     {\widthof{\descriptionlabel{#1}}}%
         \else
           \labelwidth\z@
         \fi
         \setlength{\itemindent}{\labelwidth}%
         \let\makelabel\descriptionlabel
       }%
}
{\endlist}
\renewcommand*\descriptionlabel[1]{%
  \normalfont\bfseries #1
  \hss % add 
}
%
%%%%%%%%%%%%%%
%%% Floats %%%
%%%%%%%%%%%%%%
%
% Float placement
%
\def\fps@figure{htp}
\def\fps@table{htp}
%
% Float Body
%
% figure could have rules
\renewenvironment{figure}
  {%
    \@ifnextchar\notoprule
      {\notoprule\@float{figure}}
      {\@float{figure}}%
  }
  {\end@float}
\renewenvironment{figure*}
  {%
    \@ifnextchar\notoprule
      {\notoprule\@float{figure}}
      {\@dblfloat{figure}}%
  }
  {\end@dblfloat}
% table has no rules
\renewenvironment{table}
               {\notoprule\nobottomrule\@float{table}}
               {\end@float}
\renewenvironment{table*}
               {\notoprule\nobottomrule\@dblfloat{table}}
               {\end@dblfloat}
%
\def\string@table{table}
% \def\@floatboxreset{%
%   \@ifnextchar\notoprule
%     {\@@floatboxreset{\notoprule}}%
%     {\@@floatboxreset{\relax}}%
% }

% add 1.2
\newlength{\SpaceAfterTopRule}
\setlength{\SpaceAfterTopRule}{0pt}
\newlength{\SpaceBeforeBottomRule}
\setlength{\SpaceBeforeBottomRule}{6pt}
% end add 1.2
\def\@floatboxreset{%
%  #1%
  \reset@font
  \normalsize
  \@setminipage
  % If toprule is allowed
  \if@toprule
    % then display the top rule
    \hrule height0.3pt depth 0pt\par
    % add 1.2
    \vspace{\SpaceAfterTopRule}
    % end add 1.2
  \fi
}
%
% Captions
%
% change 1.2
%\newcommand\@FloatCounterEnd{\par}
\newcommand\@FloatCounterEnd{\par\vspace{3pt}}
% end add 1.2
\newcommand\@FloatCounterSep{}
% Rule or not for floats
\newif\if@bottomrule
\newif\if@toprule
\newcommand\nobottomrule{\@bottomrulefalse}
\newcommand\bottomrule{\@bottomruletrue}
\newcommand\notoprule{\@toprulefalse}
\newcommand\toprule{\@topruletrue}
% By default there are rules for floats.
\bottomrule
\toprule
%
\renewcommand\@makecaption[2]{%
  \par\addvspace\abovecaptionskip
  \ifx\@captype\string@table
    % Table: centering caption without rule
    \begingroup
      \centering
      \@CaptionFont{%
        \@CaptionTitleFont #1%
        \@FloatCounterEnd
      }\@FloatCounterSep #2%
      \par
    \endgroup
  \else
    % Figure (and others?): justified, margin+6mm, rule below
    \hspace*{6mm}%
    \parbox{\linewidth-12mm}{%
      \@CaptionFont{%
        \@CaptionTitleFont #1%
        \@FloatCounterEnd
      }\@FloatCounterSep #2%
    }%
    % no rule if \nobottomrule is in action
    \if@bottomrule
    % change 1.2
%      \par\vspace{3pt}
      \par\vspace{\SpaceBeforeBottomRule}%
    % end change 1.2
      \hrule height0.3pt depth0pt
    \fi
  \fi
  \par\addvspace\belowcaptionskip
}
\newcommand\@makesidecaption[2]{%
  \raisebox{0.5\@floatheight}{%
    \parbox{\@tempdima}{%
      \raggedright
      \@CaptionFont{%
        \@CaptionTitleFont #1%
        \@FloatCounterEnd
      }\@FloatCounterSep #2%
    }%
  }%
  \ifx\@captype\string@table\else
    % figure (and others?) => rule
    % unless \nobottomrule is in action
    \if@bottomrule
      \par\vspace{3pt}\hrule height0.3pt depth0pt
    \fi
  \fi
}
\long\def\sidecaption#1\caption{%
  \setbox\@tempboxa=\hbox{\unskip#1\unskip\ignorespaces}%
  \setlength{\@floatheight}{\ht\@tempboxa+\dp\@tempboxa}%
  \setlength{\@tempdima}{\columnwidth-\@figgap-\wd\@tempboxa}%
  \ifdim\@tempdima<3cm
    \ClassWarning{ifpen-ogst}{%
      \string\sidecaption: No sufficient room for the legend;
      using normal \string\caption.
    }%
    \leavevmode
    \box\@tempboxa
    \let\@capcommand=\@caption
  \else
    \let\@capcommand=\@sidecaption
    \leavevmode
    \box\@tempboxa\hspace*{\@figgap}%
  \fi
  \refstepcounter\@captype
  \@dblarg{\@capcommand\@captype}%
}

\long\def\@sidecaption#1[#2]#3{%
  \addcontentsline{\csname ext@#1\endcsname}
                  {#1}
                  {%
                    \protect\numberline{\csname the#1\endcsname}%
                    {\ignorespaces #2}%
                  }%
  \begingroup
    \@parboxrestore
    \@makesidecaption{\csname fnum@#1\endcsname}
                     {\ignorespaces #3}%
    \par
  \endgroup
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Misceleanous symbols %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Not sure for ifpen-ogst!
%
%%%\renewcommand\vec[1]{\ensuremath{\mathbf{#1}}}
%%%\newcommand\tens[1]{\ensuremath{\mathsf{#1}}}
