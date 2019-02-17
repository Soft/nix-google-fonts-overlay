{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "questrial-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/questrial/Questrial-Regular.ttf?raw=true";
      name = "Questrial-Regular.ttf";
      sha256 = "7939901e928aaa8aa17a5eb509133410ea0b40e92ac49fd035bfc191d549ed9e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Questrial-Regular.ttf $out/share/fonts/truetype/Questrial-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Questrial";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
