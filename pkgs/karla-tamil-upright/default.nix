{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "karla-tamil-upright-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bacec3651f66c2e219e20a9a0d0aa0286c74a777/ofl/karlatamilupright/KarlaTamilUpright-Regular.ttf?raw=true";
      name = "KarlaTamilUpright-Regular.ttf";
      sha256 = "7d79ee26d351ecf03cbeb129ef0a1c29779b58dec45a153291f1a3c6c926e50f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bacec3651f66c2e219e20a9a0d0aa0286c74a777/ofl/karlatamilupright/KarlaTamilUpright-Bold.ttf?raw=true";
      name = "KarlaTamilUpright-Bold.ttf";
      sha256 = "0121d30ef4d7b3b8f8bdd62f3ed2108d37135da8021a737d5fc4976c33f11396";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KarlaTamilUpright-Regular.ttf $out/share/fonts/truetype/KarlaTamilUpright-Regular.ttf
     install -Dm644 KarlaTamilUpright-Bold.ttf $out/share/fonts/truetype/KarlaTamilUpright-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Karla Tamil Upright";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
