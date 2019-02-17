{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merienda-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/merienda/Merienda-Regular.ttf?raw=true";
      name = "Merienda-Regular.ttf";
      sha256 = "0712e50e6daea6780a034b7f4a01bca9041d483585ae0cefa388ba43c508c1be";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/merienda/Merienda-Bold.ttf?raw=true";
      name = "Merienda-Bold.ttf";
      sha256 = "38e1eef698b73d44fc467764bf86b9b6f2ed3e07036d584604754d07f465de2e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Merienda-Regular.ttf $out/share/fonts/truetype/Merienda-Regular.ttf
     install -Dm644 Merienda-Bold.ttf $out/share/fonts/truetype/Merienda-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Merienda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
