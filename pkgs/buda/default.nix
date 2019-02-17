{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "buda-${version}";
  version = "2017-08-07-195353";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f728618b23f3e5fc327ffb2bcdccaac581853c9e/ofl/buda/Buda-Light.ttf?raw=true";
      name = "Buda-Light.ttf";
      sha256 = "1c8a9bb52f69dba3b66961b792c03e5407f48070bf9ff8436103082f6dd6a720";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Buda-Light.ttf $out/share/fonts/truetype/Buda-Light.ttf
  '';

  meta = with stdenv.lib; {
    description = "Buda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
