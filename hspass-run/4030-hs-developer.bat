@echo off


%~d0
cd %~dp0


title 4030-hs-developer.jar


set "JAVA_OPTS=-Xms256m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m"



if "%JAVA_HOME%" == "" goto noJavaHome
if not "%JAVA_HOME%" == "" goto gotJavaHome
goto end

:noJavaHome
set RUN_JAVA=java
goto runJava

:gotJavaHome
set "RUN_JAVA=%JAVA_HOME%\bin\java"
goto runJava

:runJava

call "%RUN_JAVA%" %JAVA_OPTS% -jar ./lib/hs-developer.jar --server.port=4030
goto end

:end
pause