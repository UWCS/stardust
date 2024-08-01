{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      perSystem =
        { pkgs, lib, ... }: rec {
          
          packages.default = pkgs.rustPlatform.buildRustPackage rec {
            pname = "zola";
            version = "1.0.0";

            src = pkgs.fetchFromGitHub {
              owner = "ericthelemur";
              repo = pname;
              rev = "453b92af84ca653125423f8c0e4405842e140ca1";
              hash = "sha256-5RlfNwuCbon63SygVmMKqvmStTGQnsAouxE5IjZMejw=";
            };

            cargoLock = {
              lockFile = "${src}/Cargo.lock";
              allowBuiltinFetchGit = true;
            };
          };

          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [ packages.default ];
          };
        };
    };
}
