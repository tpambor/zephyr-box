# Zephyr-box

This project strives to make containerized development with Nordic chips,  Zephyr-RTOS and VS Code as smooth as possible.

## Usage

1. Install `Dev Containers` extension.   
   (There should also be a recommendation pop-up window prompting to install recommended extensions)
2. Clone this repository to an empty directory so that there are no siblings.
3. Open it in VSCode.
4. When get prompted to `Reopen in Container`, do so.   
   In case prompt does not come, call `Dev Container: Reopen in container` Action.
5. Wait until setup is complete. Should you see prompts to Reload Window, don't do that just yet.  
   First time it may take a while, because the image is built or downloaded and then setup scripts are run.
6. Reload Window (either through prompt or just close and open it).  
   It's needed for some extensions and to select newly installed python venv for tasks.
7. Enjoy! Or not.

P.S. You can also run bash in Docker by `run_bash_in_docker.sh` script.  
Then you can also attach to running container with VSCode, but you won't have docker extensions and some other configurations.  

P.P.S Please note that if only `setup.sh` is changed, there is no need to rebuild the image!

---

## Troubleshooting

1. If building container does not work:
   - try adding `--network host` to `docker build` command.
   - try adding `--no-cache` to `docker build` command.
   - try running the first time from the shell script instead of VSCode to see the logs clearly without pop-up errors.
2. Depending on your IT infrastructure, you might also need `--network host` for `docker run`.  
3. If you reloaded VSCode before intitial installation was complete, no problem.
   Close VSCode, run `docker ps`, stop running containers and open VSCode again.
4. If image is build succesfully in `run_bash_in_docker.sh`, but you have issues with VSCode,  
   try running `Dev Containers: Rebuild without cache and reopen in contaier` action (not from a container).  
   Also ensure that there are no modification which cause container to exit before VSCode canattach itself.
5. If you have issues with `nrfjprog`/`west flash`, ensure `$LANG` is not set.   
   "terminal.integrated.detectLocale": "off" has to be off, otherwise VSCode sets this ENV.
