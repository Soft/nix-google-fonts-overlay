{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "overpass-mono-${version}";
  version = "2016-12-02-171027";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94f6bbb7992e7c65306a67d86d89ab4483159fa0/ofl/overpassmono/OverpassMono-Light.ttf?raw=true";
      name = "OverpassMono-Light.ttf";
      sha256 = "5253e362b7059dff0fd9160f631367cceb39218d5c931d6955b923e2c156109d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94f6bbb7992e7c65306a67d86d89ab4483159fa0/ofl/overpassmono/OverpassMono-Regular.ttf?raw=true";
      name = "OverpassMono-Regular.ttf";
      sha256 = "6dabcee2df072941938026625a017bdcd744f1d457ad6a1f841317c7edba2d85";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94f6bbb7992e7c65306a67d86d89ab4483159fa0/ofl/overpassmono/OverpassMono-SemiBold.ttf?raw=true";
      name = "OverpassMono-SemiBold.ttf";
      sha256 = "5f05f3249e3f2f06ec14ebe06b131e9c08128065bef80245f7d121ccb6a0a26c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94f6bbb7992e7c65306a67d86d89ab4483159fa0/ofl/overpassmono/OverpassMono-Bold.ttf?raw=true";
      name = "OverpassMono-Bold.ttf";
      sha256 = "fffdbbc37fffb9a609572ed54c8dca370519b735c517d042957d9afd1dbb5ed2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OverpassMono-Light.ttf $out/share/fonts/truetype/OverpassMono-Light.ttf
     install -Dm644 OverpassMono-Regular.ttf $out/share/fonts/truetype/OverpassMono-Regular.ttf
     install -Dm644 OverpassMono-SemiBold.ttf $out/share/fonts/truetype/OverpassMono-SemiBold.ttf
     install -Dm644 OverpassMono-Bold.ttf $out/share/fonts/truetype/OverpassMono-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Overpass Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
