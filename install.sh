#!/usr/bin/env bash

# TODO: Better logging
# TODO: Check if directories available or not and if the binaries are installed
# TODO: eg: if chmod exisits, if cp exists and if /usr/local/bin exists...
echo "Setting up..."
sudo cp ./matrix /usr/local/bin/ 
sudo chmod +x /usr/local/bin/matrix
if [[ $? ]]; then
    echo "Setup complete..."
    echo "Type in \"matrix\" and see what happens..."
else
    1>&2 echo "setup not complete, error encountered..."
fi
