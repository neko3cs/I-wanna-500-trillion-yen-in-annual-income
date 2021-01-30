FROM alpine:latest AS i-wanna-5000-trillion-yen-devenv
LABEL maintainer="neko3cs (https://github.com/neko3cs)"

WORKDIR /root

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    zsh \
    git \
    curl \
    vim \
    chromium \
    python3 \
    py3-pip && \
    curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/.zshrc > $HOME/.zshrc && \
    mkdir .zsh/ && \
    mkdir .zsh/zsh-completions/ && \
    git clone git://github.com/zsh-users/zsh-completions.git $HOME/.zsh/zsh-completions/ && \
    echo -e '\n#zsh-completions\nfpath=($HOME/.zsh/zsh-completions/src $fpath)\n' >> $HOME/.zshrc && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/vim-install.sh)" && \
    curl -fsSL https://raw.githubusercontent.com/neko3cs/.dotfiles/master/.vimrc > $HOME/.vimrc && \
    pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install django

VOLUME [ "/usr/src" ]

WORKDIR /usr/src

EXPOSE 8000
