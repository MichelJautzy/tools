#Installation sous windows : 
##Etape 1 : installer git
- Aller sur https://git-scm.com/downloads
- télécharger git pour windows
- L'installer, en acceptant toutes les options par défaut

##Etape 2 Installer image magick
- Aller sur https://imagemagick.org/script/download.php
- Scroller la page vers le bas et choisir la première version proposé dans 'Windows Binary Release'. 
- A présent, elle est proposée en téléchargement juste en dessous du texte : 'we recommend this version of ImageMagick for 64-bit Windows:'

##Etape 3 Installer le script de Bluesquare
- Sur le bureau faites clic droit > Open git terminal here
- Le terminal git s'ouvre. Entrez alors :

```git clone https://github.com/MichelJautzy/tools.git```

Le dossier tools est alors créé sur le bureau. 

- Dans votre terminal faites 
- ```cd tools``` pour vous placer dans le dossier tools, Vous pourrez systématiquement 'tirer' la dernière version en réalisant la commande 
```git pull```

- Pour lancer le script, désormais, faites 
```cd optimize_images``` pour vous placer à l'intérieur du dossier optimize_image

Vous pouvez alors lancer le script avec la commande 
```sh optimize.sh```

Le script prend alors les images du dossier input et les compresse pour les mettre dans le dossier output