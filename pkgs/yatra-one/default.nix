{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yatra-one-${version}";
  version = "2017-05-24-213236";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/34fb624ef6f7a31980df5609a2e16ca240a72f48/ofl/yatraone/YatraOne-Regular.ttf?raw=true";
      name = "YatraOne-Regular.ttf";
      sha256 = "c47a94a4edf30f4eae0ca1c84777f4b70bc350221b6249de6b64fefdded2d3cd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YatraOne-Regular.ttf $out/share/fonts/truetype/YatraOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Yatra One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
