{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-caslon-text-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/librecaslontext/LibreCaslonText-Regular.ttf?raw=true";
      name = "LibreCaslonText-Regular.ttf";
      sha256 = "cfe8f580fbbd70f4c7a2e83f9e567711440efd524048a85ad252a94181cfaea5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/librecaslontext/LibreCaslonText-Italic.ttf?raw=true";
      name = "LibreCaslonText-Italic.ttf";
      sha256 = "cd5f366647e7dcd0ce5ed9f9d452611c642884592e1a7b255b65d776b391cc1c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/librecaslontext/LibreCaslonText-Bold.ttf?raw=true";
      name = "LibreCaslonText-Bold.ttf";
      sha256 = "b8275d6087d550b3bb667c267829d1184f1998cd2e0694e5b3ff3aafc2d0ed48";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreCaslonText-Regular.ttf $out/share/fonts/truetype/LibreCaslonText-Regular.ttf
     install -Dm644 LibreCaslonText-Italic.ttf $out/share/fonts/truetype/LibreCaslonText-Italic.ttf
     install -Dm644 LibreCaslonText-Bold.ttf $out/share/fonts/truetype/LibreCaslonText-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Libre Caslon Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
