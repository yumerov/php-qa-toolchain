# PHP Linting

Bash script **lint.sh** lints php file in directory given as first argument once per N seconds given as second argument.

## Usage

bash lint.sh <SOURCE_DIRECTORY> <INTERVAL>

## Example

bash lint.sh src/ 5

## Errors

If you forget to give an arguments, stop the process and prints suitable message.