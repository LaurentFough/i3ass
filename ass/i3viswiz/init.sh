#!/usr/bin/env bash

___printversion(){
  
cat << 'EOB' >&2
i3viswiz - version: 0.038
updated: 2019-01-05 by budRich
EOB
}



___printhelp(){
  
cat << 'EOB' >&2
i3viswiz - Professional window focus for i3wm


SYNOPSIS
--------
i3viswiz --help|-h
i3viswiz --version|-v
i3viswiz [--gap|-g GAPSIZE] DIRECTION
i3viswiz [--focus|-f] --title|-t       [TARGET]
i3viswiz [--focus|-f] --instance|-i    [TARGET]
i3viswiz [--focus|-f] --class|-c       [TARGET]
i3viswiz [--focus|-f] --titleformat|-o [TARGET]
i3viswiz [--focus|-f] --winid|-d       [TARGET]
i3viswiz [--focus|-f] --parent|-p      [TARGET]

OPTIONS
-------

--help|-h  
Show help and exit.


--version|-v  
Show version and exit.

--gap|-g GAPSIZE  
Set GAPSIZE (defaults to 5). GAPSIZE is the
distance in pixels from the current window where
new focus will be searched. 


--focus|-f  
When used in conjunction with: --titleformat,
--title, --class, --instance, --winid or --parent.
The CON_ID of TARGET window will get focused if it
is visible.


--title|-t  
If no TARGET is specified, a list of all tiled
windows will get printed with TITLE as the last
field of each row. 

If TARGET matches the TITLE of a visible window,
that windows CON_ID will get printed to stdout. 

If the --focus flag is set, the found window will
get focus.


--instance|-i  
If no TARGET is specified, a list of all tiled
windows will get printed with INSTANCE as the last
field of each row. 

If TARGET matches the INSTANCE of a visible
window, that windows CON_ID will get printed to
stdout. 

If the --focus flag is set, the found window will
get focus.


--class|-c  
If no TARGET is specified, a list of all tiled
windows will get printed with CLASS as the last
field of each row. 

If TARGET matches the CLASS of a visible window,
that windows CON_ID will get printed to stdout. 

If the --focus flag is set, the found window will
get focus.


--titleformat|-o  
If no TARGET is specified, a list of all tiled
windows will get printed with TITLE_FORMAT as the
last field of each row. 

If TARGET matches the TITLE_FORMAT of a visible
window, that windows CON_ID will get printed to
stdout. 

If the --focus flag is set, the found window will
get focus.


--winid|-d  
If no TARGET is specified, a list of all tiled
windows will get printed with WIN_ID as the last
field of each row. 

If TARGET matches the WIN_ID of a visible window,
that windows CON_ID will get printed to stdout. 

If the --focus flag is set, the found window will
get focus.



--parent|-p  
If no TARGET is specified, a list of all tiled
windows will get printed with PARENT as the last
field of each row. 

If TARGET matches the PARENT of a visible window,
that windows CON_ID will get printed to stdout. 

If the --focus flag is set, the found window will
get focus.

EOB
}


for ___f in "${___dir}/lib"/*; do
  source "$___f"
done

declare -A __o
eval set -- "$(getopt --name "i3viswiz" \
  --options "hvg:fticodp" \
  --longoptions "help,version,gap:,focus,title,instance,class,titleformat,winid,parent," \
  -- "$@"
)"

while true; do
  case "$1" in
    --help       | -h ) __o[help]=1 ;; 
    --version    | -v ) __o[version]=1 ;; 
    --gap        | -g ) __o[gap]="${2:-}" ; shift ;;
    --focus      | -f ) __o[focus]=1 ;; 
    --title      | -t ) __o[title]=1 ;; 
    --instance   | -i ) __o[instance]=1 ;; 
    --class      | -c ) __o[class]=1 ;; 
    --titleformat | -o ) __o[titleformat]=1 ;; 
    --winid      | -d ) __o[winid]=1 ;; 
    --parent     | -p ) __o[parent]=1 ;; 
    -- ) shift ; break ;;
    *  ) break ;;
  esac
  shift
done

if [[ ${__o[help]:-} = 1 ]]; then
  ___printhelp
  exit
elif [[ ${__o[version]:-} = 1 ]]; then
  ___printversion
  exit
fi

[[ ${__lastarg:="${!#:-}"} =~ ^--$|${0}$ ]] \
  && __lastarg="" \
  || true





