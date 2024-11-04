{
  pkgs,
  lib,
  config,
  ...
}:
let
  utils = import ./utils.nix;
  cfg = config.packages.development;

  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;

  default = [
    pkgs.vim
    pkgs.git
  ];

  cli = lib.optionals cfg.cli (
    [
      pkgs.bat
      pkgs.bottom
      pkgs.btop
      pkgs.curl
      pkgs.dua
      pkgs.eza
      pkgs.fd
      pkgs.pfetch-rs
      pkgs.starship
      pkgs.ripgrep
      pkgs.rsync
      pkgs.thefuck
      pkgs.tokei
      pkgs.vim
      pkgs.neovim
      pkgs.wget
      pkgs.yazi
      pkgs.zellij
      pkgs.zoxide
    ]
    ++ lib.optionals isDarwin [
      pkgs.darwin.trash
    ]
  );

  rust = lib.optionals cfg.rust [ pkgs.bacon ];

  gui = lib.optionals config.packages.gui [
    pkgs.vscodium
    pkgs.cool-retro-term
    pkgs.alacritty
  ];
in
{
  options.packages.development = {
    enable = lib.mkEnableOption "Packages used for developing software";

    cli = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Add packages for navigating the command line and monitoring the system, 
        such as `eza`, `ripgrep`, `tokei` and `btop`.
      '';
    };

    rust = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Rust-related development packages, that should not always belong in project flakes, such as `bacon`.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      fish.enable = lib.mkIf cfg.cli true;
    };

    environment.systemPackages = default ++ cli ++ rust ++ utils.mkPkgs gui;

    homebrew = lib.mkIf pkgs.stdenv.isDarwin {
      casks = utils.mkCasks gui;
    };
  };
}
