{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dancing-script-${version}";
  version = "2016-12-02-173016";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1b408cfce4ddc359424b91d8715f4ae4f056e0a0/ofl/dancingscript/DancingScript-Regular.ttf?raw=true";
      name = "DancingScript-Regular.ttf";
      sha256 = "4b798abd6863d7f6c33aaad62d1a687ca185083e40c61980004e25514c2328bf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1b408cfce4ddc359424b91d8715f4ae4f056e0a0/ofl/dancingscript/DancingScript-Bold.ttf?raw=true";
      name = "DancingScript-Bold.ttf";
      sha256 = "16ccbad9c1534d114efc2d3317f9f489ec853a233b6ffefd67261d9aeeb96ab6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DancingScript-Regular.ttf $out/share/fonts/truetype/DancingScript-Regular.ttf
     install -Dm644 DancingScript-Bold.ttf $out/share/fonts/truetype/DancingScript-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Dancing Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
