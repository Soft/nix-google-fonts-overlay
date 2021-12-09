{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "paytone-one-${version}";
  version = "2017-07-26-194451";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c1a228c0dd891c988b5017044f75acf6b2114a16/ofl/paytoneone/PaytoneOne-Regular.ttf?raw=true";
      name = "PaytoneOne-Regular.ttf";
      sha256 = "92e7ad4c492c3542c7a88a5657dde8e68235c00c9592cd91121cb043abad852b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PaytoneOne-Regular.ttf $out/share/fonts/truetype/PaytoneOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Paytone One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
