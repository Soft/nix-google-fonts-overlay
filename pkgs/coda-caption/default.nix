{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "coda-caption-${version}";
  version = "2017-05-08-201226";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4bd5a2d5bef6e81f2a8c80e85f8454d5184739cc/ofl/codacaption/CodaCaption-ExtraBold.ttf?raw=true";
      name = "CodaCaption-ExtraBold.ttf";
      sha256 = "c08c6f885864896047ce2be2e2ce744067e3a0d87f0f76929efaa9f70eeae576";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CodaCaption-ExtraBold.ttf $out/share/fonts/truetype/CodaCaption-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Coda Caption";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
