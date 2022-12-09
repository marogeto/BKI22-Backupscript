
# Backupscript: Erstellen und Zurückspielen von Verzeichnissen
# Author : Martin Rösner
# Co-Author: Till Lohr
# E-Mail : roesner@elektronikschule.de 
# Version: v02


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
        echo "| Welches Verzeichnis soll gesichert werden:   |"
        echo "|                                              |"
        read -p "| Eingabe: " WHAT2BACKUP
}

# Eingeben des Pfades, wo gesucht werden soll nach Backups
function where2Find(){
	clear
	echo "|----------------------------------------------|"
	echo "| Wo soll nach Backups gesucht werden:         |"
	echo "|                                              |"
	read -p "| Eingabe: " WHERE2FIND 
}

# Eingeben des Backuppfades
function where2Restore(){
        clear
        echo "|----------------------------------------------|"
        echo "| Wohin soll das Backup ausgepackt werden:     |"
        echo "|                                              |"
        read -p "| Eingabe: " WHERE2RESTORE
}

# Eingeben des Backups, welches aufgelistet werden soll
function what2List(){
	clear
	echo "|----------------------------------------------|"
	echo "| Welches Backups soll gezeigt werden:         |"
	echo "|                                              |"
	read -p "| Eingabe: " WHAT2LIST 
}

# Eingeben des BAckup im absoluten Pfad, welches gelöscht werden soll
function what2Del(){
	echo "|----------------------------------------------|"
	echo "| Welches Backups soll gelöscht werden:        |"
	echo "|                                              |"
	read -p "| Eingabe: " WHAT2DEL 
}

function yesno-dialog(){
        YESNO=0
        until [ $YESNO = 1 ]
        do
                $1
                echo "| $3 \(${2}\)"  
                read -p "| (0: nein | 1: ja) " YESNO
        done
}


