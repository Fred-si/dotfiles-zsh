#!/usr/bin/env sh

REPOSITORIES_ROOT="git@github.com:fred-si-conf"

CONFIG_DIRECTORY="${XDG_CONFIG_HOME:-${HOME}/.config}"
ZSH_DIRECTORY="${CONFIG_DIRECTORY}/zsh"
ENV_FILE="${HOME}/.zshenv"

error() {
    echo "Error: $1" > /dev/stderr
    exit "${2:-1}"
}

if [ -e "${ZSH_DIRECTORY}" ]; then
    error "directory ${ZSH_DIRECTORY} already exists"
fi

if [ -e "${ENV_FILE}" ]; then
    error "file ${ENV_FILE} already exists"
fi

if ! which git > /dev/null 2>&1; then
    error "Git dependency not found"
fi

git clone "${REPOSITORIES_ROOT}/dotfiles-zsh.git" "${ZSH_DIRECTORY}"
ln -s "${ZSH_DIRECTORY}/zshenv.zshrc" "${ENV_FILE}"
