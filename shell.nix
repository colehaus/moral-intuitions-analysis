let
  extras =
    import ./nix/extras.nix //
    import ./nix/gitignore.nix { inherit (pkgs) lib; };
  pkgs = extras.pinnedPkgs {
    specFile = ./nix/nixpkgs.json;
    opts = {};
  };
in
(pkgs.python37.withPackages (ps: with ps; [ black flake8 jupyter matplotlib numpy scipy seaborn ])).env

