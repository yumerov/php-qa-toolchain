#!/bin/bash
# usage: phpcs.sh <SOURCE>


# checks phpcs is installed globally 
type phpcs >/dev/null 2>&1 || { echo >&2 "This script requires phpmd installed globally. You can get it from https://github.com/squizlabs/PHP_CodeSniffer"; exit 1; }

declare -r USAGE="USAGE: bash phpcs.sh <SOURCE>";
declare -r EXAMPLE="EXAMPLE: bash phpcs.sh src/";
declare -r LOG_DIRECTORY="phpcs_logs";
declare -r SOURCE=$1;

declare error_output;

echo "PHP Code Sniffer Wrapper by Levent \"lzy\" Yumerov";
if [ "$SOURCE" ]; then
  mkdir -p "$LOG_DIRECTORY";
  phpcs $SOURCE --extensions=php --standard=PSR2 \
    --report-file=$LOG_DIRECTORY/$(date +%Y-%m-%d).log
else
  error_output="Source directory is is not set.";
fi

if [ "$error_output" ]; then
  echo -e "${error_output}\n${USAGE}\n${EXAMPLE}";
fi