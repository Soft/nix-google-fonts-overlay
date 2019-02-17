{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jura-${version}";
  version = "2017-05-03-130947";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c91e08c3fc1455cb96aae71463584c512af0d43b/ofl/jura/Jura-Light.ttf?raw=true";
      name = "Jura-Light.ttf";
      sha256 = "1579545eb84e405fa4fd3dc4d50a19c0ccaac3ecd55490fc49c890d74299d19e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c91e08c3fc1455cb96aae71463584c512af0d43b/ofl/jura/Jura-Regular.ttf?raw=true";
      name = "Jura-Regular.ttf";
      sha256 = "bb4e85f1998873039e47c1f209f025d9e5a2ed0b74c28de08c07fae6078a4887";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c91e08c3fc1455cb96aae71463584c512af0d43b/ofl/jura/Jura-Medium.ttf?raw=true";
      name = "Jura-Medium.ttf";
      sha256 = "010f64870cdd7b6d5ad4270c0f5a0054d4c6ece89f5f400321f189819c1296bc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c91e08c3fc1455cb96aae71463584c512af0d43b/ofl/jura/Jura-SemiBold.ttf?raw=true";
      name = "Jura-SemiBold.ttf";
      sha256 = "9b550b1d23e86d4e0f057be5195b65e6a72bbf98626dc08f9ade6ef6fe7955c9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c91e08c3fc1455cb96aae71463584c512af0d43b/ofl/jura/Jura-Bold.ttf?raw=true";
      name = "Jura-Bold.ttf";
      sha256 = "72aecaac33ca19f8b0b647073cef4059475d9e7a06b1f964843165d08f6f7ae8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jura-Light.ttf $out/share/fonts/truetype/Jura-Light.ttf
     install -Dm644 Jura-Regular.ttf $out/share/fonts/truetype/Jura-Regular.ttf
     install -Dm644 Jura-Medium.ttf $out/share/fonts/truetype/Jura-Medium.ttf
     install -Dm644 Jura-SemiBold.ttf $out/share/fonts/truetype/Jura-SemiBold.ttf
     install -Dm644 Jura-Bold.ttf $out/share/fonts/truetype/Jura-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Jura";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
