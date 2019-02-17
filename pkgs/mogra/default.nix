{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mogra-${version}";
  version = "2017-05-16-003728";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c57bb1c06cfb430ad2ba863c0b5191b760d8f4a6/ofl/mogra/Mogra-Regular.ttf?raw=true";
      name = "Mogra-Regular.ttf";
      sha256 = "1d7133f5926cf5e7042b587b838bc5c5bcfe6c86b19157afd544c71a630159d8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mogra-Regular.ttf $out/share/fonts/truetype/Mogra-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Mogra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
