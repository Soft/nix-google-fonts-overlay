{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "luckiest-guy-${version}";
  version = "2017-08-07-204346";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9a936674760330d42e94ba85eec8cd15b8fb9766/apache/luckiestguy/LuckiestGuy-Regular.ttf?raw=true";
      name = "LuckiestGuy-Regular.ttf";
      sha256 = "cfbdd68a039f92df51cf3721506af6242e64594c6325fe0bedbeff3fe385d980";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LuckiestGuy-Regular.ttf $out/share/fonts/truetype/LuckiestGuy-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Luckiest Guy";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
