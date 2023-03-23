
# Consequently, there should be only critical commands environment in this file.

umask 022

# Set $PATH.
if [[ -f ~/.zpath ]]; then
  source ~/.zpath
fi

# Editor
if which vim &> /dev/null; then
  export EDITOR="vim"
elif which vi &> /dev/null; then
  export EDITOR="vi"
fi
export VISUAL=$EDITOR

# Pager.
export PAGER="less -S"

# Version control software.
export CVS_RSH="ssh"
export CVSEDITOR="vim"
export RSYNC_RSH="ssh"

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# OS-specific environment.
case $OSTYPE in
  darwin*)
    # Ignore reading of /etc/profile, which messes with $PATH. We re-enable
    # reading other system-wide zsh files in ~/.zprofile. See
    # http://www.zsh.org/mla/users/2015/msg00725.html for details.
    setopt no_global_rcs
    # Opt out of Homebrew analytics.
    export HOMEBREW_NO_ANALYTICS=1
    # On OSX, we install zplug via Homebrew.
    export ZPLUG_HOME=/usr/local/opt/zplug
    ;;
esac

# Source local environment.
if [[ -f ~/.zshenv.local ]]; then
  source ~/.zshenv.local
fi
#Go development
export GOPATH="${HOME}/.go"
# export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
#Android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$PATH:/usr/local/lib/python3.7/site-packages"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v11)
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export VERTX_CONFIG_PATH="config-local.yaml"
#export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
#export PATH="/usr/local/opt/ruby@2.4/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/ruby@2.4/lib"
#export CPPFLAGS="-I/usr/local/opt/ruby@2.4/include"
#export PKG_CONFIG_PATH="/usr/local/opt/ruby@2.4/lib/pkgconfig"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/usr/local/opt/libpq/bin:$PATH"
# vim: ft=zsh
