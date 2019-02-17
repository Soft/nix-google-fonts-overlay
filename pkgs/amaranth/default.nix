{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amaranth-${version}";
  version = "2017-08-07-212308";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0fb6f7c619311b48044180e3080131b0f773d1e/ofl/amaranth/Amaranth-Regular.ttf?raw=true";
      name = "Amaranth-Regular.ttf";
      sha256 = "49d60587db044af5158afe373bfa6204d8dcce647ccd4f1f1c61f560980554ec";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0fb6f7c619311b48044180e3080131b0f773d1e/ofl/amaranth/Amaranth-Italic.ttf?raw=true";
      name = "Amaranth-Italic.ttf";
      sha256 = "6c96bda248c8ed3ebda63382cfcc233a26213d87d457a5224b79a0452aff27ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0fb6f7c619311b48044180e3080131b0f773d1e/ofl/amaranth/Amaranth-Bold.ttf?raw=true";
      name = "Amaranth-Bold.ttf";
      sha256 = "2ca9f93499ad3af5679afe2930170fd00c50c2fdaf0240c7de976e23be5791dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0fb6f7c619311b48044180e3080131b0f773d1e/ofl/amaranth/Amaranth-BoldItalic.ttf?raw=true";
      name = "Amaranth-BoldItalic.ttf";
      sha256 = "e8fc151453806c6aaed72a40bacaf3fcf380ccd5d852de08bd686e55ae70464b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amaranth-Regular.ttf $out/share/fonts/truetype/Amaranth-Regular.ttf
     install -Dm644 Amaranth-Italic.ttf $out/share/fonts/truetype/Amaranth-Italic.ttf
     install -Dm644 Amaranth-Bold.ttf $out/share/fonts/truetype/Amaranth-Bold.ttf
     install -Dm644 Amaranth-BoldItalic.ttf $out/share/fonts/truetype/Amaranth-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Amaranth";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
