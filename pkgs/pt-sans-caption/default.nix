{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pt-sans-caption-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptsanscaption/PT_Sans-Caption-Web-Regular.ttf?raw=true";
      name = "PT_Sans-Caption-Web-Regular.ttf";
      sha256 = "91d763dd9e8284938be814b76919b0bd97510ec342434e7ec7a56f9fc58b36c4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ptsanscaption/PT_Sans-Caption-Web-Bold.ttf?raw=true";
      name = "PT_Sans-Caption-Web-Bold.ttf";
      sha256 = "f49309c204cc6282831b545d68fb8c58c5e9889e93dd2fc45fc5fbdde1648bd5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PT_Sans-Caption-Web-Regular.ttf $out/share/fonts/truetype/PT_Sans-Caption-Web-Regular.ttf
     install -Dm644 PT_Sans-Caption-Web-Bold.ttf $out/share/fonts/truetype/PT_Sans-Caption-Web-Bold.ttf
  '';

  meta = with lib; {
    description = "PT Sans Caption";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
