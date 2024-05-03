{
  inputs = {
    top-level = {
      url = "github:auxolotl/top-level";
      inputs.javascript.follows = "";
    };
  };

  outputs = { self, top-level }: {
    topLevelOut = core: {
      test = top-level.core.nixPackages."x86_64-linux".hello;
    };
  };
}
