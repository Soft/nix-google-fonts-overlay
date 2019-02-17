{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "candal-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cfa69ab461fc34b4f00c69304e9d10e0539191ce/ofl/candal/Candal.ttf?raw=true";
      name = "Candal.ttf";
      sha256 = "cf4ff425c49ab2e167fb7d166ba57f2925b6df6161a228786b291ea3875f1eb5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Candal.ttf $out/share/fonts/truetype/Candal.ttf
  '';

  meta = with stdenv.lib; {
    description = "Candal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
