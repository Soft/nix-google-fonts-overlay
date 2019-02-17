{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alike-angular-${version}";
  version = "2017-08-07-194133";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/84313974989a3e755cf8c66f28d3c8ec27972f41/ofl/alikeangular/AlikeAngular-Regular.ttf?raw=true";
      name = "AlikeAngular-Regular.ttf";
      sha256 = "0b45870800a897713372ab6eb9ff4c096152807ed623e167c92b2790660f68be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlikeAngular-Regular.ttf $out/share/fonts/truetype/AlikeAngular-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Alike Angular";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
