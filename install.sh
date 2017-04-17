#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0" )" && pwd )"
BACKUP_DIR=".backup"

function install()
{
	if [[ -f "$HOME/.vimrc" ]]; then
		mv -vi "$HOME/.vimrc" "$SCRIPT_DIR/$BACKUP_DIR/.vimrc"
	fi
	if [[ -d "$HOME/.vim" ]]; then
		mv -vi "$HOME/.vim" "$SCRIPT_DIR/$BACKUP_DIR/.vim"
	fi
	ln -s "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
	ln -s "$SCRIPT_DIR/.vim" "$HOME/.vim"
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
	if [[ -f "$SCRIPT_DIR/$BACKUP_DIR/.vimrc" ]]; then
		mv -vi "$SCRIPT_DIR/$BACKUP_DIR/.vimrc" "$HOME/.vimrc"
	fi
	if [[ -d "$SCRIPT_DIR/$BACKUP_DIR/.vim" ]]; then
		mv -vi "$SCRIPT_DIR/$BACKUP_DIR/.vim" "$HOME/.vim"
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
