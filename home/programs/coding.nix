{ pkgs, pkgsUnstable, ... }: {
  home.packages = with pkgs; [
    # IDEs and Editors
    jetbrains.idea-community
    vscodium-fhs

    # C/C++
    clang-tools
    gcc
    gdb
    meson
    ninja

    # Rust
    rustup

    # Python
    python3 # doesn't handle python packages
    nodePackages.pyright
    pkgsUnstable.ruff

    # Java
    temurin-bin-18
    jdt-language-server

    # Lua
    lua-language-server
    stylua

    # Shell
    nodePackages.bash-language-server
    shellcheck

    # Nix
    nixpkgs-fmt
    nil

    # JS/TS
    nodejs
    nodePackages.typescript-language-server
    nodePackages.typescript
    nodePackages.eslint
    pkgsUnstable.prettierd

    # Zig
    zig
  ];
}
