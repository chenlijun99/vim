#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0" )" && pwd )"
BACKUP_DIR=".backup"

function install()
{
	if [[ -f "$HOME/.vimrc" ]]; then
		mv -vi "$HOME/.vimrc" "$SCRIPT_DIR/BACKUP_DIR"
	fi
	if [[ -d "$HOME/.vim" ]]; then
		mv -vi "$HOME/.vim" "$SCRIPT_DIR/BACKUP_DIR"
	fi
	ln -s "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
	ln -s "$SCRIPT_DIR/.vim" "$HOME/.vim"
}

function uninstall()
{
	if [[ -h "$HOME/.vimrc" ]]; then
		rm "$HOME/.vimrc"
	fi
	if [[ -h "$HOME/.vim" ]]; then
		rm "$HOME/.vim"
	fi
	mv "$SCRIPT_DIR/$BACKUP_DIR/.vimrc" "$HOME/.vimrc"
	mv "$SCRIPT_DIR/$BACKUP_DIR/.vim" "$HOME/.vim"
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
