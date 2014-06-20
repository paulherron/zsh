typeset -Ag abbreviations

abbreviations=(
	"P"     "pass show paulherron/"
	"pr"     "cd ~/Projects/"
)

globalAbbreviations=(
    #"gc"     "git commit -m"
    #"gl"     "git ls-tree --name-only -r HEAD"
)

magic-abbrev-expand() {
	local left prefix
	prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")

	if [[ -n ${abbreviations[$LBUFFER]} ]]; then
		# In this scenario, only the abbreviation was typed (and nothing else).
		LBUFFER=$abbreviations[$LBUFFER]
	elif [[ -n ${globalAbbreviations[$prefix]} ]]; then
		# This sceanrio takes caters for a global abbreviation, i.e. the abbreviation could appear as part of a larger command.
		left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
		LBUFFER=$left${abbreviations[$prefix]:-$prefix}
	else
		# Otherwise, do nothing except repsecting the space that was typed
		LBUFFER=$LBUFFER" "
	fi
}

no-magic-abbrev-expand() {
    LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey   " "    magic-abbrev-expand
bindkey   "^x "  no-magic-abbrev-expand
