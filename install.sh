#!/bin/bash
#
# CFG Installation Script
# Symlink the cfg files to the game's cfg folder
#
# Copyright (c) 2017 Zachary Matthews.

cfgs=./*.cfg

# If not getting only one arguement
if [ $# != 1 ]; then
	echo "Incorrect number of arguements"
	exit 1
fi

if [ -d ${1} ]; then
	install_loc=$(realpath $1)
else
	echo "$1 is not a directory"
	exit 1
fi

for cfg in $cfgs; do
	cfg_name=$(basename "$cfg")
	real_cfg="$PWD/$cfg_name"
	sym_cfg="$install_loc/$cfg_name"

	# Linking
	ln -s "${real_cfg}" "${sym_cfg}"
done

echo "CFGs installed"
