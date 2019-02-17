{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monda-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/monda/Monda-Regular.ttf?raw=true";
      name = "Monda-Regular.ttf";
      sha256 = "6e50607d72931e350822ddb81171e9560694e4712daa6055cab5876357cf7187";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/monda/Monda-Bold.ttf?raw=true";
      name = "Monda-Bold.ttf";
      sha256 = "ba508510d6c2cb4493dba4c237a0df6de1e61529a7ff5d54b091b8572d16ece9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Monda-Regular.ttf $out/share/fonts/truetype/Monda-Regular.ttf
     install -Dm644 Monda-Bold.ttf $out/share/fonts/truetype/Monda-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Monda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
