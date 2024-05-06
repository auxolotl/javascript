{
  inputs = {
    core.url = "github:auxolotl/core";
  };

  outputs =
    { self, core }:
    let
      forAllSystems =
        function:
        core.lib.genAttrs core.lib.systems.flakeExposed (
          system:
          function {
            nixPackages = core.nixPackages.${system};
            # auxPackages = core.auxPackages.${system};
          }
        );
    in
    {
      packages = forAllSystems (
        { nixPackages, ... }:
        {
          nodejs = import ./runtimes/nodejs/packages.nix {
            inherit (core.lib) packagesFromDirectoryRecursive;
            inherit (nixPackages) callPackage;
          };
        }
      );
    };
}
