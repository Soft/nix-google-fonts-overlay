{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "open-sans-condensed-${version}";
  version = "2017-05-08-224436";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/44438ae7881dcac63ca93f7585c9f89c5a1d8d48/apache/opensanscondensed/OpenSansCondensed-Light.ttf?raw=true";
      name = "OpenSansCondensed-Light.ttf";
      sha256 = "8ae2a4d772519a12130bd844dab9916a575ac5ef8e371a643d6f67e15c7f8566";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/44438ae7881dcac63ca93f7585c9f89c5a1d8d48/apache/opensanscondensed/OpenSansCondensed-LightItalic.ttf?raw=true";
      name = "OpenSansCondensed-LightItalic.ttf";
      sha256 = "aceec8387bad177ceb240bf628efe32c9b61f3c971d86a3cf00e4199142b81de";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/44438ae7881dcac63ca93f7585c9f89c5a1d8d48/apache/opensanscondensed/OpenSansCondensed-Bold.ttf?raw=true";
      name = "OpenSansCondensed-Bold.ttf";
      sha256 = "0c6bc4fecd8b88179d09508a12de72fa51d9a0b9842077c29c37ab586e7b6668";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OpenSansCondensed-Light.ttf $out/share/fonts/truetype/OpenSansCondensed-Light.ttf
     install -Dm644 OpenSansCondensed-LightItalic.ttf $out/share/fonts/truetype/OpenSansCondensed-LightItalic.ttf
     install -Dm644 OpenSansCondensed-Bold.ttf $out/share/fonts/truetype/OpenSansCondensed-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Open Sans Condensed";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
