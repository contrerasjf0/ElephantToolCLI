# !/bin/bash
# Main menu for postgress tool

option=0

# Install  postgres function
install_postgres () {
    echo -e "\n Checking  postgres installation...."
    checkInstall=$(which psql)
    if [ $? -eq 0 ]; then
        echo -e "\n Postgres already installed"
    else
        read -s -p "Insert sudo password:" password
        read -s -p "Insert password for  postgres:" passwordPostgres
        echo "$password" | sudo -S apt update
        echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
        sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
        echo "$password" | sudo -S systemctl enable postgresql.service
        echo "$password" | sudo -S systemctl start postgresql.service
    fi    
    read -n 1 -s -r -p "Hit [ENTER] to continue..."
}

# uninstall  postgres function
uninstall_postgres () {
    read -s -p "Insert  sudo password:" password
    echo -e "\n"
    echo "$password" | sudo -S systemctl stop postgresql.service
    echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
    echo "$password" | sudo -S rm -r /etc/postgresql
    echo "$password" | sudo -S rm -r /etc/postgresql-common
    echo "$password" | sudo -S rm -r /var/lib/postgresql
    echo "$password" | sudo -S userdel -r postgres
    echo "$password" | sudo -S groupdel postgresql
    read -n 1 -s -r -p "Hit [ENTER] to continue..."
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
