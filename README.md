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
    ``hostname my-vm \``
    ``--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2204-lts \``
    ``--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \``
    ``--zone ru-central1-a``
    ``--metadata ssh-keys="ubuntu:$(cat ~/.ssh/id_ed25519.pub)"
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