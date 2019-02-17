{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "buenard-${version}";
  version = "2017-08-07-200804";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3ca906e00bc5347a69cd1a83caeb7c57927a16cd/ofl/buenard/Buenard-Regular.ttf?raw=true";
      name = "Buenard-Regular.ttf";
      sha256 = "50bf037d68b08cd9b32b87e5f5b51ec490f196ff9b25b9cfb6733d24edd68577";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3ca906e00bc5347a69cd1a83caeb7c57927a16cd/ofl/buenard/Buenard-Bold.ttf?raw=true";
      name = "Buenard-Bold.ttf";
      sha256 = "c71bf08fe62d56f74bfd6b35c4558f57684735ec6b9cffc6f6b40ccf9b0691f0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Buenard-Regular.ttf $out/share/fonts/truetype/Buenard-Regular.ttf
     install -Dm644 Buenard-Bold.ttf $out/share/fonts/truetype/Buenard-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Buenard";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
