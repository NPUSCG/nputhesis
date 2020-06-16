@echo off

set flag=%1
set filename=%0

set tds_dir=nputhesis-tds
set tex_dir=\tex\latex\nputhesis
set doc_dir=\doc\latex\nputhesis
set src_dir=\source\latex\nputhesis

if %flag%x == x (
    for %%i in (plain, clean) do (
        call:%%i
    )
    pause
    goto :EOF
)


for %%i in (tds, plain, fast, demo, clean, clean_all, help) do if x%flag% == x%%i (
        call:%%i
        goto :EOF
    )

echo unkonwn option %flag%
goto :EOF

:help
    echo This is the build script for nputhesis
    echo USAGE:
    echo     %filename% [help^|tds^|plain^|clean^|clean_all]
    echo Without any parameter, %filename% will run
    echo     %filename% tds
    echo and 
    echo     %filename% clean
goto :EOF

:tds
    call :clean_all
    md %tds_dir%%tex_dir%
    md %tds_dir%%doc_dir%
    md %tds_dir%%src_dir%
    call :create_dscfg
    call :plain
    copy /Y nputhesis.dtx %tds_dir%%src_dir%\nputhesis.dtx
    copy /Y nputhesis.pdf %tds_dir%%doc_dir%\nputhesis.pdf
    copy /Y %tds_dir%%tex_dir%\nputhesis.cls %tds_dir%%doc_dir%\nputhesis.cls
    pushd %tds_dir%%doc_dir%
    copy /Y %tds_dir%%tex_dir%\nputhesis.cls nputhesis.cls
    call :demo
    if exist nputhesis.cls del nputhesis.cls
    popd
    if exist nputhesis.tds.zip del nputhesis.tds.zip
    7z a nputhesis.tds.zip .\nputhesis-tds\*
    7z l nputhesis.tds.zip
    echo ------------------------------------------------------------
    echo "Copy the files in nputhesis.tds.zip to proper destination."
    echo "Enjoy it!"
    echo ------------------------------------------------------------
goto :EOF

:fast
	xelatex nputhesis.dtx
    latexmk -xelatex nputhesis-sample.tex
goto :EOF

:plain
    call :create_dtxrc
    latexmk -xelatex nputhesis.dtx -r dtxrc
    call :demo
    rem latexmk -c nputhesis.dtx -r dtxrc
goto :EOF

:demo
    call :create_demorc
    latexmk -xelatex nputhesis-sample.tex -r demorc
    latexmk -c nputhesis-sample.tex -r demorc
    del demorc
goto :EOF

:clean
	call :clean_dtx
    call :clean_demo
    for %%i in (
        docstrip.cfg,     
    )   do if exist %%i ( del %%i )
goto :EOF

:clean_dtx 
    if exist nputhesis.dtx (
        call :create_dtxrc
        latexmk -c nputhesis.dtx -r dtxrc
        del dtxrc
    )
goto :EOF

:clean_demo
    if exist nputhesis-sample.tex (
        call :create_demorc
        latexmk -c nputhesis-sample.tex -r demorc
        del demorc
    )
goto :EOF

:clean_all
    if exist %tds_dir% rmdir /S /Q %tds_dir%
    call :clean_dtx
    call :clean_demo
    for %%i in (
        docstrip.cfg, nputhesis.tds.zip, nputhesis.ins, nputhesis.cls, nputhesis.pdf, 
        nputhesis-sample.tex, nputhesis-sample.pdf, myrefs.bib, README.org     
    )   do if exist %%i ( del %%i )
goto :EOF

:create_dscfg
call :heredoc dscfg >docstrip.cfg && goto enddscfg
\BaseDirectory{nputhesis-tds}
\UseTDS
:enddscfg
goto :EOF

:create_dtxrc
call :heredoc dtxrc >dtxrc && goto enddtxrc
@cus_dep_list = (@cus_dep_list, "glo gls 0 makegls");
sub makegls {
   system("makeindex -s gglo.ist -o $_[0].gls $_[0].glo"); }
$makeindex="makeindex -s gind.ist -o %D %S";
push @generated_exts, 'idx', 'ind', 'glo', 'gls', 'hd', 'xdv';
:enddtxrc
goto :EOF

:create_demorc
call :heredoc demorc >demorc && goto demorc
# for nomenclature
add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
    system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}
$clean_ext = "bbl nlg nlo nls xdv run.xml"
:demorc
goto :EOF

:: https://stackoverflow.com/a/15032476/3627676

:: ########################################
:: ## Here's the heredoc processing code ##
:: ########################################
:heredoc <uniqueIDX>
setlocal enabledelayedexpansion
set go=
for /f "delims=" %%A in ('findstr /n "^" "%~f0"') do (
    set "line=%%A" && set "line=!line:*:=!"
    if defined go (if #!line:~1!==#!go::=! (goto :EOF) else echo(!line!)
    if "!line:~0,13!"=="call :heredoc" (
        for /f "tokens=3 delims=>^ " %%i in ("!line!") do (
            if #%%i==#%1 (
                for /f "tokens=2 delims=&" %%I in ("!line!") do (
                    for /f "tokens=2" %%x in ("%%I") do set "go=%%x"
                )
            )
        )
    )
)
goto :EOF
