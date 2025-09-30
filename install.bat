@echo off

REM --- Go to the Sphinx directory ---
cd sphinx
IF ERRORLEVEL 1 (
    echo Failed to navigate to sphinx
    pause
    exit /b 1
)

REM --- Create Python virtual environment for Sphinx ---
python -m venv sphinx_venv
IF ERRORLEVEL 1 (
    echo Failed to create Sphinx virtual environment
    pause
    exit /b 1
)

REM --- Upgrade pip and install Sphinx requirements ---
sphinx_venv\Scripts\python.exe -m pip install --upgrade pip
sphinx_venv\Scripts\python.exe -m pip install -r requirements.txt

REM --- Go to Myst-Editor directory ---
cd ..\myst-editor
IF ERRORLEVEL 1 (
    echo Failed to navigate to myst-editor
    pause
    exit /b 1
)

REM --- Create Python virtual environment for Myst-Editor ---
python -m venv myst_venv
IF ERRORLEVEL 1 (
    echo Failed to create Myst-Editor virtual environment
    pause
    exit /b 1
)

REM --- Upgrade pip and install Myst-Editor requirements ---
myst_venv\Scripts\python.exe -m pip install --upgrade pip
myst_venv\Scripts\python.exe -m pip install -r requirements.txt

echo.
echo Setup complete!

REM --- Launch the Sphinx WYSIWYG editor server ---
call launch_myst_editor_server.bat

pause
