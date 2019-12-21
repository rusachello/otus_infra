
ssh -tt -A otus@35.210.58.114 ssh otus@10.128.0.2

Host bastion
          Hostname 35.210.58.114
          User otus
          IdentityFile ~/.ssh/id_rsa


Host someinternalhost
        Hostname 10.128.0.2
        User otus
        IdentityFile ~/.ssh/id_rsa
        ProxyCommand  ssh -W %h:%p bastion

bastion_IP = 35.210.58.114
someinternalhost_IP = 10.128.0.2
