#!/bin/bash

PFAD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
read -p "How is the name of the project? " PROJECT_NAME
ECHO_NORMAL='\033[0m'
ECHO_RED='\033[0;31m'
PROJECT_LOCATION="$PFAD/$PROJECT_NAME"
PROGRAM_LOCATION="$PFAD/$PROJECT_NAME/$PROJECT_NAME.sh"
CONFIG_LOCATION="$PFAD/$PROJECT_NAME/config.sh"
USERNAME=`whoami`

if test -d $PROJECT_LOCATION ; then
  echo -e "${ECHO_RED}ERROR: ${ECHO_NORMAL}PROJECT ALREADY EXISTS"
  exit
else
  mkdir $PROJECT_LOCATION
  touch $PROGRAM_LOCATION
  {
    printf "#!/bin/bash\n"
    printf 'export CONFIG=\"$( cd \"$( dirname \"${BASH_SOURCE[0]}\" )\" &> /dev/null && pwd)\"/config.sh\n'
    printf 'source $CONFIG\n\n'
    printf "## user verification ##\n"
    printf "WHOAMI=\`whoami\`\n"
    printf 'if [ $WHOAMI != \"'
    printf "$USERNAME"
    printf "\""
    printf " ]; then\n"
    printf "  echo \"Script must be run as $USERNAME user\"\n"
    printf "  exit\n"
    printf "fi\n"
  } >>$PROGRAM_LOCATION
fi

{
printf '### printf colors ###\n\n'
printf 'NORMAL=$(tput sgr0)\n'
printf 'RED=$(tput setaf 1)\n'
printf 'GREEN=$(tput setaf 2)\n'
printf 'YELLOW=$(tput setaf 3)\n'
printf 'BLUE=$(tput setaf 4)\n'
printf 'MAGENTA=$(tput setaf 5)\n'
printf 'CYAN=$(tput setaf 6)\n'
printf 'WHITE=$(tput setaf 7)\n'
printf 'BOLD=$(tput bold)\n'
printf 'UNDERLINED=$(tput smul)\n'
printf 'LIME_YELLOW=$(tput setaf 190)\n'
printf 'POWER_BLUE=$(tput setaf 153)\n'
printf '\n### echo colors ###\n'
printf "ECHO_NORMAL='\033[0m'\n"
printf "ECHO_RED='\033[0;31m'\n"
printf "ECHO_GREEN='\033[0;32m'\n"
printf "ECHO_YELLOW='\033[0;33m'\n"
printf "ECHO_BLUE='\033[0;34m'\n"
printf "ECHO_MAGENTA='\033[0;35m'\n"
printf "ECHO_CYAN='\033[0;36m'\n"
printf "ECHO_WHITE='\033[1;37m'\n"
} >>$CONFIG_LOCATION
