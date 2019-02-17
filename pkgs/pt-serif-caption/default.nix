{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pt-serif-caption-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptserifcaption/PT_Serif-Caption-Web-Regular.ttf?raw=true";
      name = "PT_Serif-Caption-Web-Regular.ttf";
      sha256 = "d17d47f44e840eee017f839b27dff3c94c7afe7743eff308d4bd11f7018b69af";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptserifcaption/PT_Serif-Caption-Web-Italic.ttf?raw=true";
      name = "PT_Serif-Caption-Web-Italic.ttf";
      sha256 = "afe69233498676c418383b9defda8aace407eca0e86f4499d9ba4e9f494f9da5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PT_Serif-Caption-Web-Regular.ttf $out/share/fonts/truetype/PT_Serif-Caption-Web-Regular.ttf
     install -Dm644 PT_Serif-Caption-Web-Italic.ttf $out/share/fonts/truetype/PT_Serif-Caption-Web-Italic.ttf
  '';

  meta = with stdenv.lib; {
    description = "PT Serif Caption";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
