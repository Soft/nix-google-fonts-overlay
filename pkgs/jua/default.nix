{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jua-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/jua/Jua-Regular.ttf?raw=true";
      name = "Jua-Regular.ttf";
      sha256 = "3080d35028a655cf20b6dbd0714fa8170605b933e4a211c1ae2e4f442039faf6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jua-Regular.ttf $out/share/fonts/truetype/Jua-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Jua";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
