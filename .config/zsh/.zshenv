export EDITOR="nvim"
export VISUAL="nvim"

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME"/python
export PYTHON_HISTORY="$XDG_STATE_HOME"/python_history
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

typeset -U path PATH
path=(~/.local/bin $path)
export PATH
