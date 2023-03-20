#!/bin/bash
echo `basename "$0"`

printf "\u1b[32m
███████╗███████╗██████╗ ██╗  ██╗██╗   ██╗██████╗       ██████╗  ██████╗ ██╗  ██╗
╚══███╔╝██╔════╝██╔══██╗██║  ██║╚██╗ ██╔╝██╔══██╗      ██╔══██╗██╔═══██╗╚██╗██╔╝
  ███╔╝ █████╗  ██████╔╝███████║ ╚████╔╝ ██████╔╝█████╗██████╔╝██║   ██║ ╚███╔╝ 
 ███╔╝  ██╔══╝  ██╔═══╝ ██╔══██║  ╚██╔╝  ██╔══██╗╚════╝██╔══██╗██║   ██║ ██╔██╗ 
███████╗███████╗██║     ██║  ██║   ██║   ██║  ██║      ██████╔╝╚██████╔╝██╔╝ ██╗
╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
\033[m\n"

# Move actual logic to another script so that we do not have to rebuild container each time entrypoint.sh is changed
dos2unix $WORKDIR_CONTAINER/on_docker_startup.sh
/bin/bash $WORKDIR_CONTAINER/on_docker_startup.sh

if [ -z "$RUN_IN_TERM" ];
then
    echo 'Container is running.'
else
    echo 'Container is running and can be attached.'
    cd $WORKDIR_CONTAINER
    bash
fi
