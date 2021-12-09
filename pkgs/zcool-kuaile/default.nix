{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zcool-kuaile-${version}";
  version = "2018-12-05-143631";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/864474ef086b6bacf0737873ad8ce29c2d0b30f0/ofl/zcoolkuaile/ZCOOLKuaiLe-Regular.ttf?raw=true";
      name = "ZCOOLKuaiLe-Regular.ttf";
      sha256 = "634fdf8945efec10319a3001f670823dc73d69233481072a743a45c96415967b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZCOOLKuaiLe-Regular.ttf $out/share/fonts/truetype/ZCOOLKuaiLe-Regular.ttf
  '';

  meta = with lib; {
    description = "ZCOOL KuaiLe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
