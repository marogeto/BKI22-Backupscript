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

# Eingeben des Pfades, wo gesucht werden soll nach Backups
function where2Find(){
	clear
	echo "|----------------------------------------------|"
	echo "| Wo soll nach Backups gesucht werden:         |"
	echo "|                                              |"
	read -p "| Eingabe: " WHERE2FIND 
}

# Eingeben des BAckup im absoluten Pfad, welches gelöscht werden soll
function what2Del(){
	echo "|----------------------------------------------|"
	echo "| Welches Backups soll gelöscht werden:        |"
	echo "|                                              |"
	read -p "| Eingabe: " WHAT2DEL 
}
