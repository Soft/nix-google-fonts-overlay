{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gentium-basic-${version}";
  version = "2016-09-26-145146";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/gentiumbasic/GenBasR.ttf?raw=true";
      name = "GenBasR.ttf";
      sha256 = "f0248c5a6d76dca62c639fdfdde97f9ae60c05c96bec03925d522531d7c0ca37";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/gentiumbasic/GenBasI.ttf?raw=true";
      name = "GenBasI.ttf";
      sha256 = "191de1e709a691f1134775539dee8b2167baef3ee411744b5cdf3b43ce18707a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/gentiumbasic/GenBasB.ttf?raw=true";
      name = "GenBasB.ttf";
      sha256 = "26d5d4044a4bf92f265bf3b597076aa52d0497cb102cbdbfb1131f658ce97c9c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/gentiumbasic/GenBasBI.ttf?raw=true";
      name = "GenBasBI.ttf";
      sha256 = "5bfddd753de0a9ad83940e9b6130a8082510416d7450bb8e39d90e7655a75e35";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GenBasR.ttf $out/share/fonts/truetype/GenBasR.ttf
     install -Dm644 GenBasI.ttf $out/share/fonts/truetype/GenBasI.ttf
     install -Dm644 GenBasB.ttf $out/share/fonts/truetype/GenBasB.ttf
     install -Dm644 GenBasBI.ttf $out/share/fonts/truetype/GenBasBI.ttf
  '';

  meta = with lib; {
    description = "Gentium Basic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
