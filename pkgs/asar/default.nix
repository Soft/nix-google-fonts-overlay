{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asar-${version}";
  version = "2017-08-07-200252";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/275d4928c4f5b7d9a0a2b8c68408a6410b0ece63/ofl/asar/Asar-Regular.ttf?raw=true";
      name = "Asar-Regular.ttf";
      sha256 = "8b4147354af009836d031f50af3e0450768d78b1e0e0281c7df17cd26440cc2e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Asar-Regular.ttf $out/share/fonts/truetype/Asar-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Asar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
