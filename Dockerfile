FROM ubuntu:20.04
WORKDIR /root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    git\
    neovim\
    nodejs
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY . .config/nvim

CMD ["bash"]
