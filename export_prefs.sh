#!/usr/bin/bash

function addMissing {
	if [[ -n $MISSING ]]; then
		MISSING=$MISSING", "
	fi
	MISSING=$MISSING$1
}

MISSING=""

for dep in "gvim" "git"; do
	if [[ -z $(command -v $dep) ]]; then
		addMissing $dep
	fi
done

if [[ -n $MISSING ]]; then
	echo "Please install these programs first: $MISSING.";
	exit 1;
fi

echo "Copying files to home directory interactively:"
cp -vri ./preffiles/. ~

exit 0;
