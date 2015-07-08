# bashrc for use on OS X and Linux - Vito Sansevero
# mac only: sudo port install bash-completion

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS. (from Debian)
shopt -s checkwinsize


case `uname -s` in

    # FREEBSD
    FreeBSD)
    # Exports 
    . ~/.bash_exports
    # Tab completion
    ;;

    # LINUX
    Linux)
    # Exports 
    . ~/.bash_exports
    . ~/.bash_linux
    # Tab completion
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
    # Prompt
    . ~/.bash_prompt

    ;;

    # SUN OS
    SunOS)
    # Exports 
    . ~/.bash_exports
    # Tab completion
    ;;

    # MAC
    Darwin)
    # Exports 
    . ~/.bash_exports
    # Tab completion
    if [ -f /opt/local/etc/bash_completion ]; then
        . /opt/local/etc/bash_completion
    fi
    # Mac
    . ~/.bash_mac
    #alias serial='screen /dev/tty.usbserial 115200'
    alias serial='screen /dev/tty.NoZAP-PL2303-00001014 115200'
    alias serial_sun='screen /dev/tty.NoZAP-PL2303-00005014 9600'
    ;;
    *)
    ;;
esac

# Aliases
. ~/.bash_alias

# Prompt
. ~/.bash_prompt

if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
fi
