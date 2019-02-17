{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ravi-prakash-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/raviprakash/RaviPrakash-Regular.ttf?raw=true";
      name = "RaviPrakash-Regular.ttf";
      sha256 = "f539bdb2673b3e1b69a279da763d178a6e4b4cafe5a12c85be0f5e03b547fcb6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RaviPrakash-Regular.ttf $out/share/fonts/truetype/RaviPrakash-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Ravi Prakash";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
