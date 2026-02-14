set -o nounset # exit when trying to use undeclared variables

# gpg config file
if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
    echo "Writing gpg-agent.conf file"
    cat > ~/.gnupg/gpg-agent.conf <<EOL
enable-ssh-support
default-cache-ttl 3600
max-cache-ttl 7200
default-cache-ttl-ssh 3600
max-cache-ttl-ssh 7200
EOL

else
    echo "gpg-agent.conf file already done"
fi

# gpg sshcontrol
if [ ! -f ~/.gnupg/sshcontrol ]; then
    echo "Writing sshcontrol file"
    cat > ~/.gnupg/sshcontrol <<EOL
# List of allowed ssh keys.  Only keys present in this file are used
# in the SSH protocol.  The ssh-add tool may add new entries to this
# file to enable them; you may also add them manually.  Comment
# lines, like this one, as well as empty lines are ignored.  Lines do
# have a certain length limit but this is not serious limitation as
# the format of the entries is fixed and checked by gpg-agent. A
# non-comment line starts with optional white spaces, followed by the
# keygrip of the key given as 40 hex digits, optionally followed by a
# caching TTL in seconds, and another optional field for arbitrary
# flags.   Prepend the keygrip with an '!' mark to disable it.

80DDBDDE7AB2DFFEF50A6A4AE33DC5F44C2121B2
EOL

else
    echo "sshcontrol file already done"
fi

# gpg scdaemon
if [ ! -f ~/.gnupg/scdaemon.conf ]; then
    echo "Writing scdaemon file"
    cat > ~/.gnupg/scdaemon.conf <<EOL
disable-ccid
pcsc-shared
pcsc-driver /usr/lib64/libpcsclite.so.1
allow-pinentry-notify
EOL

else
    echo "scdaemon file already done"
fi


# .bashrc.d to load gpg-agent
mkdir -p ~/.bashrc.d
if [ ! -f ~/.bashrc.d/pgp ]; then
    echo "Writing pgp-ssh .bashrc.d file"
    cat > ~/.bashrc.d/pgp <<EOL
export SSH_AUTH_SOCK=\$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# needs a pin for every new shell, this should be done only once at login
#gpg-connect-agent killagent /bye &> /dev/null
#gpg-connect-agent /bye &> /dev/null
EOL

else
    echo "pgp-ssh .bashrc.d file already done"
fi

# .bashrc.d to load gpg-agent
mkdir -p ~/.config/systemd/user
if [ ! -f ~/.config/systemd/user/gpg-ssh.service ]; then
    echo "Writing gpg-ssh.service file"
    cat > ~/.config/systemd/user/gpg-ssh.service <<EOL
[Unit]
Description=Using gpg as an ssh identity
BindsTo=gnome-session.target
[Service]
Type=oneshot
ExecStart=gpg-connect-agent killagent /bye &> /dev/null && gpg-connect-agent /bye &> /dev/null

[Install]
WantedBy=gnome-session.target
EOL

systemctl --user daemon-reload
systemctl --user enable gpg-ssh.service

else
    echo "pgp-ssh ~/.config/systemd/user/gpg-ssh.service already done"
fi
