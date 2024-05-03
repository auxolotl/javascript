{
  inputs = {
    top-level = {
      url = "github:auxolotl/top-level";
    };
  };

  outputs = { self, top-level }: {
    topLevelOut = core: {
      test = top-level.core.nixPackages."x86_64-linux".hello;
    };
  };
}
