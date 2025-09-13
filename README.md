- [Full GIT course](https://youtu.be/O00FTZDxD0o?si=q1U6wC2giKM19oxM)

- [Lecture about DevOps](https://youtube.com/playlist?list=PLLELLTvDgUQ-iwnE9coLhb-ynyZUGzW6q&si=1YMwzEh2zhHRH_p7)

- [Roadmap DevOps by unknown man](https://youtu.be/2FsmJrorp9Q?si=FB-ew2L4uOU33J2R)
- install Homebrew for MacOS
     #/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  Change mode
     #sudo chown -R $(whoami) /opt/homebrew
     
     #echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
     #source ~/.zshrc
     #brew doctor

    GENERATE SSHKEY
      #ssh-keygen
      Three times push Enter
    Go in GitHub and create NewSSHKey
    In Terminal Do #pbcopy < ~/.ssh/id_ed25519.pub For Key ED25519
    For RSA Key #pbcopy < ~/.ssh/id_rsa.pub

   If you have repository in Github
   #git clone git@github.com:username/Repo.git
   #git config --list
   #git config --global user.name "username"
   #git config --global user.email "email"

  Open editor Nano
  #nano ~/.zshrc  and add alias
      alias c="git add . && git commit -m upd && git push origin main"
      alias s="git status"
      #source ~/.zshrc  Save changes

  Create PAT(personal access token) in GitHub

   #brew install gh
   #gh auth login

  Go in Obsidian > settings > community plugins > Browse
  in search text "Git" > choose Git by Vinzent > install > Enable
  Push CMD + P > Clone an existing repo
  #https://username:Token@github.com/username/Repo.git 
     
     
- Create virtual machine in web version Yandexcluod (Launch; Terminate)

    - Connect to Virtual Machine in Terminal  ssh -l ubuntu IP dynamic
    - 
