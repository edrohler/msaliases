;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof

;= rem general
e.=explorer .
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat -n "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=nvim $*
vim=nvim $*
cmderr=cd /d "%CMDER_ROOT%"
home=cd /d %USERPROFILE%
~=cd /d %USERPROFILE%

;= rem apps

;= rem top-level repos
repos=cd /d "D:\dev\repos"
blogging=cd /d "d:\dev\repos\blogging\blogging"
docs=cd /d "D:\dev\repos\docs"
sources=cd /d "d:\dev\repos\sources"
support=cd /d "d:\dev\repos\support"

;= rem support ticket repos
tix-ajax=cd /d "D:\dev\repos\support\ui-for-aspnet-ajax"
tix-blazor=cd /d "D:\dev\repos\support\ui-for-blazor"
tix-core=cd /d "D:\dev\repos\support\ui-for-aspnet-core"
tix-fiddler=cd /d "D:\dev\repos\support\fiddler"
tix-mvc=cd /d "D:\dev\repos\support\ui-for-aspnet-mvc"
tix-rprt=cd /d "D:\dev\repos\support\reporting"
tix-rprt-srvr=cd /d "D:\dev\repos\support\report-server"

;= rem docs editing
docs-ajax=cd /d "D:\dev\repos\docs\ajax-docs"
docs-blazor=cd /d "d:\dev\repos\docs\blazor-docs"
docs-seed=cd /d "D:\dev\repos\docs\docs-seed"
docs-fiddler-core=cd /d "d:\dev\repos\docs\fiddler-core-docs"
docs-fiddler=cd /d "d:\dev\repos\docs\fiddler-docs"
docs-fiddler-everywhere=cd /d "d:\dev\repos\docs\fiddler-everywhere-docs"
docs-rprt=cd /d "D:\dev\repos\docs\reporting-docs"
docs-rprt-srvr=cd /d "D:\dev\repos\docs\report-server-docs"

;= rem dev shortcuts
msa=cd /d "d:\dev\repos\sources\msaliases"
pb=cd /d "d:\dev\repos\sources\ericrohler_static"
fed=cd /d "D:\dev\repos\sources\fiddler\Fiddler\WebUi" && code Fiddler.code-workspace && cd /d "D:\dev\repos\sources\fiddler\Fiddler\WebUi\Fiddler.WebUi" && dotnet run bin/Release/netcoreapp3.1/Fiddler.WebUi.dll -c Release
tdd=cd /d "d:\dev\repos\sources\team-dashboard"

;= rem git shortcuts
gs=git status
ga=git add
gaa=git add -A
gc=git commit --message $*
gca=git commit --all --message $*
gcam=git commit --amend --message $*
gcamne=git commit --amend --no-edit
gb=git branch
gbd=git branch -d $*
gco=git checkout $*
gcob=git checkout -b $*
gl=git log
gladog=git log --graph --oneline --all --decorate
gd=git diff
gds=git diff --staged
gdt=git difftool
gdts=git difftool --staged
gps=git push
gpl=git pull
gf=git fetch
gfp=git fetch --prune