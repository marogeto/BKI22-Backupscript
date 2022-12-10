
# Backupscript: Erstellen und Zurückspielen von Verzeichnissen
# Author : Martin Rösner
# Co-Author: Till Lohr
# E-Mail : roesner@elektronikschule.de 
# Version: v02

# Variablen init
COMPRESS="z"
WHERE2BACKUP="/tmp"
WHAT2BACKUP="/home"
WHERE2FIND="/tmp"
WHERE2RESTORE="/tmp"
WHAT2LIST="/tmp"
WHAT2DEL="/tmp"


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
	echo "| Sind Sie sicher das Sie die Option \"${COMPRESS}\" benutzen möchten?"
}

# Eingeben des Backuppfades
function where2Backup(){
        #clear
        echo "|----------------------------------------------|"
        echo "| Wohin soll das Backup gespeichert werden:    |"
        echo "|                                              |"
        read -p "| Eingabe: " WHERE2BACKUP
	echo "| Sind Sie sicher das Sie hier \"${WHERE2BACKUP}\" in speichern möchten?"
}

# Eingeben des Pfades, der gesichert werden soll
function what2Backup(){
        #clear
        echo "|----------------------------------------------|"
        echo "| Welches Verzeichnis soll gesichert werden:   |"
        echo "|                                              |"
        read -p "| Eingabe: " WHAT2BACKUP
	echo "| Sind Sie sicher das Sie dieses Verzeichnis \"${WHAT2BACKUP}\" sichern wollen?"
}

# Eingeben des Pfades, wo gesucht werden soll nach Backups
function where2Find(){
	#clear
	echo "|----------------------------------------------|"
	echo "| Wo soll nach Backups gesucht werden:         |"
	echo "|                                              |"
	read -p "| Eingabe: " WHERE2FIND 
	echo "| Sicher, dass hier \"${WHERE2FIND}\" nach Backups gesucht werden soll? "
}

# Eingeben des Backuppfades
function where2Restore(){
        #clear
        echo "|----------------------------------------------|"
        echo "| Wohin soll das Backup ausgepackt werden:     |"
        echo "|                                              |"
        read -p "| Eingabe: " WHERE2RESTORE
	echo "| Sind Sie sicher das Sie das BAckup hier \"${WHERE2RESTORE}\" entpacken wollen?" 
}

# Eingeben des Backups, welches aufgelistet werden soll
function what2List(){
	#clear
	echo "|----------------------------------------------|"
	echo "| Welches Backups soll gezeigt werden:         |"
	echo "|                                              |"
	read -p "| Eingabe: " WHAT2LIST
	echo "| Sind Sie sicher das Sie dieses Backup \"${WHAT2LIST}\" auflisten wollen?"
}

# Eingeben des Backups, welches aufgelistet werden soll
function what2Restore(){
        #clear
        echo "|----------------------------------------------|"
        echo "| Welches Backups soll gezeigt werden:         |"
        echo "|                                              |"
        read -p "| Eingabe: " WHAT2RESTORE
        echo "| Sind Sie sicher das Sie dieses Backup \"${WHAT2RESTORE}\" einspielen wollen?"
}

# Eingeben des BAckup im absoluten Pfad, welches gelöscht werden soll
function what2Del(){
	echo "|----------------------------------------------|"
	echo "| Welches Backups soll gelöscht werden:        |"
	echo "|                                              |"
	read -p "| Eingabe: " WHAT2DEL 
	echo "| Sind Sie sicher das Sie dieses Backup \"${WHAT2DEL}\" löschen wollen?"
}

function yesno-dialog(){
        YESNO=0
        until [ $YESNO = 1 ]
        do
		$1
		read -p "| (0: nein | 1: ja) " YESNO
        done
}


