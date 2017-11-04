
#!/bin/sh

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

# Eliminar carpeta public
rm -rf public
# Hacer build
hugo --theme hugo-identity-theme
# Entrar en la carpeta
cd public
# Iniciar un repo de git
git init
# Añadir todo en un commit
git add --all && git commit -m "Publishing to gh-pages (publish.sh)"
# Setear el remoto de mi repo de GH-Pages
git remote add origin https://github.com/MrBrownser/MrBrownser.github.io.git
# Hacer push (con force...)
git push origin master -f
