{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rosario-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/697f9096d4a96e7647fc3b8f9eefc358f7dcf178/ofl/rosario/Rosario-Regular.ttf?raw=true";
      name = "Rosario-Regular.ttf";
      sha256 = "2425942acb120486febfd72cd9779261ccbfeefa5bdc9f9393b196c79cc6e698";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/697f9096d4a96e7647fc3b8f9eefc358f7dcf178/ofl/rosario/Rosario-Italic.ttf?raw=true";
      name = "Rosario-Italic.ttf";
      sha256 = "85fbc8981febe25cfdea5c558d46a9e1846a5507e90ab08ac9f3376c10492f1a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/697f9096d4a96e7647fc3b8f9eefc358f7dcf178/ofl/rosario/Rosario-Bold.ttf?raw=true";
      name = "Rosario-Bold.ttf";
      sha256 = "00092f385a9b2aba3902847770eb56d831ceec8fb1b221feb9e9e7f26ed6a2c3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/697f9096d4a96e7647fc3b8f9eefc358f7dcf178/ofl/rosario/Rosario-BoldItalic.ttf?raw=true";
      name = "Rosario-BoldItalic.ttf";
      sha256 = "b8ca978e57deb7e097bd385a9d7d4d30f7f51b9d84eeba873280103b00966094";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rosario-Regular.ttf $out/share/fonts/truetype/Rosario-Regular.ttf
     install -Dm644 Rosario-Italic.ttf $out/share/fonts/truetype/Rosario-Italic.ttf
     install -Dm644 Rosario-Bold.ttf $out/share/fonts/truetype/Rosario-Bold.ttf
     install -Dm644 Rosario-BoldItalic.ttf $out/share/fonts/truetype/Rosario-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Rosario";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
