{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "antonio-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/antonio/Antonio-Light.ttf?raw=true";
      name = "Antonio-Light.ttf";
      sha256 = "92d5b44496c33b8354b7a2334a3a8d31fd0eab7212afd9bb35efea618be03d7c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/antonio/Antonio-Regular.ttf?raw=true";
      name = "Antonio-Regular.ttf";
      sha256 = "27f419ff2c909c2fab6a54e215d87e3a501d2b897c109707b360e309ebee8b62";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/antonio/Antonio-Bold.ttf?raw=true";
      name = "Antonio-Bold.ttf";
      sha256 = "6baef1da279bd96f1b4656ac4401fa57935a10bb1c4e3674cc199e14f93ee6f6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Antonio-Light.ttf $out/share/fonts/truetype/Antonio-Light.ttf
     install -Dm644 Antonio-Regular.ttf $out/share/fonts/truetype/Antonio-Regular.ttf
     install -Dm644 Antonio-Bold.ttf $out/share/fonts/truetype/Antonio-Bold.ttf
  '';

  meta = with lib; {
    description = "Antonio";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
