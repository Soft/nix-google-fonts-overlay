{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montserrat-subrayada-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/montserratsubrayada/MontserratSubrayada-Regular.ttf?raw=true";
      name = "MontserratSubrayada-Regular.ttf";
      sha256 = "37a5e64e0c0fbb4148c37f731c52c63c1efc71f36564a27570d5222e5995a5f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/montserratsubrayada/MontserratSubrayada-Bold.ttf?raw=true";
      name = "MontserratSubrayada-Bold.ttf";
      sha256 = "e2f82ad20176aabece01751b84f5a857b46a6cc4cab917830fd1cb6e141ff7b3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MontserratSubrayada-Regular.ttf $out/share/fonts/truetype/MontserratSubrayada-Regular.ttf
     install -Dm644 MontserratSubrayada-Bold.ttf $out/share/fonts/truetype/MontserratSubrayada-Bold.ttf
  '';

  meta = with lib; {
    description = "Montserrat Subrayada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
