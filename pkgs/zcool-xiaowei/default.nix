{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zcool-xiaowei-${version}";
  version = "2018-12-05-144115";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6b3a800449a2cd69ad2f978bdf003c376b83b87e/ofl/zcoolxiaowei/ZCOOLXiaoWei-Regular.ttf?raw=true";
      name = "ZCOOLXiaoWei-Regular.ttf";
      sha256 = "a42b620140f493db42f741351dfbf343c0936d58588ee8004b8b2a218d997ff1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZCOOLXiaoWei-Regular.ttf $out/share/fonts/truetype/ZCOOLXiaoWei-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "ZCOOL XiaoWei";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
