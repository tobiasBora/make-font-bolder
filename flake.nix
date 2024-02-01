{
  description = "make-font-bolder: a simple script to quickly create various bold variants of a font with various weights";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    {
      overlays.default = final: prev: {
        make-font-bolder = prev.stdenv.mkDerivation rec {
          pname = "make-font-bolder";
          version = "1.0";
          src = ./make-font-bolder;
          unpackPhase = ":";
          buildInputs = [
            (prev.python3.withPackages (ps: with ps; [ fontforge ]))
          ];
          installPhase = ''
            runHook preInstall
            mkdir -p $out/bin
            cp $src $out/bin/${pname}
            runHook postInstall
          '';
        };
      };
    } //
    (flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = import nixpkgs {
              inherit system;
              overlays = [ self.overlays.default ];
            };
        in
          {
            packages.make-font-bolder = pkgs.make-font-bolder;
          }
      ));
}
