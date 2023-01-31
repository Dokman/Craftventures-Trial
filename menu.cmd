@echo off
TITLE Hello %USERNAME% a PAX ModPack Manager
MODE con:cols=120 lines=40

:inicio
SET var=0
cls
echo ------------------------------------------------------------------------------
echo  %DATE% ^| %TIME%
echo ------------------------------------------------------------------------------
echo  1    Pax Initialize Modpack  
echo  2    Pax Add Mod  
echo  3    Pax Remove Mod  
echo  4    Pax Upgrade All Mods
echo  5    Pax Update Mod 
echo  6    Pax List Mods
echo  7    Pax Export Modpack   
echo  8    Pax Commit  
echo  9    Salir
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Seleccione una opcion [1-9]: 

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto op6
if "%var%"=="7" goto op7
if "%var%"=="8" goto op8
if "%var%"=="9" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:op1
    echo.
    echo. Initialize ModPack
    echo.
        ::Aquí van las líneas de comando de tu opción
        pax init
    echo.
	git add .
    git commit -m "Initalization of Modpack" 
    pause
    goto:inicio

:op2
    echo.
    echo. Añadir Mod
    echo.
        ::Aquí van las líneas de comando de tu opción
		set /p modurl=Escribe la URL del mod: 
        pax add %modurl%
    echo.
	rem set /P c=Quieres añadir otro mod[Y/N - default Y]? :  
	SET choice=y
	SET /p choice=Quieres añadir otro mod? [y/n - default y]: 
	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	IF '%choice%'=='Y' GOTO yes
	IF '%choice%'=='y' GOTO yes
	IF '%choice%'=='N' GOTO no
	IF '%choice%'=='n' GOTO no
	IF '%choice%'=='' GOTO no
	ECHO "%choice%" no es valido
	ECHO.
	pause
    goto :inicio

:op3
    echo.
    echo. Eliminar mod
    echo.
        ::Aquí van las líneas de comando de tu opción
        set /p modurl=Escribe el nombre del mod a eliminar:
        pax remove %modurl%
    echo.
    pause
    goto:inicio
  
:op4
    echo.
    echo. Actualizacion de mods
    echo.
        ::Aquí van las líneas de comando de tu opción
        pax upgrade
    echo.
    pause
    goto:inicio
	
:op5
    echo.
    echo. Actualizar Mod
    echo.
        ::Aquí van las líneas de comando de tu opción
		set /p modurl=Escribe la URL del mod: 
        pax update %modurl%
    echo.
	rem set /P c=Quieres añadir otro mod[Y/N - default Y]? :  
	SET choice=y
	SET /p choice=Quieres actualizar otro mod? [y/n - default y]: 
	IF NOT '%choice%'=='' SET choice=%choice:~0,1%
	IF '%choice%'=='Y' GOTO yesupdate
	IF '%choice%'=='y' GOTO yesupdate
	IF '%choice%'=='N' GOTO no
	IF '%choice%'=='n' GOTO no
	IF '%choice%'=='' GOTO no
	ECHO "%choice%" no es valido
	ECHO.
	pause
    goto :inicio

:op6
    echo.
    echo. Listado de mods
    echo.
        ::Aquí van las líneas de comando de tu opción
        pax list > mod_list.txt
		pax list
    echo.
    pause
    goto:inicio
	
:op7
    echo.
    echo. Exportando Modpack
    echo.
        ::Aquí van las líneas de comando de tu opción
		SET export_folder=%cd%
        pax export
    echo.
    pause
    goto:inicio
	
:op8
	SET message=y
	SET /p message=Mensaje del commit:
	git add .
    git commit -m "%message%" 
	pause
	goto:inicio

:op9
	exit
	
	
	:no
	goto :inicio
	PAUSE
	EXIT

	:yes
	goto :op2
	PAUSE
	EXIT
	
	:yesupdate
	goto :op5
	PAUSE
	EXIT

:salir
    @cls&exit