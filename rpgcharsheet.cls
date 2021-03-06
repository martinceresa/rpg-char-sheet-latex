\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{rpgcharsheet}[2013/02/23]

\LoadClass{article}

\RequirePackage[margin=1cm,footskip=0.25in,a4paper]{geometry}
\RequirePackage{mathptmx}
\RequirePackage{anyfontsize}
\RequirePackage{tabularx}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{dashrule}
\RequirePackage{etex}
\RequirePackage{cancel}
\RequirePackage{xcolor}
\RequirePackage{color}
\RequirePackage{calc}
\RequirePackage{ifthen}
\ProcessOptions\relax
\DeclareOption* {\PassOptionsToClass{\CurrentOption}{article}}


\def\attributes#1#2#3{%
\count@#1
\newcount\xcount\xcount=#1
\@for\tmp:=#3\do{%
\put(\xcount,#2){\framebox(15,9){\tmp}}%
\advance\xcount18
}}

\def\plusattributes#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
  \put(\tmpcount,#2){\framebox(15,9){\tmp}}
  \advance\xcount by #4
}}

\def\equalattributes#1#2#3#4{%
  \newcount\xcount
  \xcount=#1
  \newcount\pluscount
  \newcount\tmpcount
  \newcount\mytotalcount
  \mytotalcount=0
  \newcount\firstcount
  \firstcount=0

  % Just to skip the first box
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  % \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
  % \put(\tmpcount,#2){\framebox(15,9){\tmp}}
  \advance\xcount by #4

  \@for\tmp:=#3\do{%
    \pluscount=0
    \advance\pluscount by #4
    \advance\pluscount by -15
    \tmpcount=\xcount
    \advance\tmpcount by \number\pluscount
    \ifnum\number\firstcount=0 
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny =}}
    \else
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
    \fi
    \put(\tmpcount,#2){\framebox(15,9){$\tmp$}}
    \advance\xcount by #4
    \advance\mytotalcount by \tmp
    \advance\firstcount by 1
  }

  %% reset to give the first box
  \xcount=#1
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(15,9){$\number\mytotalcount$}}
  \advance\xcount by #4
}

\def\specialequalattributes#1#2#3#4#5{%
  \newcount\xcount
  \xcount=#1
  \newcount\pluscount
  \newcount\tmpcount
  \global\newcount#5
  #5=0
  \newcount\firstcount
  \firstcount=0

  % Just to skip the first box
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  % \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
  % \put(\tmpcount,#2){\framebox(15,9){\tmp}}
  \advance\xcount by #4

  \@for\tmp:=#3\do{%
    \pluscount=0
    \advance\pluscount by #4
    \advance\pluscount by -15
    \tmpcount=\xcount
    \advance\tmpcount by \number\pluscount
    \ifnum\number\firstcount=0 
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny =}}
    \else
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
    \fi
    \put(\tmpcount,#2){\framebox(15,9){\tmp}}
    \advance\xcount by #4
    \advance#5 by \tmp
    \advance\firstcount by 1
  }

  %% reset to give the first box
  \xcount=#1
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(15,9){\the#5}}
  \advance\xcount by #4
}

\newcounter{charstrcount}
\newcounter{chardexcount}
\newcounter{charconcount}
\newcounter{charintcount}
\newcounter{charwiscount}
\newcounter{charchacount}
\newcounter{charstrmodcount}
\newcounter{chardexmodcount}
\newcounter{charconmodcount}
\newcounter{charfortitudemiscmodcount}
\newcounter{charintmodcount}
\newcounter{charwismodcount}
\newcounter{charchamodcount}
\newcounter{charstrtmpadjcount}
\newcounter{chardextmpadjcount}
\newcounter{charcontmpadjcount}
\newcounter{charinttmpadjcount}
\newcounter{charwistmpadjcount}
\newcounter{charchatmpadjcount}
\newcounter{charstrtmpmodcount}
\newcounter{chardextmpmodcount}
\newcounter{charcontmpmodcount}
\newcounter{charinttmpmodcount}
\newcounter{charwistmpmodcount}
\newcounter{charchatmpmodcount}

