#!/bin/bash

# Backupscript: Erstellen und Zurückspielen von Verzeichnissen
# Author : Martin Rösner
# E-Mail : roesner@elektronikschule.de
# Version: v01

source "funktionen.sh"

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
	YESNO=0
	until [ $YESNO = 1 ]
	do
		where2Find
		echo "| Wo sollen nach den Backups gesucht werden: ${WHERE2FIND}         |"
		read -p "| (0: nein | 1: ja) " YESNO
	done
	for I in $(find ${WHERE2FIND} -maxdepth 1 \( -name "*tgz" -o -name "*xz" -o -name "*bzip2" \) )
	do 
        echo "|> "$I
    	done
    
	YESNO=0
	until [ $YESNO = 1 ]
	do
		what2Del	
		echo "| Sind Sie sicher das Sie dieses Backup löschen wollen? ${WHAT2DEL}         |" 
		read -p "| (0: nein | 1: ja) " YESNO
	done
		
	echo rm ${WHAT2DEL}
	sleep 2

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

