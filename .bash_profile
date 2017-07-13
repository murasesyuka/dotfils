if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

source ~/.profile

# OPAM configuration
. /home/alice/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

