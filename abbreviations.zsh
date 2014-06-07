typeset -Ag abbreviations

abbreviations=(
    #"w"      "watch "
    #"lw"     "| wc"
    #"lx"     "| xargs"
    #"ll"     "| less"
    #"lg"     "| grep"
    #"tx"     "tar zxvf"
    #"tc"     "tar zcvf"
    #"gc"     "git commit -m"
    #"gl"     "git ls-tree --name-only -r HEAD"
	"pa"     "pass show paulherron/"
)

magic-abbrev-expand() {
	local left prefix
	prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")

	if [[ -n ${abbreviations[$prefix]} ]]; then
		# As the abbreviation was defined, use it
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
