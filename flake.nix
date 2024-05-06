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
          nodejs = rec {
            v18 = nixPackages.callPackage ./runtimes/nodejs/versions/v18.nix { };
            v20 = nixPackages.callPackage ./runtimes/nodejs/versions/v20.nix { };
            v22 = nixPackages.callPackage ./runtimes/nodejs/versions/v22.nix { };

            lts = v20;
            latest = v22;
          };
        }
      );
    };
}
