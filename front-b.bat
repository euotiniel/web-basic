@echo off

REM Define a sequência de escape ANSI para cor verde

REM Solicita ao usuário o nome da pasta
set /p folderName=Digite o nome da pasta: 

REM Verifica se a pasta já existe
IF EXIST "%folderName%" (
    echo A pasta "%folderName%" já existe. Por favor, tente outro nome.
    exit /b
)

REM Cria a pasta
mkdir "%folderName%"

REM Cria o arquivo "README.md" dentro da pasta
echo # README > "%folderName%\README.md"

REM Cria o arquivo "index.html" dentro da pasta
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta http-equiv="X-UA-Compatible" content="IE=edge"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>Document^</title^>
echo     ^<link rel='stylesheet' href='styles/style.css'^>
echo ^</head^>
echo ^<body^>
echo    ^<div id='container'^>
echo        ^<h1^>Hello world!^</h1^>
echo    ^</div^>
echo ^<script src='js/app.js'^>^</script^>
echo ^</body^>
echo ^</html^>
) > "%folderName%\index.html"

REM Cria a pasta "styles"
mkdir "%folderName%\styles"

REM Cria o arquivo "style.css" dentro da pasta "styles"
(
echo ^* {
echo     margin: 0;
echo     padding: 0;
echo     box-sizing: border-box;
echo     font-family: sans-serif;
echo }
echo.
echo ^#container {
echo     display: flex;
echo     justify-content: center;
echo     align-items: center;
echo     height: 100vh;
echo }
) > "%folderName%\styles\style.css"

REM Cria a pasta "js"
mkdir "%folderName%\js"

REM Cria o arquivo "app.js" dentro da pasta "js"
echo console.log('Hello World!'); > "%folderName%\js\app.js"

REM Exibe uma mensagem de confirmação
echo Estrutura de pasta e arquivos criados com sucesso.

REM Abre a pasta no Visual Studio Code
cd "%folderName%"
code .
