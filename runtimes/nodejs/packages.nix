{ packagesFromDirectoryRecursive, callPackage }:

let
  versions = packagesFromDirectoryRecursive {
    inherit callPackage;
    directory = ./versions;
  };
in
versions
// {
  lts = versions.v20;
  latest = versions.v22;
}
