# !/bin/bash
# Main menu for postgress tool

option=0

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
            echo -e "Installing"
            sleep 2
            ;;
         2)
            echo "Uninstalling"
            sleep 2
            ;;
         3)
             echo "Making backup"
             sleep 2
             ;;
         4)
             echo "Restart backup"
             sleep 2
             ;;
         5)
             echo "Exit"
             exit 0
             ;;
   esac
done
