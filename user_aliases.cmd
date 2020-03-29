;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat -n "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
home=cd /d %USERPROFILE%
~=cd /d %USERPROFILE%
repos=cd /d "D:\dev\repos"
blogging=cd /d "d:\dev\repos\blogging\blogging"
samples=cd /d "D:\dev\repos\samples"
templates=cd /d "D:\dev\repos\templates"
tix-ajax=cd /d "D:\dev\repos\support\ui-for-aspnet-ajax"
tix-blazor=cd /d "D:\dev\repos\support\ui-for-blazor"
tix-core=cd /d "D:\dev\repos\support\ui-for-aspnet-core"
tix-fiddler=cd /d "D:\dev\repos\support\fiddler"
tix-mvc=cd /d "D:\dev\repos\support\ui-for-aspnet-mvc"
tix-rprt=cd /d "D:\dev\repos\support\reporting"
tix-rprt-srvr=cd /d "D:\dev\repos\support\report-server"
docs=cd /d "D:\dev\repos\docs"
docs-ajax=cd /d "D:\dev\repos\docs\ajax-docs"
docs-blazor=cd /d "d:\dev\repos\docs\blazor-docs"
docs-seed=cd /d "D:\dev\repos\docs\docs-seed"
docs-fiddler-core=cd /d "d:\dev\repos\docs\fiddler-core-docs"
docs-fiddler=cd /d "d:\dev\repos\docs\fiddler-docs"
docs-fiddler-everywhere=cd /d "d:\dev\repos\docs\fiddler-everywhere-docs"
docs-rprt=cd /d "D:\dev\repos\docs\reporting-docs"
docs-rprt-srvr=cd /d "D:\dev\repos\docs\report-server-docs"
fiddler-everywhere-dev=cd /d "D:\dev\repos\sources\fiddler\Fiddler\WebUi" && code Fiddler.code-workspace && cd /d "D:\dev\repos\sources\fiddler\Fiddler\WebUi\Fiddler.WebUi" && dotnet run bin/Release/netcoreapp3.1/Fiddler.WebUi.dll -c Release