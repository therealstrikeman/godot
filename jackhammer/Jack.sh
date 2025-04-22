 #!/bin/sh
AppName=Jack
DirName=$(dirname -- $(readlink -f -- $0))

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DirName
export LD_LIBRARY_PATH
$DirName/$AppName "$@"
