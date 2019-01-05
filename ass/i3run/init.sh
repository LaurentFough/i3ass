#!/usr/bin/env bash

___printversion(){
  
cat << 'EOB' >&2
i3run - version: 0.031
updated: 2019-01-05 by budRich
EOB
}



___printhelp(){
  
cat << 'EOB' >&2
i3run - Run, Raise or hide windows in i3wm


SYNOPSIS
--------
i3run --help|-h
i3run --version|-v
i3run --instance|-i INSTANCE [--summon|-s] [--nohide|-g] [--mouse|-m] [--command|-e COMMAND] [--rename|-x OLD_NAME]
i3run --class|-c CLASS [--summon|-s] [--nohide|-g] [--mouse|-m] [--command|-e COMMAND] [--rename|-x OLD_NAME]
i3run --title|-t  TITLE [--summon|-s] [--nohide|-g] [--mouse|-m] [--command|-e COMMAND] [--rename|-x OLD_NAME]
i3run --conid|-n CON_ID [--summon|-s] [--nohide|-g] [--mouse|-m] [--command|-e COMMAND] [--rename|-x OLD_NAME]

OPTIONS
-------

--help|-h  
Show help and exit.


--version|-v  
Show version and exit.

--instance|-i INSTANCE  
Search for windows with the given INSTANCE


--summon|-s  
Instead of switching workspace, summon window to
current workspace


--nohide|-g  
Don't hide window/container if it's active.


--mouse|-m  
The window will be placed on the location of the
mouse cursor when it is created or shown. (needs
xdotool) 


--command|-e COMMAND  

--rename|-x  
If the search criteria is -i (instance), the
window with instance: OLDNAME will get a n new
instance name matching the criteria when it is
created (needs xdotool).


--class|-c CLASS  
Search for windows with the given CLASS


--title|-t TITLE  
Search for windows with the given TITLE


--conid|-n  
Search for windows with the given CON_ID

EOB
}


for ___f in "${___dir}/lib"/*; do
  source "$___f"
done

declare -A __o
eval set -- "$(getopt --name "i3run" \
  --options "hvi:sgme:xc:t:n" \
  --longoptions "help,version,instance:,summon,nohide,mouse,command:,rename,class:,title:,conid," \
  -- "$@"
)"

while true; do
  case "$1" in
    --help       | -h ) __o[help]=1 ;; 
    --version    | -v ) __o[version]=1 ;; 
    --instance   | -i ) __o[instance]="${2:-}" ; shift ;;
    --summon     | -s ) __o[summon]=1 ;; 
    --nohide     | -g ) __o[nohide]=1 ;; 
    --mouse      | -m ) __o[mouse]=1 ;; 
    --command    | -e ) __o[command]="${2:-}" ; shift ;;
    --rename     | -x ) __o[rename]=1 ;; 
    --class      | -c ) __o[class]="${2:-}" ; shift ;;
    --title      | -t ) __o[title]="${2:-}" ; shift ;;
    --conid      | -n ) __o[conid]=1 ;; 
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





