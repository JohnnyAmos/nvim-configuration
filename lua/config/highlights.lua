--[[ TODO: add comment header ]]--

local add = vim.fn.add

--[[ SECTION: Comment Tags ]]--

--[[ HINTS

cterm options: (comma-separated list with no spaces)
   bold                 underline
   strikethrough        undercurl
   inverse              underdouble
   italic               underdotted
   standout             underdashed
   altfont

ctermbg options: (color number from left column)
   NR-16    COLOR NAME
    0       Black
    1       DarkBlue
    2       DarkGreen
    3       DarkCyan
    4       DarkRed
    5       DarkMagenta
    6       Brown, DarkYellow
    7       LightGray, LightGrey, Gray, Grey
    8       DarkGray, DarkGrey
    9       Blue, LightBlue
   10       Green, LightGreen
   11       Cyan, LightCyan
   12       Red, LightRed
   13       Magenta, LightMagenta
   14       Yellow, LightYellow
   15       White

]]--

--[[ TODO: figure out how to use custom colors ]]--

-- highlight MyTodo cterm= ctermbg=
-- add("MyTodo", "\\(TODO:\\)")
-- highlight MyHack cterm= ctermbg=
-- add("MyHack", "\\(HACK:\\)")
-- highlight MyWarn cterm= ctermbg=
-- add("MyWarn", "\\(WARN:\\)")
-- highlight MyPerf cterm= ctermbg=
-- add("MyPerf", "\\(PERF:\\)")
-- highlight MyNote cterm= ctermbg=
-- add("MyNote", "\\(NOTE:\\)")
-- highlight MyTest cterm= ctermbg=
-- add("MyTest", "\\(TEST:\\)")
-- highlight MyIdea cterm= ctermbg=
-- add("MyIdea", "\\(IDEA:\\)")
-- highlight MyPlugin cterm= ctermbg=
-- add("MyPlugin", "\\(PLUGIN:\\)")
-- highlight MySection cterm= ctermbg=
-- add("MySection", "\\(SECTION:\\)")
-- highlight My cterm= ctermbg=
-- add("My", "\\(:\\)")

-- vim: set sts=3 sw=3 ts=3 tw=79:

