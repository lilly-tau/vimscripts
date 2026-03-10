#!/usr/bin/env bash

TEST=false
VIMPATH="$HOME/.vim"
WHICH=
while getopts "ahp:tw:" OPT; do
	case $OPT in
	p)	VIMPATH=$OPTARG;;
	t)	TEST=true;;
	w)	WHICH=$OPTARG;;
	a)	WHICH="ALL";;
	esac
done


if [[ ! -d "$VIMPATH" ]]; then
	echo "'$VIMPATH' does not exist/is not a folder, run with -p <path> or "\
		"create it."
	exit 1
fi

if [[ ! -d "$VIMPATH/syntax" ]]; then
	if mkdir "$VIMPATH/syntax"; then
		echo "Could not create syntax folder."
		exit 1
	fi
fi

if [[ ! -d "$VIMPATH/ftdetect" ]]; then
	mkdir "$VIMPATH/ftdetect" || echo "Could not create ftdetect folder."
fi

if [[ "$WHICH" = "" ]]; then
	echo "No 'which' specification."
	exit 1
elif [[ "$WHICH" = "ALL" ]]; then
	for DIR in ./*/; do
		DIR=${DIR%*/}
		cp $DIR/syntax.vim "$VIMPATH/syntax/$DIR.vim"
		cp $DIR/ftdetect.vim "$VIMPATH/ftdetect/$DIR.vim"
	done
	if [[ "$TEST" = true ]]; then
		echo "Cannot test when 'which' is ALL."
	fi
else
	if [[ ! -d "./$WHICH" ]]; then
		echo "./$WHICH does not exist/is not a folder."
		exit 1
	fi

	cp $WHICH/syntax.vim "$VIMPATH/syntax/$WHICH.vim"
	cp $WHICH/ftdetect.vim "$VIMPATH/ftdetect/$WHICH.vim"
	
	if [[ "$TEST" = true ]]; then
		vim $WHICH/test.*
	fi
fi
