{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cardo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/cardo/Cardo-Regular.ttf?raw=true";
      name = "Cardo-Regular.ttf";
      sha256 = "bcb81f376f1c3892c7026dabf2beafbd1a7ee8ae95d132ee7d4ff7d7c3988261";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d70318ab838626a3f9c4603df3ea0ed959a15442/ofl/cardo/Cardo-Italic.ttf?raw=true";
      name = "Cardo-Italic.ttf";
      sha256 = "52c51cfde3a827dd9428511c4a968699952b8a917c5f0e97be782cbfa1880f9c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/cardo/Cardo-Bold.ttf?raw=true";
      name = "Cardo-Bold.ttf";
      sha256 = "6c9383b1471936ee83b08b67bf79f0ed92bee3d5e8363ec3ba21309d5a272e36";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cardo-Regular.ttf $out/share/fonts/truetype/Cardo-Regular.ttf
     install -Dm644 Cardo-Italic.ttf $out/share/fonts/truetype/Cardo-Italic.ttf
     install -Dm644 Cardo-Bold.ttf $out/share/fonts/truetype/Cardo-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cardo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