\newcounter{charinitmiscmodcount}


\newcommand\charstr[1]{
  \setcounter{charstrcount}{0}
  \setcounter{charstrcount}{#1}
  \setcounter{charstrmodcount}{0}
  \setcounter{charstrmodcount}{(\value{charstrcount}-10)/\real{2}}
}
\newcommand\charstradd[1]{%
    \addtocounter{charstrcount}{#1}
    \setcounter{charstrmodcount}{(\value{charstrcount}-10)/\real{2}}
}
\newcommand\chardex[1]{
  \setcounter{chardexcount}{0}
  \setcounter{chardexcount}{#1}
  \setcounter{chardexmodcount}{0}
  \setcounter{chardexmodcount}{(\value{chardexcount}-10)/\real{2}}
}
\newcommand\chardexadd[1]{%
    \addtocounter{chardexcount}{#1}
    \setcounter{chardexmodcount}{(\value{chardexcount}-10)/\real{2}}
}
\newcommand\charcon[1]{
  \setcounter{charconcount}{0}
  \setcounter{charconcount}{#1}
  \setcounter{charconmodcount}{0}
  \setcounter{charconmodcount}{(\value{charconcount}-10)/\real{2}}
}
\newcommand\charint[1]{
  \setcounter{charintcount}{0}
  \setcounter{charintcount}{#1}
  \setcounter{charintmodcount}{0}
  \setcounter{charintmodcount}{(\value{charintcount}-10)/\real{2}}
}
\newcommand\charwis[1]{
  \setcounter{charwiscount}{0}
  \setcounter{charwiscount}{#1}
  \setcounter{charwismodcount}{0}
  \setcounter{charwismodcount}{(\value{charwiscount}-10)/\real{2}}
}
\newcommand\charcha[1]{
  \setcounter{charchacount}{0}
  \setcounter{charchacount}{#1}
  \setcounter{charchamodcount}{0}
  \setcounter{charchamodcount}{(\value{charchacount}-10)/\real{2}}
}
\newcommand\charchaadd[1]{%
    \addtocounter{charchacount}{#1}
  \setcounter{charchamodcount}{(\value{charchacount}-10)/\real{2}}
}

\newcommand\plusminus[1]{
  \ifthenelse{\value{#1}>0}{$+\arabic{#1}$}{$\arabic{#1}$}
}


%% Health counter
\newcounter{charhpcount}
%% Exp counter
\newcounter{charexpcount}

%% Skill set counters
\newcounter{characrobaticscount}
\newcounter{charappraisecount}
\newcounter{charbluffcount}
\newcounter{charclimbcount}
\newcounter{charcraftonecount}
\newcounter{charcrafttwocount}
\newcounter{charcraftthreecount}
\newcounter{chardiplomacycount}
\newcounter{chardisabledevicecount}
\newcounter{chardisguisecount}
\newcounter{charescapeartistcount}
\newcounter{charflycount}
\newcounter{charhandleanimalcount}
\newcounter{charhealcount}
\newcounter{charintimidatecount}
\newcounter{charknowledgearcanacount}
\newcounter{charknowledgedungeoneeringcount}
\newcounter{charknowledgeengineeringcount}
\newcounter{charknowledgegeographycount}
\newcounter{charknowledgehistorycount}
\newcounter{charknowledgelocalcount}
\newcounter{charknowledgenaturecount}
\newcounter{charknowledgenobilitycount}
\newcounter{charknowledgeplanescount}
\newcounter{charknowledgereligioncount}
\newcounter{charlinguisticscount}
\newcounter{charperceptioncount}
\newcounter{charperformonecount}
\newcounter{charperformtwocount}
\newcounter{charprofessiononecount}
\newcounter{charprofessiontwocount}
\newcounter{charridecount}
\newcounter{charsensemotivecount}
\newcounter{charsleightofhandcount}
\newcounter{charspellcraftcount}
\newcounter{charstealthcount}
\newcounter{charsurvivalcount}
\newcounter{charswimcount}
\newcounter{charusemagicdevicecount}

%% Class skill counters
\newcounter{characrobaticsclassskillcount}
\newcounter{charappraiseclassskillcount}
\newcounter{charbluffclassskillcount}
\newcounter{charclimbclassskillcount}
\newcounter{charcraftoneclassskillcount}
\newcounter{charcrafttwoclassskillcount}
\newcounter{charcraftthreeclassskillcount}
\newcounter{chardiplomacyclassskillcount}
\newcounter{chardisabledeviceclassskillcount}
\newcounter{chardisguiseclassskillcount}
\newcounter{charescapeartistclassskillcount}
\newcounter{charflyclassskillcount}
\newcounter{charhandleanimalclassskillcount}
\newcounter{charhealclassskillcount}
\newcounter{charintimidateclassskillcount}
\newcounter{charknowledgearcanaclassskillcount}
\newcounter{charknowledgedungeoneeringclassskillcount}
\newcounter{charknowledgeengineeringclassskillcount}
\newcounter{charknowledgegeographyclassskillcount}
\newcounter{charknowledgehistoryclassskillcount}
\newcounter{charknowledgelocalclassskillcount}
\newcounter{charknowledgenatureclassskillcount}
\newcounter{charknowledgenobilityclassskillcount}
\newcounter{charknowledgeplanesclassskillcount}
\newcounter{charknowledgereligionclassskillcount}
\newcounter{charlinguisticsclassskillcount}
\newcounter{charperceptionclassskillcount}
\newcounter{charperformoneclassskillcount}
\newcounter{charperformtwoclassskillcount}
\newcounter{charprofessiononeclassskillcount}
\newcounter{charprofessiontwoclassskillcount}
\newcounter{charrideclassskillcount}
\newcounter{charsensemotiveclassskillcount}
\newcounter{charsleightofhandclassskillcount}
\newcounter{charspellcraftclassskillcount}
\newcounter{charstealthclassskillcount}
\newcounter{charsurvivalclassskillcount}
\newcounter{charswimclassskillcount}
\newcounter{charusemagicdeviceclassskillcount}

%% Skill ranks
\newcounter{characrobaticsrankscount}
\newcounter{charappraiserankscount}
\newcounter{charbluffrankscount}
\newcounter{charclimbrankscount}
\newcounter{charcraftonerankscount}
\newcounter{charcrafttworankscount}
\newcounter{charcraftthreerankscount}
\newcounter{chardiplomacyrankscount}
\newcounter{chardisabledevicerankscount}
\newcounter{chardisguiserankscount}
\newcounter{charescapeartistrankscount}
\newcounter{charflyrankscount}
\newcounter{charhandleanimalrankscount}
\newcounter{charhealrankscount}
\newcounter{charintimidaterankscount}
\newcounter{charknowledgearcanarankscount}
\newcounter{charknowledgedungeoneeringrankscount}
\newcounter{charknowledgeengineeringrankscount}
\newcounter{charknowledgegeographyrankscount}
\newcounter{charknowledgehistoryrankscount}
\newcounter{charknowledgelocalrankscount}
\newcounter{charknowledgenaturerankscount}
\newcounter{charknowledgenobilityrankscount}
\newcounter{charknowledgeplanesrankscount}
\newcounter{charknowledgereligionrankscount}
\newcounter{charlinguisticsrankscount}
\newcounter{charperceptionrankscount}
\newcounter{charperformonerankscount}
\newcounter{charperformtworankscount}
\newcounter{charprofessiononerankscount}
\newcounter{charprofessiontworankscount}
\newcounter{charriderankscount}
\newcounter{charsensemotiverankscount}
\newcounter{charsleightofhandrankscount}
\newcounter{charspellcraftrankscount}
\newcounter{charstealthrankscount}
\newcounter{charsurvivalrankscount}
\newcounter{charswimrankscount}
\newcounter{charusemagicdevicerankscount}

%% Skill misc mod
\newcounter{characrobaticsmiscmodcount}
\newcounter{charappraisemiscmodcount}
\newcounter{charbluffmiscmodcount}
\newcounter{charclimbmiscmodcount}
\newcounter{charcraftonemiscmodcount}
\newcounter{charcrafttwomiscmodcount}
\newcounter{charcraftthreemiscmodcount}
\newcounter{chardiplomacymiscmodcount}
\newcounter{chardisabledevicemiscmodcount}
\newcounter{chardisguisemiscmodcount}
\newcounter{charescapeartistmiscmodcount}
\newcounter{charflymiscmodcount}
\newcounter{charhandleanimalmiscmodcount}
\newcounter{charhealmiscmodcount}
\newcounter{charintimidatemiscmodcount}
\newcounter{charknowledgearcanamiscmodcount}
\newcounter{charknowledgedungeoneeringmiscmodcount}
\newcounter{charknowledgeengineeringmiscmodcount}
\newcounter{charknowledgegeographymiscmodcount}
\newcounter{charknowledgehistorymiscmodcount}
\newcounter{charknowledgelocalmiscmodcount}
\newcounter{charknowledgenaturemiscmodcount}
\newcounter{charknowledgenobilitymiscmodcount}
\newcounter{charknowledgeplanesmiscmodcount}
\newcounter{charknowledgereligionmiscmodcount}
\newcounter{charlinguisticsmiscmodcount}
\newcounter{charperceptionmiscmodcount}
\newcounter{charperformonemiscmodcount}
\newcounter{charperformtwomiscmodcount}
\newcounter{charprofessiononemiscmodcount}
\newcounter{charprofessiontwomiscmodcount}
\newcounter{charridemiscmodcount}
\newcounter{charsensemotivemiscmodcount}
\newcounter{charsleightofhandmiscmodcount}
\newcounter{charspellcraftmiscmodcount}
\newcounter{charstealthmiscmodcount}
\newcounter{charsurvivalmiscmodcount}
\newcounter{charswimmiscmodcount}
\newcounter{charusemagicdevicemiscmodcount}


% \def\abilitymodifier#1{
%   \newcount\tmpcount
%   \tmpcount#1
%   \advance\tmpcount by -10
%   \divide \tmpcount by 2
%  \hspace{-5\unitlength}
%   \ifnum\number\tmpcount<0
%   $\the\tmpcount$
%   \else
%   $+\the\tmpcount$
%   \fi
% }

% \def\numberabilitymodifier#1{
%   \newcount\tmpcount
%   \tmpcount#1
%   \advance\tmpcount by -10
%   \divide \tmpcount by 2
%   \number\tmpcount
% }



\def\scaleattributes#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(15,9){\tmp}}
  \advance\xcount by #4
}}

%% Attribute box dimensions
\newcount\boxwidth\boxwidth=15
\newcount\boxheight\boxheight=9

\def\stretchattributes#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\stretchcount
\stretchcount=#3
\advance\stretchcount by -#1
\newcount\noofentriescount
\noofentriescount=0
\@for\tmp:=#4\do{%
  \advance\noofentriescount1
}
\advance\noofentriescount-1
\advance\stretchcount-\boxwidth
\divide\stretchcount by \number\noofentriescount
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#4\do{%
  \ifnum\number\xcount=#1
  \pluscount=0
  \else
  \pluscount=0
  \advance\pluscount by \stretchcount
  \advance\pluscount by -15
  \fi
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \put(\tmpcount,#2){\framebox(\boxwidth,\boxheight){\tmp}}
  \ifnum\number\pluscount=0
  \advance\xcount by \boxwidth
  \else
  \advance\xcount by \stretchcount
  \fi
}}



\newcount\labelheight
\labelheight=3
\newcount\labelwidth
\labelwidth=\number\boxwidth
\advance\labelwidth4

\def\stretchlabels#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\stretchcount
\stretchcount=#3
\advance\stretchcount by -#1
\newcount\noofentriescount
\noofentriescount=0
\@for\tmp:=#4\do{%
  \advance\noofentriescount1
}
\advance\noofentriescount-1
\advance\stretchcount-\boxwidth
\divide\stretchcount by \number\noofentriescount
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#4\do{%
  \ifnum\number\xcount=#1
  \pluscount=0
  \else
  \pluscount=0
  \advance\pluscount by \stretchcount
  \advance\pluscount by -15
  \fi
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \newcount\leftabitcount
  \leftabitcount=\tmpcount
  \advance\leftabitcount by -2  \put(\leftabitcount,#2){\parbox[b][\number\labelheight\unitlength][c]{\number\labelwidth\unitlength}{\centering\lfont \tmp}}
  \ifnum\number\pluscount=0
  \advance\xcount by \boxwidth
  \else
  \advance\xcount by \stretchcount
  \fi
}}



\def\attributelabels#1#2#3{%
\count@#1
\newcount\xcount\xcount=#1
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \tmpcount=\xcount
  \advance\tmpcount-4
\put(\tmpcount,#2){\parbox[b][9\unitlength][b]{24\unitlength}{\lfont\centering\tmp}}%
\advance\xcount18
}}



\def\stretchequalattributes#1#2#3#4{%
  \newcount\xcount
  \xcount=#1
  \newcount\stretchcount
  \stretchcount=#3
  \advance\stretchcount by -#1
  \newcount\firstcount
  \firstcount=0
  \newcount\noofentriescount
  \noofentriescount=0
  \@for\tmp:=#4\do{%
    \advance\noofentriescount1
  }
  % \advance\noofentriescount-1
  \advance\stretchcount-\boxwidth
  \divide\stretchcount by \number\noofentriescount %stretchcount completed
  \newcount\pluscount
  \newcount\tmpcount
  \newcount\totalcount\totalcount=0

  \ifnum\number\xcount=#1
  \pluscount=0
  \else
  \pluscount=0
  \advance\pluscount by \stretchcount
  \advance\pluscount by -15
  \fi
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \ifnum\number\pluscount=0
  \advance\xcount by \boxwidth
  \else
  \advance\xcount by \stretchcount
  \fi
  \advance\firstcount1
  % \advance\totalcount by \numberfoo

  \@for\tmp:=#4\do{%
    \ifnum\number\xcount=#1
    \pluscount=0
    \else
    \pluscount=0
    \advance\pluscount by \stretchcount
    \advance\pluscount by -15
    \fi
    \tmpcount=\xcount
    \advance\tmpcount by \number\pluscount
    \ifnum\number\firstcount=0
    \else
    \put(\tmpcount,#2){\framebox(\boxwidth,\boxheight){\tmp}}
    \fi
    \ifnum\number\firstcount=1 
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny =}}
    \else
    \ifnum\number\firstcount=0
    \else
    \put(\xcount,#2){\makebox(\pluscount,9){\tiny +}}
    \fi
    \fi
    \ifnum\number\pluscount=0
    \advance\xcount by \boxwidth
    \else
    \advance\xcount by \stretchcount
    \fi
    \advance\firstcount1
    \advance\totalcount by \number\tmp
  }
  \put(#1,#2){\framebox(\boxwidth,\boxheight){\number\totalcount}}
}

