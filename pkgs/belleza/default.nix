{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "belleza-${version}";
  version = "2017-08-07-195441";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3e624079576533884fe9033d40e1d72a2827642/ofl/belleza/Belleza-Regular.ttf?raw=true";
      name = "Belleza-Regular.ttf";
      sha256 = "4ee512109f77101347e5b2410bcd7dee92d5acba7a0285ba0038c9b75dd9b15a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Belleza-Regular.ttf $out/share/fonts/truetype/Belleza-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Belleza";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
