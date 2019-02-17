{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vollkorn-${version}";
  version = "2019-01-25-231657";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/37c1a2d88f3fe04a1bde9ad6000109fa926e5dfe/ofl/vollkorn/Vollkorn-Regular.ttf?raw=true";
      name = "Vollkorn-Regular.ttf";
      sha256 = "0f2949f3db470cede08a49c0f484d55d02040708c68a429efe9205ede737e564";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/37c1a2d88f3fe04a1bde9ad6000109fa926e5dfe/ofl/vollkorn/Vollkorn-Italic.ttf?raw=true";
      name = "Vollkorn-Italic.ttf";
      sha256 = "af5893110f170f7a05484304e51514b339e5495b5c54116611c3465a68985976";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Vollkorn-Regular.ttf $out/share/fonts/truetype/Vollkorn-Regular.ttf
     install -Dm644 Vollkorn-Italic.ttf $out/share/fonts/truetype/Vollkorn-Italic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Vollkorn";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
