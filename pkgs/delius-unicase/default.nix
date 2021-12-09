{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "delius-unicase-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/deliusunicase/DeliusUnicase-Regular.ttf?raw=true";
      name = "DeliusUnicase-Regular.ttf";
      sha256 = "26fb53b7297281e4907dfe254cc23c206f28510f683eb726e5c5024ca36dc95d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/deliusunicase/DeliusUnicase-Bold.ttf?raw=true";
      name = "DeliusUnicase-Bold.ttf";
      sha256 = "2fc8f72a7257d837a5b710a8f6ca9e6b7a179f809243eef9380ba2185b8c2a67";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DeliusUnicase-Regular.ttf $out/share/fonts/truetype/DeliusUnicase-Regular.ttf
     install -Dm644 DeliusUnicase-Bold.ttf $out/share/fonts/truetype/DeliusUnicase-Bold.ttf
  '';

  meta = with lib; {
    description = "Delius Unicase";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
