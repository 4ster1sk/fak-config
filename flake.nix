{
  description = "fak";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    naersk.url = "github:nix-community/naersk";
    parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";
    nickel.url = "github:tweag/nickel/1.4.1";
  };

  outputs = inputs:
    inputs.parts.lib.mkFlake { inherit inputs; } {
      imports = [inputs.devshell.flakeModule];
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
      perSystem = { config, pkgs, system, ... }: let 
        naersk = pkgs.callPackage inputs.naersk {};
        wchisp = naersk.buildPackage rec {
          pname = "wchisp";
          version = "0.3-git";
          src = pkgs.fetchFromGitHub {
            owner = "ch32-rs";
            repo = pname;
            rev = "4b4787243ef9bc87cbbb0d95c7482b4f7c9838f1";
            hash = "sha256-Ju2DBv3R4O48o8Fk/AFXOBIsvGMK9hJ8Ogxk47f7gcU=";
          };
        };
        nickel = inputs.nickel.packages.${system}.default;
        commands = [];
        contents = with pkgs; [
          sdcc
          nickel
          topiary
          meson
          ninja
          python311
          # meson checks for C compilers to work. It doesn't count SDCC.
          # Even though we don't use it, here we add gcc just to satisfy meson.
          gcc
        ];
      in {
        packages.container = pkgs.dockerTools.buildImage {
          name = "fak-devenv";
          tag = "latest";
          inherit contents;
        };
        devshells.default = { inherit commands; devshell = { packages = contents; }; };
        devshells.full = { inherit commands; devshell = { packages = contents ++ [wchisp]; }; };
      };
    };
}
