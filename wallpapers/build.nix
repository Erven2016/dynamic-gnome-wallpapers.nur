{
  meta,
  stdenvNoCC,
  fetchzip,
  ...
}:
let
  inherit (meta) name format hash;

  repo = "dynamic-gnome-wallpapers.nur";

  pname = name;
  version = "2024.08.00-01";
in

stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchzip {
    url = "https://github.com/Erven2016/dynamic-gnome-wallpapers.nur/archive/refs/tags/${name}.zip";
    hash = hash;
    # stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    cd "${repo}-${name}"
    install -D *.xml -t $out/share/gnome-background-properties
    install -D *.${format} -t $out/share/backgrounds/custom
    runHook postInstall
  '';

}
