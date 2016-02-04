#!/bin/bash
# usage: phpmd.sh

# checks phpmd is installed globally 
type phpmd >/dev/null 2>&1 || { echo >&2 "This script requires phpmd installed globally. You can get it from http://phpmd.org/"; exit 1; }

declare -r USAGE="USAGE: bash phpmd.sh <SOURCE_DIRECTORY>";
declare -r EXAMPLE="EXAMPLE: bash phpmd.sh src/";
declare -r LOG_DIRECTORY="phpmd_logs";

declare -r SOURCE_DIRECTORY=$1;
declare error_output;

echo "PHP Mess Detector Wrapper by Levent \"lzy\" Yumerov";
if [ "$SOURCE_DIRECTORY" ]; then
  if [ -d "$SOURCE_DIRECTORY" ]; then
    mkdir -p "$LOG_DIRECTORY";
    phpmd $SOURCE_DIRECTORY text cleancode --reportfile "$LOG_DIRECTORY"/cleancode.log;
    phpmd $SOURCE_DIRECTORY text codesize --reportfile "$LOG_DIRECTORY"/codesize.log;
    phpmd $SOURCE_DIRECTORY text controversial --reportfile "$LOG_DIRECTORY"/controversial.log;
    phpmd $SOURCE_DIRECTORY text design --reportfile "$LOG_DIRECTORY"/design.log;
    phpmd $SOURCE_DIRECTORY text naming --reportfile "$LOG_DIRECTORY"/naming.log;
    phpmd $SOURCE_DIRECTORY text unusedcode --reportfile "$LOG_DIRECTORY"/unusedcode.log;
  else
    error_output="Directory \"$SOURCE_DIRECTORY\" is not set.";
  fi
else
  error_output="Source directory is is not set.";
fi

if [ "$error_output" ]; then
  echo -e "${error_output}\n${USAGE}\n${EXAMPLE}";
fi