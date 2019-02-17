{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nanum-brush-script-${version}";
  version = "2018-11-12-211713";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/nanumbrushscript/NanumBrushScript-Regular.ttf?raw=true";
      name = "NanumBrushScript-Regular.ttf";
      sha256 = "27ceaf578c96f594cdf07fe0181b251790acbb746a164e45c1f6473f89911a31";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NanumBrushScript-Regular.ttf $out/share/fonts/truetype/NanumBrushScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Nanum Brush Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
