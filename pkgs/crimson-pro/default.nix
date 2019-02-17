{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "crimson-pro-${version}";
  version = "2019-01-18-145702";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cd20fc29b01583e88a0ee39759f4b191d04db17d/ofl/crimsonpro/CrimsonPro-ExtraLight.ttf?raw=true";
      name = "CrimsonPro-ExtraLight.ttf";
      sha256 = "60cc307c6e0bac96cd2a8a04c1650230df4cb3ea4cfade913c67f0736f103b7d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cd20fc29b01583e88a0ee39759f4b191d04db17d/ofl/crimsonpro/CrimsonPro-ExtraLightItalic.ttf?raw=true";
      name = "CrimsonPro-ExtraLightItalic.ttf";
      sha256 = "2a1dcb6e6484a1115165b853d9c96d84dc1369e93074a2bc572dde3169b7082b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CrimsonPro-ExtraLight.ttf $out/share/fonts/truetype/CrimsonPro-ExtraLight.ttf
     install -Dm644 CrimsonPro-ExtraLightItalic.ttf $out/share/fonts/truetype/CrimsonPro-ExtraLightItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Crimson Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
