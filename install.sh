#!/bin/bash

echo "cloning one_liner..."

mkdir ~/one_liner
cd ~/one_liner
git clone https://github.com/theophileTheKing/one_liner.git .

echo "installation starting..."

bash ./one_liner/main.sh
