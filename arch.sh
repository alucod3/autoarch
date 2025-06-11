#!/bin/bash

cat << "EOF"
   ____             _                     _             
  |  _ \  ___   ___| |__   ___  _ __ ___ (_) ___  _ __  
  | | | |/ _ \ / __| '_ \ / _ \| '_ ` _ \| |/ _ \| '_ \ 
  | |_| | (_) | (__| | | | (_) | | | | | | | (_) | | | |
  |____/ \___/ \___|_| |_|\___/|_| |_| |_|_|\___/|_| |_|

     🚀 DevBooster: Setup turbo para desenvolvedores no Arch Linux
EOF

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Por favor, execute como root (use sudo)."
  exit 1
fi

# Atualiza pacotes
echo "📦 Atualizando pacotes..."
pacman -Syu --noconfirm

# Instala pacotes essenciais
echo "🔧 Instalando pacotes essenciais..."
pacman -S --noconfirm \
  git curl zsh alacritty neovim vim unzip wget \
  ttf-jetbrains-mono-nerd \
  noto-fonts noto-fonts-emoji noto-fonts-cjk \
  btop

# Instala yay (AUR helper)
echo "📦 Instalando yay (AUR helper)..."

if ! command -v yay &> /dev/null; then
  pacman -S --noconfirm --needed git base-devel
  cd /opt
  git clone https://aur.archlinux.org/yay.git
  chown -R $SUDO_USER:$SUDO_USER yay
  cd yay
  sudo -u $SUDO_USER makepkg -si --noconfirm
  cd ~
else
  echo "✅ yay já está instalado."
fi

# Instalação do Oh My Zsh
echo "💡 Instalando Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "⚠️ Oh My Zsh já está instalado."
fi

# Define o shell padrão como zsh (perguntar ao final)
chsh -s $(which zsh)

# Instalação do LazyVim (via Neovim config)
echo "📝 Instalando LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "✅ Instalação base concluída."

case "$choice" in
echo ""
echo "🧑‍💻 Deseja instalar ambiente adicional para algum perfil de desenvolvedor?"
echo "Digite os números separados por espaço. Exemplo: 1 3 5"
echo "1) Dev Web (Node.js, pnpm, eslint, prettier)"
echo "2) Dev Java (SDKMAN, JDK, Maven, Gradle)"
echo "3) Dev Go"
echo "4) Dev Python (pyenv, pipx, virtualenv)"
echo "5) Dev Rust (rustup, cargo tools)"
echo "6) Dev C/C++ (gcc, clang, cmake, gdb)"
echo "7) DevOps / SRE (Docker, Podman, Ansible, Kubernetes tools)"
echo "8) Data Science / IA (Python stack: numpy, pandas, jupyter, etc)"
echo "0) Nenhum"
read -p "Escolha: " choices

for choice in $choices; do
  case "$choice" in
    1)
      echo "🌐 Instalando ambiente Web..."
      pacman -S --noconfirm nodejs npm
      npm install -g pnpm eslint prettier
      ;;
    2)
      echo "☕ Instalando ambiente Java..."
      curl -s "https://get.sdkman.io" | bash
      source "$HOME/.sdkman/bin/sdkman-init.sh"
      sdk install java
      sdk install maven
      sdk install gradle
      ;;
    3)
      echo "🐹 Instalando Go..."
      pacman -S --noconfirm go
      ;;
    4)
      echo "🐍 Instalando Python tools..."
      pacman -S --noconfirm python python-pip python-virtualenv
      curl https://pyenv.run | bash
      pip install --user pipx
      ;;
    5)
      echo "🦀 Instalando Rust..."
      curl https://sh.rustup.rs -sSf | sh -s -- -y
      ;;
    6)
      echo "💻 Instalando C/C++ tools..."
      pacman -S --noconfirm gcc clang cmake gdb make
      ;;
    7)
      echo "⚙️ Instalando ferramentas DevOps/SRE..."
      pacman -S --noconfirm docker podman ansible kubectl helm
      ;;
    8)
      echo "📊 Instalando ambiente Data Science/IA..."
      pacman -S --noconfirm python python-pip jupyter-notebook
      pip install numpy pandas matplotlib seaborn scikit-learn
      ;;
    0)
      echo "🔕 Nenhum ambiente extra será instalado."
      ;;
    *)
      echo "❓ Opção inválida: $choice"
      ;;
  esac
done
