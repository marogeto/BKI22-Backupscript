#!/bin/bash

# Backupscript: Erstellen und Zurückspielen von Verzeichnissen
# Author : Martin Rösner
# E-Mail : roesner@elektronikschule.de
# Version: v01

# Hauptmenu ausgeben
function menu(){
	clear
	echo "|----------------------------------------------|"
	echo "| Haupmenu:                                    |"
	echo "|                                              |"
	echo "|      Backup erstellen:      B                |"
	echo "|      Inhalt eines Backups:  L                |"
	echo "|      Backup zurück spielen: R                |"
	echo "|      Backup löschen:        D                |"
	echo "|      Programm beenden:      X                |"
	echo "|                                              |"
	read -p "| Eingabe: " EINGABE
}

# Eingeben der Kompressionsmethode
function compress(){
	clear
	echo "|----------------------------------------------|"
	echo "| Kompressionsmethode:                         |"
	echo "|                                              |"
	echo "|      ZIP:                   z                |"
	echo "|      BZIP2:                 j                |"
	echo "|      XZ:                    J                |"
	echo "|                                              |"
	read -p "| Eingabe: " COMPRESS
}

# Eingeben des Backuppfades
function where2Backup(){
	clear
	echo "|----------------------------------------------|"
	echo "| Wohin soll das Backup gespeichert werden:    |"
	echo "|                                              |"
	read -p "| Eingabe: " WHERE2BACKUP 
}

# Eingeben des Pfades, der gesichert werden soll
function what2Backup(){
	clear
	echo "|----------------------------------------------|"
	echo "| Wohin soll das Backup gespeichert werden:    |"
	echo "|                                              |"
	read -p "| Eingabe: " WHAT2BACKUP 
}


function backup(){
	BACKUPFILE=$(date +%Y%m%d-%H%M%S)-backup.tgz
	YESNO=0
	until [ $YESNO = 1 ]
	do
		compress
		echo "| Sind Sie sicher das Sie die Option ${COMPRESS}         |" 
		echo "| benutzen möchten?                            |"
		read -p "| (0: nein | 1: ja) " YESNO
	done
	# 
	YESNO=0
	until [ $YESNO = 1 ]
	do
		where2Backup
		echo "| Sind Sie sicher das Sie hier in speichern möchten: ${WHERE2BACKUP}         |" 
		echo "| benutzen möchten?                            |"
		read -p "| (0: nein | 1: ja) " YESNO
	done
	#
	YESNO=0
	until [ $YESNO = 1 ]
	do
		what2Backup	
		echo "| Sind Sie sicher das Sie dieses Verzeichnis sichern wollen? ${WHAT2BACKUP}         |" 
		echo "| benutzen möchten?                            |"
		read -p "| (0: nein | 1: ja) " YESNO
	done
		
	tar cf${COMPRESS} ${WHERE2BACKUP}/$BACKUPFILE ${WHAT2BACKUP}
	sleep 2
}

function unbackup(){
	echo "UNBACKUP"
}

function listbackup(){
	echo "LISTBACKUP"
}

function deletebackup(){
	echo "DELETEBACKUP"
}

# Hauptereignisschleife
while :
do
	menu
	case $EINGABE in
		b|B)
			backup
			;;
		r|R)
			unbackup
			;;
		l|L)
			listbackup
			;;
		d|D)
			deletebackup
			;;
		*)
			echo "Und Tschüss"
			exit 1
	esac
	sleep 2
done

exit 0

