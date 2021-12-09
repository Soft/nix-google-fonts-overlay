{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "corben-${version}";
  version = "2017-08-29-222013";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5b1755d5a63bd199951e9b9a7a6d16c0d18842ad/ofl/corben/Corben-Regular.ttf?raw=true";
      name = "Corben-Regular.ttf";
      sha256 = "dd2c2697a8f936a43b5f0a2bae1bc82cdaf40f8a5fc1d15c1ecd562b3ea16044";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ee1e172ab43b450c38a2e33a0de51fa69f855278/ofl/corben/Corben-Bold.ttf?raw=true";
      name = "Corben-Bold.ttf";
      sha256 = "1fb5959682b89680467ab628e2f1e6359c6062acbb7edcea14ffcca1124db0f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Corben-Regular.ttf $out/share/fonts/truetype/Corben-Regular.ttf
     install -Dm644 Corben-Bold.ttf $out/share/fonts/truetype/Corben-Bold.ttf
  '';

  meta = with lib; {
    description = "Corben";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
