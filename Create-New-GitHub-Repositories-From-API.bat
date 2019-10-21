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
echo MANIFEST >> .gitignore
echo. >> .gitignore
echo # PyInstaller >> .gitignore
echo #  Usually these files are written by a python script from a template >> .gitignore
echo #  before PyInstaller builds the exe, so as to inject date/other infos into it. >> .gitignore
echo *.manifest >> .gitignore
echo *.spec >> .gitignore
echo. >> .gitignore
echo # Installer logs >> .gitignore
echo pip-log.txt >> .gitignore
echo pip-delete-this-directory.txt >> .gitignore
echo. >> .gitignore
echo # Unit test / coverage reports >> .gitignore
echo htmlcov/ >> .gitignore
echo .tox/ >> .gitignore
echo .coverage >> .gitignore
echo .coverage.* >> .gitignore
echo .cache >> .gitignore
echo nosetests.xml >> .gitignore
echo coverage.xml >> .gitignore
echo *.cover >> .gitignore
echo .hypothesis/ >> .gitignore
echo .pytest_cache/ >> .gitignore
echo. >> .gitignore
echo # Translations >> .gitignore
echo *.mo >> .gitignore
echo *.pot >> .gitignore
echo. >> .gitignore
echo # Django stuff: >> .gitignore
echo *.log >> .gitignore
echo local_settings.py >> .gitignore
echo db.sqlite3 >> .gitignore
echo. >> .gitignore
echo # Flask stuff: >> .gitignore
echo instance/ >> .gitignore
echo .webassets-cache >> .gitignore
echo. >> .gitignore
echo # Scrapy stuff: >> .gitignore
echo .scrapy >> .gitignore
echo. >> .gitignore
echo # Sphinx documentation >> .gitignore
echo docs/_build/ >> .gitignore
echo. >> .gitignore
echo # PyBuilder >> .gitignore
echo target/ >> .gitignore
echo. >> .gitignore
echo # Jupyter Notebook >> .gitignore
echo .ipynb_checkpoints >> .gitignore
echo. >> .gitignore
echo # pyenv >> .gitignore
echo .python-version >> .gitignore
echo. >> .gitignore
echo # celery beat schedule file >> .gitignore
echo celerybeat-schedule >> .gitignore
echo. >> .gitignore
echo # SageMath parsed files >> .gitignore
echo *.sage.py >> .gitignore
echo echo  >> .gitignore
echo # Environments >> .gitignore
echo .env >> .gitignore
echo .venv >> .gitignore
echo env/ >> .gitignore
echo venv/ >> .gitignore