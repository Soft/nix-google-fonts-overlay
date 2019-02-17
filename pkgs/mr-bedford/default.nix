{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mr-bedford-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mrbedford/MrBedfort-Regular.ttf?raw=true";
      name = "MrBedfort-Regular.ttf";
      sha256 = "cac6a1f9341b6810c8b764782d177cf94d92d47589fd4b3cc1263e8f475beb18";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MrBedfort-Regular.ttf $out/share/fonts/truetype/MrBedfort-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Mr Bedford";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
