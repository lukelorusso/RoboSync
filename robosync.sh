pause() {
    read -s -n 1 -p "Press any key to continue..."
    echo
}
# Acquiring vars from args
if [[ ( $# -gt 2 ) || ( $# -eq 1 && $1 = "--help" ) || ( $# -eq 1 && $1 = "-h" ) ]]
then
    echo "Usage: robosync [ORIGIN] [DESTINATION]"
    echo "e.g.: robosync ./origin/ ./destination/"
    echo "[remember to include the last slash]"
    echo
    echo "Use it to backup (clone) one folder to another:"
    echo "the DESTINATION will become an exact copy of the ORIGIN folder."
    echo "ORIGIN and DESTINATION are optional: if you don't specify them you will be asked to input them."
    echo
    echo "Here's how the copy is done:"
    echo "- if a file exists in ORIGIN does not exist in DESTINATION, it will be created; dates will be kept"
    echo "- if a file already exists in DESTINATION, it will be overridden only if"
    echo "  • the content don't match its ORIGIN counterpart"
    echo "  • the dates are different"
    echo "- if a file exists in DESTINATION but not in ORIGIN, it will be deleted"
    exit 1
fi
# Settings vars if args are empty
robosync_origin=$1
robosync_destination=$2
if [ $# -ne 2 ] || [ -z "$1" ] || [ -z "$2" ]
then
    echo
    echo Specify the absolute or relative path of the ORIGIN folder [without quotes]
    echo e.g.: /path/to/origin/ [remember to include the last slash]
    echo -e -n "\nORIGIN: "
    read robosync_origin
    echo
    echo Specify the absolute or relative path of a DESTINATION folder
    echo e.g.: /path/to/destination/ [remember to include the last slash]
    echo -e -n "\nDESTINATION: "
    read robosync_destination
fi
# Warning
clear
echo WARNING! The DESTINATION folder at this path:
echo $robosync_destination
echo
echo will become an ${bold}exact copy${normal} of the ORIGIN folder:
echo $robosync_origin
echo
echo -e "\033[0;31mALL FILES in the destination folder which are NOT EXISTING in the origin folder WILL BE DESTROYED!\nIf the same filename exists in both folders, THE DESTINATION FILE WILL BE OVERRIDDEN!\nIf you are not sure, press CTRL+C or just close this session/window to stop the process.\n\nAre you REALLY SURE you want to start the ROBOCOPY?\033[0m"
pause
# Execution
rsync -avh --delete "$robosync_origin" "$robosync_destination"
# Finished
echo
echo "I did my job! Check eventual error messages before. Bye! 😉"
echo
pause
