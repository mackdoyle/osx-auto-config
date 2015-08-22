#!/bn/bah
# ======================================================================
# Handle command line options
# ======================================================================

# Help function
# ----------------------------------------------------------------------
function HELP {
  echo -e \\n"${BOLD}Basic usage:${RESET} ${BOLD}${SCRIPT} <file_name>${RESET}"\\n
  echo "To execute this script, pass one of the following options."
  echo "${BOLD}-a <FILE>${RESET}   - Provisions OS X with an opnionated selection of apps."
  echo "${BOLD}-f <FILE> ${RESET}  - Pass file that contains a line delimited list of apps to install and configure."
  echo "${BOLD}-l <FILE> ${RESET}  - Pass a space delimited list, in quotes, of apps to install and configure."
  echo "${BOLD}-s <FILE> ${RESET}  - Show all supported applications."
  echo -e "${BOLD}-h ${RESET}         - Displays this help text."\\n
  echo -e "Examples:"\\n
  echo -e "${BOLD}${SCRIPT} ${BLUE}-a${RESET}"\\n
  echo -e "${BOLD}${SCRIPT} ${BLUE}-f ${GREEN}~/Desktop/example_list.xyz${RESET}"\\n
  echo -e "${BOLD}${SCRIPT} ${BLUE}-l${RESET} ${BOLD}'${GREEN}airmail git masscan pygments rbenv${RESET}${BOLD}'"\\n
  exit 1
}


#Parse Command Line Options
# ----------------------------------------------------------------------
while getopts :af:l:sh FLAG; do
  case $FLAG in
    a) # Load list of all supported apps
      source_recipes_all # returns $sourced_recipes
      ;;
    f) # Create list of recipe sources from an arument list
      APP_LIST=$(cat $OPTARG)
      #source_recipes $APP_LIST # returns $sourced_recipes
      sourced_recipes=$APP_LIST
      ;;
    l)
      #APP_LIST=( $OPTARG )
      
      # Create list of recipes sources from an arument list
      source_recipes $OPTARG # returns $sourced_recipes
      exit 1

      #counter=0
      #for n in ${APP_LIST[*]}; do
      #  counter=$[counter + 1]
      #  echo "$n"
      #done
      ;;
    s)
      echo "Show a list of supported apps"
      exit 1
      ;;
    h)
      HELP
      ;;
    \?)  # Show Option Argument Error
      echo -e \\n"${RED}ERROR: (◦︵○)${RESET}\\nInvalid option: ${BOLD}-$OPTARG${RESET}. Use ${BOLD}-h${RESET} for help." 
      exit 1
      ;;
    :)  # Show Invalid Argument Error
      echo -e \\n"${RED}ERROR: (◦︵○)${RESET}\\nOption ${BOLD}-$OPTARG${RESET} requires an argument. Use ${BOLD}-h${RESET} for help."
      exit 1
      ;;
  esac
done

# Cleanup
unset APP_LIST
unset counter
# Tell getops to move to next option
shift $((OPTIND-1))

# Catch when no argumnets are passed, and redirect to help
if [ $OPTIND -eq 1 ]; then exec $SCRIPT -h exit 1; fi









