#!/usr/bin/env bash

set -eu -o pipefail
#set -x

# TODO: Better logging
# TODO: Check if directories available or not and if the binaries are installed
# TODO: eg: if chmod exisits, if cp exists and if /usr/local/bin exists...

echo "Setting up..."
EXEC_PATH="$(sudo grealpath matrix 2>/dev/null || sudo realpath matrix 2>/dev/null || ( echo "realpath/grealpath commands not found..."; exit 1 ))"
EXECUTABLE="/usr/local/bin/matrix"

if [[ -d "${EXECUTABLE%/*}" ]]; then
    echo "Directory ${EXECUTABLE%/*} found..."
    sudo ln -s "${EXEC_PATH}" "${EXECUTABLE}"
else
    >&2 echo "Directory \"/usr/local/bin\" not found"
    exit 1
fi

if [[ $? ]]; then
    echo "Setup complete..."
    echo "Type in \"matrix\" and see what happens..."
    exit 0
else
    1>&2 echo "setup not complete, error encountered..."
    exit 1
fi
