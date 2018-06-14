#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0" )" && pwd )"
BACKUP_DIR="$SCRIPT_DIR/.backup"
mkdir -p $BACKUP_DIR

function install()
{
	if [[ -a "$HOME/.vimrc"  ]]; then
		mv -vi "$HOME/.vimrc" "$BACKUP_DIR/.vimrc"
	fi
	if [[ $? -eq 0 ]]; then
		ln -s "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
	fi

	if [[ -a "$HOME/.vim"  ]]; then
		mv -vi "$HOME/.vim" "$BACKUP_DIR/.vim"
	fi
	if [[ $? -eq 0 ]]; then
		ln -s "$SCRIPT_DIR/.vim" "$HOME/.vim"
	fi

	vim -c "PlugInstall" -c "qa!"
}

function uninstall()
{
	if [[ -h "$HOME/.vimrc" ]]; then
		rm "$HOME/.vimrc"
	fi
	if [[ -h "$HOME/.vim" ]]; then
		rm "$HOME/.vim"
	fi
	if [[ -a "$BACKUP_DIR/.vimrc" ]]; then
		mv -vi "$BACKUP_DIR/.vimrc" "$HOME/.vimrc"
	fi
	if [[ -a "$BACKUP_DIR/.vim" ]]; then
		mv -vi "$BACKUP_DIR/.vim" "$HOME/.vim"
	fi
}

function main()
{
	if [[ $1 == "--uninstall" ]]; then
		uninstall
	elif [[ $# -eq 0 ]]; then
		install
	fi
}

main "$@"
