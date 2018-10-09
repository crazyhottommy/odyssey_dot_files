# .bash_profile at mtang odyssey
# v 1.1 | 10-18  originally got from Samir Amin
#
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# The default umask is now handled by pam_umask.
# See pam_umask(8) and /etc/login.defs.

umask 0027

mypathmunge () {
    case ":${PATH}:" in
        *:"$1":*)
            ;;
        *)
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}

if [ -d $HOME/.profile.d ]; then
  for i in $HOME/.profile.d/*.sh; do
    if [ -r $i ]; then
          if [ "${-#*i}" != "$-" ]; then
            . "$i" >/dev/null 2>&1
        else
            . "$i" >/dev/null 2>&1
        fi
    fi
  done
  unset i
fi

unset -f mypathmunge

## User specific environment and startup programs ##
# Use ~/.profile.d/*.sh for loading user specific environment and path variables.

# PATH=$PATH:$HOME/bin
# export PATH

##

#END

