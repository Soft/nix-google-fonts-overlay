{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "khmer-${version}";
  version = "2016-09-26-145146";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/khmer/Khmer.ttf?raw=true";
      name = "Khmer.ttf";
      sha256 = "cc88eae47fe7875f6a0ad2135e01e5910dacebed03445c4f8d1951f9cf69e3d1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Khmer.ttf $out/share/fonts/truetype/Khmer.ttf
  '';

  meta = with stdenv.lib; {
    description = "Khmer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
