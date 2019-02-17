{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lusitana-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lusitana/Lusitana-Regular.ttf?raw=true";
      name = "Lusitana-Regular.ttf";
      sha256 = "582ef819effed258c236f4924e2799323f3d474472d50939b817f91022ed1e60";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lusitana/Lusitana-Bold.ttf?raw=true";
      name = "Lusitana-Bold.ttf";
      sha256 = "7ce8affe6a9cf98304d33443f26b172f24230dc2b96d880f98679780e2e181ad";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lusitana-Regular.ttf $out/share/fonts/truetype/Lusitana-Regular.ttf
     install -Dm644 Lusitana-Bold.ttf $out/share/fonts/truetype/Lusitana-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Lusitana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
