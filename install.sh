#!/bin/bash

set -e

echo "---------------------------------------------------------------------------"
echo "🍺 Installing Homebrew if not already installed..."
echo "---------------------------------------------------------------------------"
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  echo "✅ Homebrew is already installed."
fi

echo "---------------------------------------------------------------------------"
echo "🔧 Installing GCC with Homebrew..."
echo "---------------------------------------------------------------------------"
brew install gcc


echo "---------------------------------------------------------------------------"
echo "🔍 Installing ripgrep..."
echo "---------------------------------------------------------------------------"
if command -v brew &> /dev/null; then
  brew install ripgrep
elif command -v apt &> /dev/null; then
  sudo apt install -y ripgrep
elif command -v pacman &> /dev/null; then
  sudo pacman -S ripgrep --noconfirm
elif command -v dnf &> /dev/null; then
  sudo dnf install ripgrep -y
else
  echo "⚠️ Could not detect your package manager to install ripgrep."
fi


echo "---------------------------------------------------------------------------"
echo "🔍 Installing fzf..."
echo "---------------------------------------------------------------------------"
if command -v brew &> /dev/null; then
  brew install fzf
elif command -v apt &> /dev/null; then
  sudo apt install -y fzf 
elif command -v pacman &> /dev/null; then
  sudo pacman -S fzf --noconfirm
elif command -v dnf &> /dev/null; then
  sudo dnf install fzf -y
else
  echo "⚠️ Could not detect your package manager to install ripgrep."
fi

echo "---------------------------------------------------------------------------"
echo "📦 Installing Neovim..."
echo "---------------------------------------------------------------------------"
brew install neovim


echo "---------------------------------------------------------------------------"
echo "📁 Creating Neovim config structure..."
echo "---------------------------------------------------------------------------"
mkdir -p ~/.config/nvim/lua/config
mkdir -p ~/.config/nvim/pack/plugins/start

echo "---------------------------------------------------------------------------"
echo "🌐 Cloning essential Neovim plugins..."
echo "---------------------------------------------------------------------------"
# FZF and integration
git clone --depth 1 https://github.com/junegunn/fzf ~/.config/nvim/pack/plugins/start/fzf
git clone --depth 1 https://github.com/junegunn/fzf.vim ~/.config/nvim/pack/plugins/start/fzf.vim

# LSP + completion
echo "---------------------------------------------------------------------------"
echo "Cloning LSP Neovim plugins..."
echo "---------------------------------------------------------------------------"
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/plugins/start/nvim-lspconfig
git clone https://github.com/hrsh7th/nvim-cmp ~/.config/nvim/pack/plugins/start/nvim-cmp
git clone https://github.com/hrsh7th/cmp-nvim-lsp ~/.config/nvim/pack/plugins/start/cmp-nvim-lsp
git clone https://github.com/hrsh7th/cmp-buffer ~/.config/nvim/pack/plugins/start/cmp-buffer
git clone https://github.com/hrsh7th/cmp-path ~/.config/nvim/pack/plugins/start/cmp-path
git clone https://github.com/hrsh7th/cmp-cmdline ~/.config/nvim/pack/plugins/start/cmp-cmdline
git clone https://github.com/saadparwaiz1/cmp_luasnip ~/.config/nvim/pack/plugins/start/cmp_luasnip
git clone https://github.com/L3MON4D3/LuaSnip ~/.config/nvim/pack/plugins/start/LuaSnip

# Signature help
echo "---------------------------------------------------------------------------"
echo "Cloning lsp_signature..."
echo "---------------------------------------------------------------------------"
git clone https://github.com/ray-x/lsp_signature.nvim ~/.config/nvim/pack/plugins/start/lsp_signature.nvim

# Treesitter
echo "---------------------------------------------------------------------------"
echo "Cloning Treesitter..."
echo "---------------------------------------------------------------------------"
git clone https://github.com/nvim-treesitter/nvim-treesitter ~/.config/nvim/pack/plugins/start/nvim-treesitter

# Colorscheme
echo "---------------------------------------------------------------------------"
echo "Installing Tokyonight Colorscheme..."
echo "---------------------------------------------------------------------------"
git clone https://github.com/folke/tokyonight.nvim ~/.config/nvim/pack/plugins/start/tokyonight.nvim

# LuaLine
echo "---------------------------------------------------------------------------"
echo "Installing LuaLine..."
echo "---------------------------------------------------------------------------"
git clone https://github.com/nvim-lualine/lualine.nvim ~/.config/nvim/pack/plugins/start/lualine.nvim

echo "---------------------------------------------------------------------------"
echo "Installing WebDev Icons..."
echo "---------------------------------------------------------------------------"
git clone https://github.com/nvim-tree/nvim-web-devicons ~/.config/nvim/pack/plugins/start/nvim-web-devicons

echo "---------------------------------------------------------------------------"
echo "Installing Treesitter Context..."
echo "---------------------------------------------------------------------------"
git clone https://github.com/nvim-treesitter/nvim-treesitter-context ~/.config/nvim/pack/plugins/start/nvim-treesitter-context

echo "---------------------------------------------------------------------------"
echo "Installing Nvim TS Autotag..."
echo "---------------------------------------------------------------------------"
git clone https://github.com/windwp/nvim-ts-autotag ~/.config/nvim/pack/plugins/start/nvim-ts-autotag

echo "---------------------------------------------------------------------------"
echo "Installing Emmet-nvim"
echo "---------------------------------------------------------------------------"
git clone https://github.com/mattn/emmet-vim ~/.config/nvim/pack/plugins/start/emmet-vim

echo "---------------------------------------------------------------------------"

echo "Installing Lua Language Server"
echo "---------------------------------------------------------------------------"
brew install lua-language-server

echo "---------------------------------------------------------------------------"
echo "🧠 Installing LSP's from Node(npm) (Node.js required)..."
echo "---------------------------------------------------------------------------"
npm install -g typescript typescript-language-server @tailwindcss/language-server

echo "---------------------------------------------------------------------------"
echo "🧠 Creating ripgreprc to ignore node_modules and .git ..."
echo "---------------------------------------------------------------------------"
cat <<EOF > ~/.ripgreprc
--hidden
--glob=!.git/*
--glob=!node_modules/*
--glob=!dist/*
--smart-case
--color=always
EOF

echo "✅ Created ~/.ripgreprc with exclusions for .git/, node_modules/, and dist/"

echo "---------------------------------------------------------------------------"
echo "👉Thanks for using Easy Nvim! 
echo "---------------------------------------------------------------------------"

echo ""
cat <<'EOF'
$$$$$$$$\                                   $$\ 
$$  _____|                                  $$ |
$$ |      $$$$$$$\  $$\  $$$$$$\  $$\   $$\ $$ |
$$$$$\    $$  __$$\ \__|$$  __$$\ $$ |  $$ |$$ |
$$  __|   $$ |  $$ |$$\ $$ /  $$ |$$ |  $$ |\__|
$$ |      $$ |  $$ |$$ |$$ |  $$ |$$ |  $$ |    
$$$$$$$$\ $$ |  $$ |$$ |\$$$$$$  |\$$$$$$$ |$$\ 
\________|\__|  \__|$$ | \______/  \____$$ |\__|
              $$\   $$ |          $$\   $$ |    
              \$$$$$$  |          \$$$$$$  |    
               \______/            \______/     
EOF

echo ""
echo "✅ All setup complete. Go build something amazing! 🚀"
echo "---------------------------------------------------------------------------"
