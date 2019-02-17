{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zeyada-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/zeyada/Zeyada.ttf?raw=true";
      name = "Zeyada.ttf";
      sha256 = "09f23d0d78b6e166ddb8480793bb550ab4c2aaf6602eda47a394fee93d2a9667";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Zeyada.ttf $out/share/fonts/truetype/Zeyada.ttf
  '';

  meta = with stdenv.lib; {
    description = "Zeyada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
