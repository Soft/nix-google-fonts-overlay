{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rochester-${version}";
  version = "2017-08-07-205040";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a324c37d5817eb9823876e3e3f25bbbd30f7ea75/apache/rochester/Rochester-Regular.ttf?raw=true";
      name = "Rochester-Regular.ttf";
      sha256 = "38657df5e357e841a39995592970ac14ea96a1376f178f0d8e0231fd5d630b2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rochester-Regular.ttf $out/share/fonts/truetype/Rochester-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rochester";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
