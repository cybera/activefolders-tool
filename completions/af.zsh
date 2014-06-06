if [[ ! -o interactive ]]; then
    return
fi

compctl -K _af af

_af() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(af commands)"
  else
    completions="$(af completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
