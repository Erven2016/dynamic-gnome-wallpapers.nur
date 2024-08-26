{
  name,
  format,
  hash,
  version,
  stdenvNoCC,
  fetchzip,
  ...
}:
let
  repo = "dynamic-gnome-wallpapers.nur";

  pname = name;
in

stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchzip {
    url = "https://github.com/Erven2016/dynamic-gnome-wallpapers.nur/archive/refs/tags/${name}-${version}.zip";
    hash = hash;
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    cd "${repo}-${name}-${version}"
    install -D *.xml -t $out/share/gnome-background-properties
    install -D *.${format} -t $out/share/backgrounds/custom
    runHook postInstall
  '';

}
