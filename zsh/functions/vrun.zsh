# Activate a the python virtual environment specified.
# If none specified, use the first existing in $PYTHON_VENV_NAMES.
function vrun() {
  if [[ -z "$1" ]]; then
    local name
    for name in $PYTHON_VENV_NAMES; do
      local venvpath="${name:P}"
      if [[ -d "$venvpath" ]]; then
        vrun "$name"
        return $?
      fi
    done
    echo >&2 "Error: no virtual environment found in current directory"
  fi

  local name="${1:-$PYTHON_VENV_NAME}"
  local venvpath="${name:P}"

  if [[ ! -d "$venvpath" ]]; then
    echo >&2 "Error: no such venv in current directory: $name"
    return 1
  fi

  if [[ ! -f "${venvpath}/bin/activate" ]]; then
    echo >&2 "Error: '${name}' is not a proper virtual environment"
    return 1
  fi

  . "${venvpath}/bin/activate" || return $?
  echo "Activated virtual environment ${name}"
}
