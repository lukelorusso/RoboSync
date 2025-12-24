# README #

## RoboSync ##

A folder cloning tool for your terminal: use it to backup (clone) one folder to another.
- For Linux/macOS you can use the .sh version 
- For Windows you can use the .cmd version

## Permissions ##

For Linux, put the script in your `~/bin` folder, then do:
`$ chmod +x ~/bin/robosync.sh`

---

For macOS, put the script in your bin folder. If you don't have one, you can create `~/bin` in your home folder and then do:
`$ echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc`

Then do:
`$ chmod 775 ~/bin/robosync.sh`

---

For Windows, put the script in your bin folder. If you don't have one, you can create `bin` in your user folder and then do:
`setx PATH "%PATH%;%USERPROFILE%\bin\"`

## Usage ##

`robosync(.sh) [ORIGIN] [DESTINATION]`

For Linux and macOS please remember to include the last slash (e.g.: `robosync.sh ./origin/ ./destination/`).

ORIGIN and DESTINATION are optional: if you don't specify them you will be asked to input them.

Here's how the copy is done:
- if a file exists in ORIGIN does not exist in DESTINATION, it will be created; dates will be kept
- if a file already exists in DESTINATION, it will be overridden only if  
  • the content don't match its ORIGIN counterpart  
  • the dates are different
- if a file exists in DESTINATION but not in ORIGIN, it will be deleted

- - -

## Copyright ##

Copyright 2025 LUCA LORUSSO - https://lukelorusso.com/  
