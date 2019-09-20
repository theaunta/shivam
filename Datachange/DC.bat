@SET PC_ROOT=C:\ClaimCenter
@SET SCRIPT_FILE=%2
@SET DESCP=%3
@SET REFID=%4

::Set the Server_URL variable to the environment. Need to update in the Register.bat
@GOTO CASE_%1

:CASE_Local
		@SET SERVER_URL=http://localhost:8080/cc
		GOTO END_CASE
:CASE_INT
		 @SET SERVER_URL=http://localhost:8080/cc
		GOTO END_CASE
:CASE_QA
		:: @SET SERVER_URL=http://localhost:8080/cc
		GOTO END_CASE		

		
:CASE_C
		@GOTO ERR_USAGE
		
:END_CASE

::Check to make sure user entered a correct environment parameter

@IF %SERVER_URL%=="" GOTO ERR_USAGE

::Give User a chance to confirm if they are loading the script in the correct environment
@cls
@echo Preparing to import data into %1 environment, using url: %SERVER_URL% 	
@pause

if EXIST %SCRIPT_FILE% (
			@echo Script File : %SCRIPT_FILE%
			@CALL %PC_ROOT%\admin\bin\data_change.bat -gosu %SCRIPT_FILE% -user su -password gw -server %SERVER_URL% -edit %REFID%
) ELSE ( 

		@echo File does not exist : %SCRIPT_FILE%
		@echo Pleaes check the File
)
		
@GOTO EOF

:ERR_USAGE
@ECHO
@ECHO Please write the file in the format

:EOF
		

		
		