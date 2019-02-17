{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moul-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/moul/Moul.ttf?raw=true";
      name = "Moul.ttf";
      sha256 = "e5020ad44384950707915226c0bf70adf865fb7631ae5b19ba2ed3c41402ddc1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Moul.ttf $out/share/fonts/truetype/Moul.ttf
  '';

  meta = with stdenv.lib; {
    description = "Moul";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
