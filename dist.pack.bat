@echo off

for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.Component.MSBuild -property installationPath`) do (
  set InstallDir=%%i
)

if exist "%InstallDir%\MSBuild\15.0\Bin\MSBuild.exe" (
  set msBuildExe="%InstallDir%\MSBuild\15.0\Bin\MSBuild.exe"
)
@echo on

call %msBuildExe% obfuscar.sln /t:restore
call %msBuildExe% obfuscar.sln /t:clean /p:Configuration=Release
call %msBuildExe% obfuscar.sln /p:Configuration=Release
call .\.nuget\nuget.exe pack 