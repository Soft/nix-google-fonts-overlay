{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nosifer-caps-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/nosifercaps/NosiferCaps-Regular.ttf?raw=true";
      name = "NosiferCaps-Regular.ttf";
      sha256 = "1a1d4fe8f93c32408dc6d068f43e59aaaa3fae4e2cff74dccfbb64de5005d9c1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NosiferCaps-Regular.ttf $out/share/fonts/truetype/NosiferCaps-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Nosifer Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
