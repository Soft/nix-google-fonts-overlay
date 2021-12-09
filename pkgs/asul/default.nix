{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asul-${version}";
  version = "2017-08-07-200109";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a80509f5bf2fda3a77c189350dba606e08705b4/ofl/asul/Asul-Regular.ttf?raw=true";
      name = "Asul-Regular.ttf";
      sha256 = "2bd614af0594c9657cc6f986f602b294d2a903b3a7ce137942a35ac01b6f1f76";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3a80509f5bf2fda3a77c189350dba606e08705b4/ofl/asul/Asul-Bold.ttf?raw=true";
      name = "Asul-Bold.ttf";
      sha256 = "0aea5c8f5f04c9b2f252eb5b3d7f6d2ee80cbef613526ebbc330c592900bbcfe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Asul-Regular.ttf $out/share/fonts/truetype/Asul-Regular.ttf
     install -Dm644 Asul-Bold.ttf $out/share/fonts/truetype/Asul-Bold.ttf
  '';

  meta = with lib; {
    description = "Asul";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
