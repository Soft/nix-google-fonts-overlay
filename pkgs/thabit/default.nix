{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "thabit-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/thabit/Thabit.ttf?raw=true";
      name = "Thabit.ttf";
      sha256 = "3fe6f423d751919d6411b38d6de2ff823252292eef9e860c4a532faf779b674a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/thabit/Thabit-Oblique.ttf?raw=true";
      name = "Thabit-Oblique.ttf";
      sha256 = "dc8ca2cbcdd9d1925394b2261bb46897752b20a190ce7d108e20b56b465ce686";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/thabit/Thabit-Bold.ttf?raw=true";
      name = "Thabit-Bold.ttf";
      sha256 = "8dded564a1f6dc6a223112b66f20d12a221ad76a7f688dd570cef794940dd124";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/thabit/Thabit-BoldOblique.ttf?raw=true";
      name = "Thabit-BoldOblique.ttf";
      sha256 = "5375ed9d0d5ea6e9e9806bbddd1dc860b1857018d3229d10f944ca39e04318ff";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Thabit.ttf $out/share/fonts/truetype/Thabit.ttf
     install -Dm644 Thabit-Oblique.ttf $out/share/fonts/truetype/Thabit-Oblique.ttf
     install -Dm644 Thabit-Bold.ttf $out/share/fonts/truetype/Thabit-Bold.ttf
     install -Dm644 Thabit-BoldOblique.ttf $out/share/fonts/truetype/Thabit-BoldOblique.ttf
  '';

  meta = with stdenv.lib; {
    description = "Thabit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
