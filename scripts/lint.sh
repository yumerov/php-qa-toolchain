#!/bin/bash
# usage: lint.sh <SOURCE_DIRECTORY> <INTERVAL>

declare -r USAGE="USAGE: bash lint.sh <SOURCE_DIRECTORY> <INTERVAL>";
declare -r EXAMPLE="EXAMPLE: bash lint.sh src/ 5";
declare -r SOURCE_DIR=$1;
declare -r INTERVAL=$2;
declare error_output;

if [ "$SOURCE_DIR" ]; then
  if [ -d "$SOURCE_DIR" ]; then
    if [ "$INTERVAL" ]; then
      if [[ "$INTERVAL" =~ ^[0-9]+$ ]]; then
        watch -n $INTERVAL "
          echo \"PHP Active Linter by Levent \\\"lzy\\\" Yumerov\";
          find $SOURCE_DIR -type f -name \"*.php\" \
            | xargs -n1 php --syntax-check \
            | grep \"^(No syntax errors detected in)\";
          clear;";
      else
        error_output="Check interval must be a number.";
      fi
    else
      error_output="Check interval is not set.";
    fi
  else
    error_output="Directory \"${SOURCE_DIR}\" does not exist.";
  fi
else
  error_output="Source directory is not set.";
fi

if [ "$error_output" ]; then
  echo -e "${error_output}\n${USAGE}\n${EXAMPLE}";
fi