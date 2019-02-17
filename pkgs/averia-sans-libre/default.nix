{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "averia-sans-libre-${version}";
  version = "2017-08-07-195725";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f81bc90462b862dbfe3d16403ff284a68473833/ofl/averiasanslibre/AveriaSansLibre-Light.ttf?raw=true";
      name = "AveriaSansLibre-Light.ttf";
      sha256 = "03725f74b84f520d8f27d29d542c31b2213c0e06caff563a43745950e88649c7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f81bc90462b862dbfe3d16403ff284a68473833/ofl/averiasanslibre/AveriaSansLibre-LightItalic.ttf?raw=true";
      name = "AveriaSansLibre-LightItalic.ttf";
      sha256 = "37f7dfdf2e2ab82d73cb86779619a1dfe495823c82425f8982777fa4c12a8c9c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f81bc90462b862dbfe3d16403ff284a68473833/ofl/averiasanslibre/AveriaSansLibre-Regular.ttf?raw=true";
      name = "AveriaSansLibre-Regular.ttf";
      sha256 = "834a9a8ef3a37da0165274d0345836b430e54ef15e6ebf070ae7c5805034efbc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f81bc90462b862dbfe3d16403ff284a68473833/ofl/averiasanslibre/AveriaSansLibre-Italic.ttf?raw=true";
      name = "AveriaSansLibre-Italic.ttf";
      sha256 = "8603d2963618dbb46eed3b46b1c7f70454af7b1d5607a4e6e9c6a00649c23e4f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f81bc90462b862dbfe3d16403ff284a68473833/ofl/averiasanslibre/AveriaSansLibre-Bold.ttf?raw=true";
      name = "AveriaSansLibre-Bold.ttf";
      sha256 = "c54cc938b365fa4442b9de4db603f26596e9ef3d3feba311cf986b6e13107863";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f81bc90462b862dbfe3d16403ff284a68473833/ofl/averiasanslibre/AveriaSansLibre-BoldItalic.ttf?raw=true";
      name = "AveriaSansLibre-BoldItalic.ttf";
      sha256 = "e0fa53165e0e7ccd3651073619762b66110dd0addc368245586c08c02ebc2d60";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AveriaSansLibre-Light.ttf $out/share/fonts/truetype/AveriaSansLibre-Light.ttf
     install -Dm644 AveriaSansLibre-LightItalic.ttf $out/share/fonts/truetype/AveriaSansLibre-LightItalic.ttf
     install -Dm644 AveriaSansLibre-Regular.ttf $out/share/fonts/truetype/AveriaSansLibre-Regular.ttf
     install -Dm644 AveriaSansLibre-Italic.ttf $out/share/fonts/truetype/AveriaSansLibre-Italic.ttf
     install -Dm644 AveriaSansLibre-Bold.ttf $out/share/fonts/truetype/AveriaSansLibre-Bold.ttf
     install -Dm644 AveriaSansLibre-BoldItalic.ttf $out/share/fonts/truetype/AveriaSansLibre-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Averia Sans Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
