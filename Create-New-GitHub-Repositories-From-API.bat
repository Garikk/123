cls
@echo off
@CHCP 1251
cls

:start

echo =============================================================================================================
echo ���� ������ ����� ��� ������������� ���������� ������� ������� �� GitHub / ��������� �� Win 10 ������ 1803 x64
echo ��� ���������� ������ ������ ������ ������ �� ������� ���� �������� �������.
echo �� �������� ���������� Git for Windows �� ��� ��.
echo =============================================================================================================
echo.

REM ����������� ���������� ������ �������� ����� ������ �������� ����� ���� ������������ ������ �� ������.
set ProjectName=""
set /p ProjectName="1. ������� �������� �������: "

set CommitComment=""
set /p CommitComment="2. ������� ����������� � �������: "

set GitProfileName=""
set /p GitProfileName="3. ������� ��� ������ ������� �� GitHub � ������� "anklav24" (��� �������): "

set GitHubTOKEN=""
set /p GitHubTOKEN="4. ������� ����� �� GitHub: "
echo.

echo �������� ����� ����� � ������ �������� GitHub.
echo https://github.com/settings/tokens
echo.

echo ==================================
echo ������������ �� ��������� ��������
echo ==================================
echo.

echo ��������� ��������� �������: ���� ������ - ���� �������� ������!
echo.

echo ��� �������, ���� ��������� ������ ���������� ������� ������������ ��������� �� 
echo ����� 50 ��������, ����� ������ ���� ������ ������, ����� ������� ������� ����� 
echo ��������� ��������. ������ Git �������, ����� ��������� �������� �������� ���� ��������� 
echo ��� �������� ��������� � ��������� � ������� ����������� - ��� ������� ������ ��� 
echo ����������. ��� �� ������� ����� ����� ������������� ���� � ������������� ���������� 
echo ���������� �������. ������� ������� - ����������� �������. ������ �� ������� ����� ���� 
echo ��� ����������� ������ ����, ����������� ��������� ����� ����. ���� ����������� ������, 
echo ���������� Tim Pope:
echo.
echo ������� (50 �������� ��� ������) �������� ���������
echo.
echo ����� ����� ���������� ��������, ���� ���������. ����������
echo �� ��������� ������ ������ � 72 �������. � ��������� �������
echo ������ ������ ��������������� ��� ���� ������, � �� ��������� -
echo ���� ������. ������ ������, ����������� ���������, ���������� �����
echo ���� ���������� ��������� ��������); ����� ������� ��� rebase
echo ����� ����������, ���� �� ��������� ����� ���.
echo.
echo ����������� ��������� ������ ���������� ������� ��������.
echo.
echo   - ������ ���� ��������
echo.
echo   - ������, �������� ������ ������������ � ������� ���� ��� ��������,
echo     ������������ ��������� ��������, � ����������� ������ �������, ��
echo     ���������� ����� ����������
echo.

REM ��������� ����, ���� ������ ����������� ��������� �������� �� ���� ����
if %ProjectName%=="" (set ProjectName=New-Project)
if %CommitComment%=="" (set CommitComment=Auto Commit)
if %GitProfileName%=="" (set GitProfileName=Anklav24)
if %GitHubTOKEN%=="" (set GitHubTOKEN=YOUR_TOKEN)

echo ������� � ����� �� ��������:
echo %~dp0
cd %~dp0
echo.

echo ������� ����� ������� "%ProjectName%":
mkdir "%ProjectName%"
echo.

echo ������� � ����� �������:
echo %~dp0%ProjectName%
cd %~dp0%ProjectName%
echo.

echo =======================
echo ������� ��������� �����
echo =======================
echo.
echo - ��������� � ����� ���� .gitignore � ����������/�������������� � ���� ������������ �����
echo (� ������ ������ ���� ������������� ��� Python � ���������� �� �������� JetBrains)

REM ����� ��� ����������
echo # You can use site gitignore.io for create .gitignore > .gitignore
echo # https://www.gitignore.io >> .gitignore
echo Your ignored files >> .gitignore
echo .idea/ >> .gitignore
REM .gitignore >> .gitignore
REM ����� ������������ ��� Python �� GitHub
echo # Byte-compiled / optimized / DLL files >> .gitignore
echo __pycache__/ >> .gitignore
echo *.py[cod] >> .gitignore
echo *$py.class >> .gitignore
echo. >> .gitignore
echo # C extensions >> .gitignore
echo *.so >> .gitignore
echo. >> .gitignore
echo # Distribution / packaging >> .gitignore
echo .Python >> .gitignore
echo build/ >> .gitignore
echo develop-eggs/ >> .gitignore
echo dist/ >> .gitignore
echo downloads/ >> .gitignore
echo eggs/ >> .gitignore
echo .eggs/ >> .gitignore
echo lib/ >> .gitignore
echo lib64/ >> .gitignore
echo parts/ >> .gitignore
echo sdist/ >> .gitignore
echo var/ >> .gitignore
echo wheels/ >> .gitignore
echo *.egg-info/ >> .gitignore
echo .installed.cfg >> .gitignore
echo *.egg >> .gitignore
