{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anton-${version}";
  version = "2016-12-02-173351";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b84f96eb7e3645546144c2294795795189fe49b4/ofl/anton/Anton-Regular.ttf?raw=true";
      name = "Anton-Regular.ttf";
      sha256 = "83be67769f0287a34b25ff70297b58ef1c0b259939cbea11a0768204237834db";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anton-Regular.ttf $out/share/fonts/truetype/Anton-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Anton";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
