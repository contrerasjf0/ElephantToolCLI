# !/bin/bash
# Main menu for postgress tool

option=0

# Install  postgres function
install_postgres () {
    echo "Installing postgres..."
}

# uninstall  postgres function
uninstall_postgres () {
    echo "Uninstalling postres..."
}

# Generate backup function
generate_backup () {
    echo "Generating backup..."
    echo "Backup Dir: $1"
}

# restore backup function
restore_backup () {
    echo "Restore backup..."
    echo "Backup Dir: $1"
}


while :
do
    #Clear the screen
    clear
    #Show the menu
    echo "-----------------------------------------"
    echo "PGTOOL - Helper tools for Postgress      "
    echo "-----------------------------------------"
    echo "                  MENU                   "
    echo "-----------------------------------------"
    echo "1. Install Postgres"
    echo "2. Uninstall Postgres"
    echo "3. Make a backup"
    echo "4. Restart backup"
    echo "5. Exit"

    #Select a option
    read -n1 -p "Select a option  [1-5]:" option

    echo -e "\n\n"

    case $option in
         1)
            install_postgres
            sleep 2
            ;;
         2)
            uninstall_postgres
            sleep 2
            ;;
         3)
             read -p "Backup Dir: " backupDir
             generate_backup backupDir
             sleep 2
             ;;
         4)
             read -p "Backup Dir: " backupDir
             restore_backup backupDir
             sleep 2
             ;;
         5)
             echo "Exit"
             exit 0
             ;;
   esac
done
