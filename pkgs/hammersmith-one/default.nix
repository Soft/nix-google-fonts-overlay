{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hammersmith-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/hammersmithone/HammersmithOne-Regular.ttf?raw=true";
      name = "HammersmithOne-Regular.ttf";
      sha256 = "5c8da79fd5bd09fc38c391c4026f0bd4032d2f88f14c523b265a21c96c2cec64";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HammersmithOne-Regular.ttf $out/share/fonts/truetype/HammersmithOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hammersmith One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
