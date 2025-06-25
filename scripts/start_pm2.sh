#!/bin/bash
cd /var/www/html/Movix
npm install
pm2 delete all || true
pm2 start npm --name movix-app -- run dev
