{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "halant-${version}";
  version = "2017-05-16-005212";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1e0cfec75a5c902d4beb0b2af07a398f6b4383d6/ofl/halant/Halant-Light.ttf?raw=true";
      name = "Halant-Light.ttf";
      sha256 = "9a802f6ec93f2db8d1482df9612d83960592a9fe92ccb813c242aa8a72601434";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1e0cfec75a5c902d4beb0b2af07a398f6b4383d6/ofl/halant/Halant-Regular.ttf?raw=true";
      name = "Halant-Regular.ttf";
      sha256 = "f646ffa1cdf2d4ab36326943d3494c98416264f4df40f8e7bf86211de571df07";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1e0cfec75a5c902d4beb0b2af07a398f6b4383d6/ofl/halant/Halant-Medium.ttf?raw=true";
      name = "Halant-Medium.ttf";
      sha256 = "1a9bec7ff2433d3af45afff681fb6c3c679e77ab44dbb4db2cbb9cb55e9b7a23";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d774fc0799fdeddbd8720616a6d2d791be29fafa/ofl/halant/Halant-SemiBold.ttf?raw=true";
      name = "Halant-SemiBold.ttf";
      sha256 = "1ef45ef6113e69e98eddd809a4eefc18f6005743ce7718ef6fd691db43029b82";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1e0cfec75a5c902d4beb0b2af07a398f6b4383d6/ofl/halant/Halant-Bold.ttf?raw=true";
      name = "Halant-Bold.ttf";
      sha256 = "ee33e5ad2f8b8ff03ef91b286ea3bf93583cc162b614790e2ddcfd5772939daf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Halant-Light.ttf $out/share/fonts/truetype/Halant-Light.ttf
     install -Dm644 Halant-Regular.ttf $out/share/fonts/truetype/Halant-Regular.ttf
     install -Dm644 Halant-Medium.ttf $out/share/fonts/truetype/Halant-Medium.ttf
     install -Dm644 Halant-SemiBold.ttf $out/share/fonts/truetype/Halant-SemiBold.ttf
     install -Dm644 Halant-Bold.ttf $out/share/fonts/truetype/Halant-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Halant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
