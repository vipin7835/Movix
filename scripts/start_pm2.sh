#!/bin/bash

# Change to the project directory (optional if the script is run from there)
cd /var/www/html/Movix || exit

# Run the npm build command with sudo
sudo apt install npm -y
sudo npm i
sudo npm run build
