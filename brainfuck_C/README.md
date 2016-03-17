#Interpréteur Brainfuck en C
Encore une fois, je me rend compte que la version de Nuki est proche de la mienne du côté
fonctionnel :( - Comme le charcount, pas de printf. Cette version peut lire soit une
liste d'instruction directe, soit un nom de fichier.

#Utilisation du programme
`./brainfuck "nom du fichier"` OU `./brainfuck "liste d'instructions"`

#Commandes du Makefile
##Compilation du programme
`make`

##Nettoyage des fichiers .o
`clean`

##Nettoyage total (fichiers .o, exécutable, librairie)
`fclean`