\def\attributelabels#1#2#3{%
\count@#1
\newcount\xcount\xcount=#1
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \tmpcount=\xcount
  \advance\tmpcount-4
\put(\tmpcount,#2){\parbox[b][9\unitlength][b]{24\unitlength}{\lfont\centering\tmp}}%
\advance\xcount18
}}


\def\scaleattributelabels#1#2#3#4{%
\newcount\xcount
\xcount=#1
\newcount\pluscount
\newcount\tmpcount
\@for\tmp:=#3\do{%
  \pluscount=0
  \advance\pluscount by #4
  \advance\pluscount by -15
  \tmpcount=\xcount
  \advance\tmpcount by \number\pluscount
  \advance\tmpcount by -1
\put(\tmpcount,#2){\parbox[b][9\unitlength][c]{17\unitlength}{\lfont\centering\tmp}}
  \advance\xcount by #4
}}

\def\titlebox#1#2#3#4#5{
  \newcount\ycount\ycount#2
  \newcount\hcount\hcount=10
  \newcount\wcount\wcount=#3
  \newcount\downabitcount
  \downabitcount=#2
  \advance\downabitcount-1
  \put(#1,\downabitcount){\setlength\fboxsep{0pt}\colorbox{gray!10}{\makebox(#3,11){}}}%
  \advance\ycount1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{black}{\uppercase{#4}}}}
  \advance\hcount-7
  \advance\ycount-1
  \put(#1,\ycount){\makebox(#3,\hcount){\color{black}{\tiny\scshape #5}}}
}

\newcommand\singletitlebox[5]{
  % \put(#1,#2){\framebox(#3,#4){\uppercase{#5}}}
  \put(#1,#2){%
    \setlength\fboxsep{0pt}\colorbox{gray!10}{%
      \makebox(#3,#4){%
        \color{black}{\centering\uppercase{#5}}%
      }%
    }%
  }%
}

\newcounter{totalitemweightcount}
% \multicolumn{2}{c}{Gear} \tabularnewline
\newcommand\printgearitems{ \lfont item& \lfont wt.\tabularnewline\hline}

\newcommand\gearitem[2]{
  \addtocounter{totalitemweightcount}{#2}
  \textit{#1} & #2~lbs.\tabularnewline
  %% Let this code fade into a cosmic dance... until I figure out how to get it to work
  %% Meanwhile, I'll just make players input it manually somehow.
  % \let\oldprintgearitems\printgearitems
  % \addtocounter{totalitemweight}{#2}
  % \renewcommand{\printgearitems}{\noexpand\oldprintgearitems
  %   \textit{#1} & #2~lbs.\tabularnewline\hline}
  % % \let\printgearitems\printgearitems
  % \renewcommand\oldprintgearitems{}
}

\newcommand\subgearitem[2]{
  \textit{---#1} & (#2~lbs.) \tabularnewline
}
%% This could stay, or might not. Depends how I implement gear eventually
\newcommand\totalitem{
  \relax & \relax \tabularnewline
  \textsc{Total} & \arabic{totalitemweightcount}~lbs. \tabularnewline\hline
}

\newcommand\charfeats{None}

\newcounter{totalacitemsbonus}
\newcounter{totalacitemscheckpenalty}
\newcounter{totalacitemsspellfailure}
\newcounter{totalacitemsweight}

\newcommand\printacitems{ \uppercase{AC Items} & \lfont bonus & \lfont type & \lfont check penalty & \lfont spell failure & \lfont weight & \lfont properties \tabularnewline\hline}

\newcommand\acitem[7]{
  % \let\oldprintacitems\printacitems
  \addtocounter{totalacitemsbonus}{#2}
  \addtocounter{totalacitemscheckpenalty}{#4}
  \addtocounter{totalacitemsspellfailure}{#5}
  \addtocounter{totalacitemsweight}{#6}
  % \renewcommand{\printacitems}{\oldprintacitems
    #1 & #2 & #3 & #4 & #5\% & #6~lbs. & #7\tabularnewline\hline
  % }
}

\newcolumntype{A}[1]{@{}>{\centering\footnotesize}m{#1\unitlength}@{}}
\newcolumntype{B}[1]{@{}>{\footnotesize\scshape}m{#1\unitlength}@{}}
\newcolumntype{D}[1]{>{\itshape}p{#1\unitlength}}
\newcolumntype{E}[1]{@{}>{\lfont\raggedleft}b{#1\unitlength}@{}}
\newcolumntype{F}[1]{@{\hspace{-0.5ex}}>{\small\raggedleft}m{#1\unitlength}@{\hspace{0.5ex}}}

\newcommand\weapontable[9]{
  \put(#1,#2){\begin{tabular}[b]{A{20}A{30}A{75}A{45}A{25}@{}l@{}}\toprule
      \multicolumn{3}{A{125}}{\tiny\scshape WEAPON} &\tiny\scshape  attack bonus &\tiny\scshape  critical & \tabularnewline\hline
      \multicolumn{3}{A{125}}{\itshape #3} & $#4$ &  $#5$ &\tabularnewline[6\unitlength]
      \tiny\scshape type & \tiny\scshape range & \tiny\scshape ammunition & \multicolumn{2}{A{76}}{\tiny\scshape damage} & \tabularnewline\hline
      \itshape #6 &  $#7$ & \itshape #8 & \multicolumn{2}{A{76}}{$#9$} & \tabularnewline\bottomrule
    \end{tabular}}
}
\newcommand\spell[4]{%
    \put(#1,#2){%
        \textbf{#3}
        %Description
        \emph{#4}
    }
}

%% Skill commands
\newcounter{tmpskilltotalcount}
\setcounter{tmpskilltotalcount}{0}


\newcommand\isclassskill[1]{
  \setcounter{#1}{1}
}

\newcommand\skillcalculate[4]{
  \setcounter{tmpskilltotalcount}{\value{#2}+\value{#3}+\value{#4}}
  \plusminus{tmpskilltotalcount} & $=$ #1 & $\arabic{#2}$ & $+$ & $\arabic{#3}$ &  $+$ & $\arabic{#4}$ \tabularnewline\cline{3-3}\cline{5-5}\cline{7-7}\cline{9-9}
}

\newcommand\classskillbox[1]{
  \ifthenelse{\value{#1} = 1}{$\cancel{\square}$}{$\square$}
}
\newcommand\skill[8]{
  \put(#2,#3){
  \begin{tabular}[b]{A{10}B{100}A{14}B{20}A{14}A{8}A{14}A{8}A{14}}
    \classskillbox{#1} &  #4 & \skillcalculate{#5}{#6}{#7}{#8}
  \end{tabular}}
}
% \newcommand\classskill[7]{
%   \put(#1,#2){
%   \begin{tabular}[b]{A{10}B{100}A{14}B{20}A{14}A{8}A{14}A{8}A{14}}
%     $\cancel\square$ &  #3 & \skillcalculate{#4}{#5}{#6}{#7}
%   \end{tabular}}
% }

\newcommand\trainskill[8]{
  \put(#2,#3){
  \begin{tabular}[b]{A{10}B{100}A{14}B{20}A{14}A{8}A{14}A{8}A{14}}
    \classskillbox{#1} &  #4* & \skillcalculate{#5}{#6}{#7}{#8}
  \end{tabular}}
}


\newcommand\lfont{\fontsize{4}{4}\selectfont\scshape}
\newcommand\charname{Tralguth}
\newcommand\charlevel{Level 1 Witch}
\newcommand\charplayername{Nathanael}
\newcommand\charalignment{TN}
\newcommand\chardiety{None}
\newcommand\charrace{Half-orc}
\newcommand\charhomeland{??}
\newcommand\charsize{Medium}
\newcommand\chargender{m}
\newcommand\charage{30}
\newcommand\charheight{7 ft.}
\newcommand\charweight{140~kg}
\newcommand\charhair{Blue}
\newcommand\chareyes{Grey}
\newcommand\charlanguagesspoken{Common, Orc}

\newcommand\charspelldump{No spells}

\newcounter{charcoppercount}
\newcounter{charsilvercount}
\newcounter{chargoldcount}
\newcounter{charplatinumcount} %% I hope that's the right counter!

%%%%% Spell Thingis
\newcounter{spells1}
\setcounter{spells1}{0}
\newcommand\singlespell[2]{%
    \textbf{#1} & #2 \\
}
\newcommand\complexspell[3]{%
    \textbf{#1}(M:#3) & #2 \\
}
\newcommand\bloodlinespell[2]{%
    \textbf{\color{blue}#1} & #2 \\
}
\newcommand\cantrips{%
    \textbf{Jolt} & Desc: Holissssssss \\
    \textbf{Bless} & Desc: Holissssssss \\
}
\newcommand\firstspelllist{%
    \textbf{Jolt} & Desc: Holissssssss \\
    \textbf{Bless} & Desc: Holissssssss \\
}
\newcommand\spelltable{%
    \begin{tabular}[t]{B{60}B{145}}
        \hline
        \textbf{Spell List BIACH} & Description \\
        \hline
        Cantrips & \\
        \hline
        \cantrips
        \hline
        \ifthenelse{\value{spells1}=0}{%
            LEVELEA & PUTO}{%
        First Level Spells & \arabic{spells1} \\
        \hline
        \firstspelllist
        \hline
        }
    \end{tabular}
}
