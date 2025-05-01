#!/bin/bash
cd /home/ubuntu/Movix
npm install
pm2 delete all || true
pm2 start npm --name movix-app -- run dev
