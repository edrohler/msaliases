set startdir = %cd%
set aliasdir = %USERPROFILE%
set nvmdir = %aliasdir% + \AppData\Local\nvim\

echo mklink aliases.cmd %stardir%
echo mklink init.vim %startdir%
