#!/bin/bash

# Backupscript: Erstellen und Zurückspielen von Verzeichnissen
# Author : Martin Rösner
# Co-Author: Till Lohr
# E-Mail : roesner@elektronikschule.de 
# Version: v02

source "funktionen.sh"

function backup(){
	BACKUPFILE=$(date +%Y%m%d-%H%M%S)-backup.tgz
	yesno-dialog compress 
	yesno-dialog where2Backup 
	yesno-dialog what2Backup 
	if [ ! -d ${WHERE2BACKUP} ]
        then
                echo "| Verzeichnis ${WHERE2BACKUP} erstellt."
                mkdir -p ${WHERE2BACKUP}
        fi
	tar cf${COMPRESS} ${WHERE2BACKUP}/$BACKUPFILE ${WHAT2BACKUP}
	sleep 2
}

function unbackup(){
	yesno-dialog where2Find
	for I in $(find ${WHERE2FIND} -maxdepth 1 \( -name "*tgz" -o -name "*xz" -o -name "*bzip2" \) )
	do 
	    echo "|> "$I
    	done
	yesno-dialog what2Restore 
	yesno-dialog where2Restore
	if [ ! -d ${WHERE2RESTORE} ]
	then
		echo "| Verzeichnis ${WHERE2RESTORE} erstellt."
		mkdir -p ${WHERE2RESTORE}
	fi
	cd ${WHERE2RESTORE}
	tar xfz ${WHAT2RESTORE} ${WHERE2RESTORE}
}

function listbackup(){
	yesno-dialog where2Find 
	for I in $(find ${WHERE2FIND} -maxdepth 1 \( -name "*tgz" -o -name "*xz" -o -name "*bzip2" \) )
	do 
		echo "|> "$I
    	done
	yesno-dialog what2List 
	tar tvf ${WHAT2LIST}
	read -p "| Beliebige Taste drücken ..." 
	sleep 1
}

function deletebackup(){
	yesno-dialog where2Find 
	for I in $(find ${WHERE2FIND} -maxdepth 1 \( -name "*tgz" -o -name "*xz" -o -name "*bzip2" \) )
	do 
		echo "|> "$I
	done
   	yesno-dialog what2Del 
	rm ${WHAT2DEL}
	if [ $? = 0 ]
	then
		echo "| ${WHAT2DEL} wurde gelöscht!"
	fi
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

