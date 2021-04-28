Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder "~/", "/guset/home/dir"
  config.ssh.forward_agent = true
  config.vm.provider :virtualbox do |v|
    v.cpus = 4
    v.memory = 4096
  end

  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y vim tmux yadm git python3 zsh  python-pip make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
    yadm clone -f git@github.com:good5dog5/dotfile

  	# Oh My ZSH Install section
	git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
	chsh -s /bin/zsh vagrant
  SHELL


  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.verbose = "v"
  #   ansible.playbook = "ansible/playbook.yml"
  #   ansible.pip_install_cmd = "sudo apt-get install -y python3-distutils && curl -s https://bootstrap.pypa.io/get-pip.py | sudo python3"
  #   ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/python3" }
  # end
end
