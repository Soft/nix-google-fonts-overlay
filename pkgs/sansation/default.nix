{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sansation-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sansation/Sansation-Light.ttf?raw=true";
      name = "Sansation-Light.ttf";
      sha256 = "ef7798f2d0a3435797793ac8b703bd3131e5a5b1ec5ccbd15f397f11a6ce1811";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sansation/Sansation-LightItalic.ttf?raw=true";
      name = "Sansation-LightItalic.ttf";
      sha256 = "96eef3afab26a9a018415da577c71dbceaae48f9f4b2ab26f0f7d412c1dd08d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sansation/Sansation-Regular.ttf?raw=true";
      name = "Sansation-Regular.ttf";
      sha256 = "6d47039ee6665d78b143a1b264abc02017a33ffa52a4e9f6645ce357f92d4f09";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sansation/Sansation-Italic.ttf?raw=true";
      name = "Sansation-Italic.ttf";
      sha256 = "df79f59618325d890aa611ff8742e313b1bcf0a5afc612b4be2f9d870742dc57";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sansation/Sansation-Bold.ttf?raw=true";
      name = "Sansation-Bold.ttf";
      sha256 = "8ec74c9628179ed95d075440ba4d01091f800ca9be045ddc25982bd8bc21afff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sansation/Sansation-BoldItalic.ttf?raw=true";
      name = "Sansation-BoldItalic.ttf";
      sha256 = "428eb2f11e1b12c55505bc5aaf0579e7354391207df474d88f44517df7d48709";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sansation-Light.ttf $out/share/fonts/truetype/Sansation-Light.ttf
     install -Dm644 Sansation-LightItalic.ttf $out/share/fonts/truetype/Sansation-LightItalic.ttf
     install -Dm644 Sansation-Regular.ttf $out/share/fonts/truetype/Sansation-Regular.ttf
     install -Dm644 Sansation-Italic.ttf $out/share/fonts/truetype/Sansation-Italic.ttf
     install -Dm644 Sansation-Bold.ttf $out/share/fonts/truetype/Sansation-Bold.ttf
     install -Dm644 Sansation-BoldItalic.ttf $out/share/fonts/truetype/Sansation-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Sansation";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
