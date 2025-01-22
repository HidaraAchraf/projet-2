
guess_game() {
  local file_count=$(ls -1 | wc -l) 
  local guess=-1

  echo "Bienvenue dans le jeu de devinettes !"
  echo "Combien de fichiers y a-t-il dans le répertoire actuel ?"

  while [[ $guess -ne $file_count ]]; do
    read -p "Entrez votre estimation : " guess

    if [[ $guess -lt $file_count ]]; then
      echo "Trop bas ! Essayez encore."
    elif [[ $guess -gt $file_count ]]; then
      echo "Trop haut ! Essayez encore."
    else
      echo "Félicitations ! Vous avez trouvé le bon nombre de fichiers : $file_count."
    fi
  done
}

guess_game

---

# Makefile

SHELL := /bin/bash

all:
	@bash guessinggame.sh

readme:
	echo "# Projet Guessing Game" > README.md
	echo "" >> README.md
	echo "Le programme guessinggame.sh demande à l'utilisateur de deviner le nombre de fichiers dans le répertoire actuel." >> README.md
	echo "" >> README.md
	echo "**Date de génération**: $(shell date)" >> README.md
	echo "**Nombre de lignes dans le script**: $(shell wc -l < guessinggame.sh)" >> README.md
