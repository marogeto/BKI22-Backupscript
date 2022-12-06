#!/bin/bash

# Backupscript: Erstellen und Zurückspielen von Verzeichnissen
# Author : Martin Rösner
# Co-Author: Till Lohr
# E-Mail : roesner@elektronikschule.de 
# Version: v02

source "funktionen.sh"

function backup(){
	BACKUPFILE=$(date +%Y%m%d-%H%M%S)-backup.tgz
	yesno-dialog compress COMPRESS "Sind Sie sicher das Sie die Option benutzen möchten?"
	yesno-dialog where2Backup WHERE2BACKUP "Sind Sie sicher das Sie hier in speichern möchten: "
	yesno-dialog what2Backup WHAT2BACKUP "Sind Sie sicher das Sie dieses Verzeichnis sichern wollen? "
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
	yesno-dialog where2Find WHERE2FIND "Wo sollen nach den Backups gesucht werden: "
	for I in $(find ${WHERE2FIND} -maxdepth 1 \( -name "*tgz" -o -name "*xz" -o -name "*bzip2" \) )
	do 
        echo "|> "$I
    	done
   	yesno-dialog what2Del WHAT2DEL "Sind Sie sicher das Sie dieses Backup löschen wollen?" 
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

