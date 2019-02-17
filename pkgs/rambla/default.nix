{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rambla-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rambla/Rambla-Regular.ttf?raw=true";
      name = "Rambla-Regular.ttf";
      sha256 = "50b69b938921d41a868e8cfbcc71a411e04caf14edad6a153222fc03d316ed97";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rambla/Rambla-Italic.ttf?raw=true";
      name = "Rambla-Italic.ttf";
      sha256 = "359e2cc8e935ab9bbd17734c774ca086b8dc7a30f39cb5440429d298a44390a6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rambla/Rambla-Bold.ttf?raw=true";
      name = "Rambla-Bold.ttf";
      sha256 = "0e5af09d5cf4c7f04a95ae034fed45b8d37dc5a7f3f5492961bb4ecb3a2aa359";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rambla/Rambla-BoldItalic.ttf?raw=true";
      name = "Rambla-BoldItalic.ttf";
      sha256 = "6cd51a19872e3736c92e0d0dd48fbef314df200b5b169b7d57b9ffdcc46f92a3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rambla-Regular.ttf $out/share/fonts/truetype/Rambla-Regular.ttf
     install -Dm644 Rambla-Italic.ttf $out/share/fonts/truetype/Rambla-Italic.ttf
     install -Dm644 Rambla-Bold.ttf $out/share/fonts/truetype/Rambla-Bold.ttf
     install -Dm644 Rambla-BoldItalic.ttf $out/share/fonts/truetype/Rambla-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rambla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
