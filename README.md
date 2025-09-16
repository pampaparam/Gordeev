- [Full GIT course](https://youtu.be/O00FTZDxD0o?si=q1U6wC2giKM19oxM)

- [Lecture about DevOps](https://youtube.com/playlist?list=PLLELLTvDgUQ-iwnE9coLhb-ynyZUGzW6q&si=1YMwzEh2zhHRH_p7)

- [Roadmap DevOps by unknown man](https://youtu.be/2FsmJrorp9Q?si=FB-ew2L4uOU33J2R)
## Install Homebrew in MacOs
    ``/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"``

## Change mode
     ``sudo chown -R $(whoami) /opt/homebrew``
     ``echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc``
     ``source ~/.zshrc``
     ``brew doctor``

## Generate ssh-key
      ``ssh-keygen``
### Three times push Enter and Go in GitHub and create NewSSHKey
### In Terminal Do for key ED25519
     ``pbcopy < ~/.ssh/id_ed25519.pub``
### For RSA Key
     ``pbcopy < ~/.ssh/id_rsa.pub``

### If you have repository in Github
    ``git clone git@github.com:username/Repo.git``
    ``git config --list``
    ``git config --global user.name "username"
    ``git config --global user.email "email"
### Open editor Nano
    ``nano ~/.zshrc``
       and add alias
        ``alias c="git add . && git commit -m upd && git push origin main"``
      ``alias s="git status"``
      ``source ~/.zshrc``  Save changes
### Create PAT(personal access token) in GitHub
      ``brew install gh``
      ``gh auth login``

### Go in Obsidian > settings > community plugins > Browse
### in search write "Git" > choose Git by Vinzent > install > Enable
### Push CMD + P > Clone an existing repo
    ``https://username:Token@github.com/username/Repo.git`` 
     
     
- Create virtual machine in web version Yandexcluod (Launch; Terminate)

    - Connect to Virtual Machine in Terminal  ssh -l ubuntu IP dynamic
## Create instance in terminal by yc cli
    ``curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash``
### restart shell
    ``exec -l $SHELL``
### Inicialization
    ``yc init``
    ``yc --version``
    ``config list``
    ``yc help``
# Create instance
    ``yc compute instance create \``
    ``--name my-vm \``
    ``--hostname my-vm \``
    ``--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2204-lts \``
    ``--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \``
    ``--zone ru-central1-a``
    ``--metadata ssh-keys="ubuntu:$(cat ~/.ssh/id_ed25519.pub)"

## View available list OS yandexcloud CLI
     ``yc compute image list --folder-id standard-images --limit 0``
### If you want to see only available image families (main categories), use:
    ``yc compute image list --folder-id standard-images --limit 0 --jq '.[].family' | sort | uniq``
    # example:
         `ubuntu-2204-lts
         ubuntu-2204-lts-oslogin
         ubuntu-2204-lts-vgpu-v13
         centos-8
         windows-server-2019
         ...`
## To show all images from a specific family, use
    ``yc compute image list --folder-id standard-images | grep <идентификатор_семейства>``
    ``yc compute image list --folder-id standard-images | grep ubuntu-2204-lts``



### in catalog web browser yc in "access right" add 5 roles
    `compute.disk.user`
    `compute.editor`
    `compute.images.user`
    `license-manager.viewer`
    `viewer`
### Check VM list
    ``yc compute instance list``
### Get specific information about VM
    ``yc compute instance get <name-vm>``
### Check status
    ``yc compute instance list --format yaml | grep -E "name|status"``
### Get external IP
    ``yc compute instance get <my-vm> --format json | jq``
    `'.network_interfaces[0].primary_v4_address.one_to_one_nat.address'`

### Connect to VM with SSH
    ``ssh ubuntu@<external-ip>``
### Stop-start-delete-reboot machine
    ``yc compute instance stop <my_vm or id_vm>``
    ``yc compute instance start <my_vm or id_vm>``
    ``yc compute instance reboot <my_vm or id_vm>``
### You can display a list of subnets and select the right
    ``yc vpc subnet list``
### Launch ssh-agent
    ``eval "$(ssh-agent -s)"``
### Add private key in agent
    ``ssh-add ~/.ssh/id_ed25519``
### Check it's done
    ``ssh-add -l``
## Mise install CLI "brew"
    ``brew install mise``
### Mise exec and run
    ``mise exec python@3 -- python``
    this will download and install Python if it is not already installed
Python 3.13.2
#>>> ...
### or run node 22:
    ``mise exec node@22 -- node -v``
    # v22.x.x
###### [`mise x|exec`](https://mise.jdx.dev/cli/exec.html) is a powerful way to load the current `mise` context (tools & environment variables) without modifying your shell session or running ad-hoc commands with mise tools set. Installing [`tools`](https://mise.jdx.dev/dev-tools/) is as simple as running [`mise u|use`](https://mise.jdx.dev/cli/use.html)
    ``mise use --global node@22``
    # install node 22 and set it as the global default
    ``mise exec -- node my-scripts.js``
    # run my-scripts.js with node 22...
    # if my-scripts.js can't open, maybe you have to install node.
    # check that you have Node.js
    ``node -v``
    # if you don't have, have to install.
    ``brew install node``
    # Launch node
    ``node``
## Install go
    ``mise use -g go@latest``
## Install ruby
    ``mise use -g ruby@latest``
    # ruby may not install in the end, maybe you have to install missing dependencies
    ``brew install zlib readline libyaml libffi``
    # Check Xcode Command Line Tools
    ``xcode-select --install``
    # Launch installation with detailed diagnostic output
    ``mise install ruby@latest --verbose``
    
# Docker
## Install docker
    ``brew install docker``
    # [or you can install docker from website] (https://www.docker.com/products/docker-desktop/)
### Check version
    ``docker --version``
### Check docker
     ``docker run hello-world``
### Launch new container  on ubuntu image
    ``docker run -it ubuntu bash``
    # you see command `root@<container_id>:/#`
    # you can do
    - ls
    - pwd
    - apt update
    - ...
     # for exit from container
     ``exit`` or `Ctrl + D`
 # How do exit out of container and don't stop him
      `Ctrl + P, after Ctrl + Q`
 # To reconnect to a running container
    ``docker attach <container_id>``
    # OR
    ``docker exec -it <container_id> bash``
## Check if container is running
    ``docker ps``
## View processes runing inside the container
    ``docker top <container_id_or_name>``
## View logs
    ``docker logs <container_id_or_name>``

## Command so that the user can execute Docker commands without using `sudo`
    ``sudo usermod -aG docker $USER``
      
    

    
