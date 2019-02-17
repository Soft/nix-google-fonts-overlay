{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "faster-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72ae9adcbf7050111130c38239e01d8a840cda5/ofl/fasterone/FasterOne-Regular.ttf?raw=true";
      name = "FasterOne-Regular.ttf";
      sha256 = "c1d6e4baeaf82a9f971fbecb43c2836371abb5dd604f9bef7d89fdb737eaa161";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FasterOne-Regular.ttf $out/share/fonts/truetype/FasterOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Faster One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
