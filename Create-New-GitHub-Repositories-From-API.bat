cls
@echo off
@CHCP 1251
cls

:start

echo =============================================================================================================
echo Этот скрипт нужен для автоматизации добавления чистого проекта на GitHub / Проверено на Win 10 Версия 1803 x64
echo Для правильной работы скрипт должен лежать на каталог выше каталога проекта.
echo Не забудьте установить Git for Windows на ваш ПК.
echo =============================================================================================================
echo.

REM Присваиваем переменным пустые значения чтобы пройти проверку ввода если пользователь ничего не введет.
set ProjectName=""
set /p ProjectName="1. Введите название проекта: "

set CommitComment=""
set /p CommitComment="2. Введите комментарий к коммиту: "

set GitProfileName=""
set /p GitProfileName="3. Введите имя вашего профиля на GitHub в формате "anklav24" (Без кавычек): "

set GitHubTOKEN=""
set /p GitHubTOKEN="4. Введите токен от GitHub: "
echo.

echo Получить токен можно в личном кабинете GitHub.
echo https://github.com/settings/tokens
echo.

echo ==================================
echo Рекомендации по оформленю коммитов
echo ==================================
echo.

echo Стараться соблюдать правило: один коммит - одна решенная задача!
echo.

echo Как правило, ваши сообщения должны начинаться кратким однострочным описанием не 
echo более 50 символов, затем должна идти пустая строка, после которой следует более 
echo детальное описание. Проект Git требует, чтобы детальное описание включало вашу мотивацию 
echo при внесении изменения и сравнение с текущей реализацией - это хороший пример для 
echo подражания. Так же хорошей идеей будет использование фраз в повелительном наклонении 
echo настоящего времени. Другими словами - используйте команды. Вместо “Я добавил тесты для” 
echo или “Добавление тестов для”, используйте “Добавить тесты для”. Ниже представлен шаблон, 
echo написанный Tim Pope:
echo.
echo Краткое (50 символов или меньше) описание изменений
echo.
echo Текст более детального описания, если необходим. Старайтесь
echo не первышать длинну строки в 72 символа. В некоторых случаях
echo первая строка подразумевается как тема письма, а всё остальное -
echo тело письма. Пустая строка, разделяющая сообщение, критически важна
echo если существует детальное описание); такие утилиты как rebase
echo могут запутаться, если вы запустите сразу две.
echo.
echo Последующие параграфы должны отделяться пустыми строками.
echo.
echo   - Списки тоже подходят
echo.
echo   - Обычно, элементы списка обозначаются с помощью тире или звёздочки,
echo     предваряются одиночным пробелом, а разделяются пустой строкой, но
echo     соглашения могут отличаться
echo.

REM Проверяем ввод, если пустой присваиваем дефолтные значения на свой вкус
if %ProjectName%=="" (set ProjectName=New-Project)
if %CommitComment%=="" (set CommitComment=Auto Commit)
if %GitProfileName%=="" (set GitProfileName=Anklav24)
if %GitHubTOKEN%=="" (set GitHubTOKEN=YOUR_TOKEN)

echo Заходим в папку со скриптом:
echo %~dp0
cd %~dp0
echo.

echo Создаем папку проекта "%ProjectName%":
mkdir "%ProjectName%"
echo.

echo Заходим в папку проекта:
echo %~dp0%ProjectName%
cd %~dp0%ProjectName%
echo.

echo =======================
echo Создаем служебные файлы
echo =======================
echo.
echo - Добавляем в папку файл .gitignore и записываем/перезаписываем в него игнорируемые файлы
echo (В данном случае файл оптимизирован для Python и редакторов от компании JetBrains)

REM Здесь мои исключения
echo # You can use site gitignore.io for create .gitignore > .gitignore
echo # https://www.gitignore.io >> .gitignore
echo Your ignored files >> .gitignore
echo .idea/ >> .gitignore
REM .gitignore >> .gitignore
REM Здесь рекомендации для Python от GitHub
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