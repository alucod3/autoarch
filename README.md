# 🛠️ Arch Dev Setup

Script Bash para configurar rapidamente um ambiente de desenvolvimento no Arch Linux.

---

## 🚀 O que este script faz?

Este script automatiza a instalação e configuração de um ambiente de desenvolvimento com foco em produtividade e personalização. Ele inclui:

### ✅ Instalações básicas (comuns a todo dev)
- `git`, `curl`, `zsh`, `oh-my-zsh`
- `alacritty` (terminal), `vim` e `neovim` (editors)
- `lazyvim` (configuração moderna para neovim)
- Nerd Fonts: JetBrainsMono e ShantellSans (Shanns)
- `yay` (AUR helper)

---

## 🧑‍💻 Perfis de desenvolvedor suportados

Após a instalação base, o script pergunta quais ambientes adicionais você deseja configurar:

| Opção | Stack                          | Ferramentas incluídas                                 |
|-------|--------------------------------|--------------------------------------------------------|
| 1     | Dev Web                        | Node.js, pnpm, eslint, prettier                        |
| 2     | Dev Java                       | SDKMAN, Java, Maven, Gradle                            |
| 3     | Dev Go                         | Go toolchain                                           |
| 4     | Dev Python                     | pyenv, pipx, virtualenv                                |
| 5     | Dev Rust                       | rustup, cargo tools                                    |
| 6     | Dev C/C++                      | gcc, clang, cmake, gdb                                 |
| 7     | DevOps / SRE                   | Docker, Podman, Ansible, Kubernetes tools              |
| 8     | Data Science / IA              | Python libs: numpy, pandas, matplotlib, jupyter etc.   |

Você pode selecionar múltiplas opções!

---

## ⚙️ Como usar

### 1. Clone este repositório:

```bash
git clone https://github.com/alucod3/autoarch.git
cd autoarch
````

### 2. Torne o script executável:

```bash
chmod +x arch.sh
```

### 3. Execute o script como root (usando `sudo`):

```bash
sudo ./arch.sh
```

> 📌 O script usa o `SUDO_USER` para instalar partes com permissões de usuário comum, como o `yay`.

---

## 📁 Estrutura do Projeto

```text
├── arch.sh        # Script principal de instalação
├── README.md           # Este arquivo
```

---

## 🔒 Segurança

* O script **não envia dados para lugar nenhum**.
* Nenhum arquivo sensível é versionado.
* Certifique-se de revisar os pacotes antes de rodar em produção.

---

## 🧠 Recursos para aprendizado

* [Arch Wiki](https://wiki.archlinux.org/)
* [Oh My Zsh](https://ohmyz.sh/)
* [LazyVim](https://www.lazyvim.org/)
* [Nerd Fonts](https://www.nerdfonts.com/)
* [SDKMAN!](https://sdkman.io/)
* [yay (AUR Helper)](https://github.com/Jguer/yay)

---

## 🧪 Sugestões e melhorias

Sinta-se livre para abrir **issues** ou enviar **pull requests** com melhorias, novas stacks ou otimizações do script.

---

## 📜 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
