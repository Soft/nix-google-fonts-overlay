{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "text-me-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/textmeone/TextMeOne-Regular.ttf?raw=true";
      name = "TextMeOne-Regular.ttf";
      sha256 = "9fe85023985715c05af121a2a76431ca651ab77e25e32d8fb3079c5f23818849";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TextMeOne-Regular.ttf $out/share/fonts/truetype/TextMeOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Text Me One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
