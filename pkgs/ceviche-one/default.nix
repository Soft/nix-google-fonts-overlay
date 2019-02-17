{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ceviche-one-${version}";
  version = "2016-02-19-193229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/08e091b33ee54b21c64ef05743bcc6716d1bdcb7/ofl/cevicheone/CevicheOne-Regular.ttf?raw=true";
      name = "CevicheOne-Regular.ttf";
      sha256 = "366249c911e689cd5ea3d576c0eba0c37a938e0a58721fce3733a4244dd9ab32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CevicheOne-Regular.ttf $out/share/fonts/truetype/CevicheOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Ceviche One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
