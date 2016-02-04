#!/bin/bash
# usage: lint.sh

declare -r INTERVAL=1;
declare -r SOURCE_DIR="lint-files/";

watch -n $INTERVAL "
  echo \"PHP Active Linter by Levent \\\"lzy\\\" Yumerov\";
  find $SOURCE_DIR -type f -name \"*.php\" \
    | xargs -n1 php --syntax-check \
    | grep \"^(No syntax errors detected in)\";
  clear;"