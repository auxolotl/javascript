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
          test = nixPackages.hello;
        }
      );
    };
}
