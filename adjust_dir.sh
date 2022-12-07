#!/bin/sh
mkdir -p build/
USER=$(whoami)
PATTERN="11s/.*/local home_directory = \'\/home\/${USER}\'/"
sed -e "${PATTERN}" rc.lua > build/adjusted.lua