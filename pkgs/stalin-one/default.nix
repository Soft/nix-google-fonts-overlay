{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stalin-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/stalinone/StalinOne-Regular.ttf?raw=true";
      name = "StalinOne-Regular.ttf";
      sha256 = "416257c54806fc036d94d7c9e8eaaa0329a73745f61fbce65fd7af647b529544";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StalinOne-Regular.ttf $out/share/fonts/truetype/StalinOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Stalin One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
