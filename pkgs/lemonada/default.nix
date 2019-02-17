{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lemonada-${version}";
  version = "2017-05-23-171505";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d044380014d7d3b3fa30b38e77b0edd277e2fc32/ofl/lemonada/Lemonada-Light.ttf?raw=true";
      name = "Lemonada-Light.ttf";
      sha256 = "2a7cfd446f0c8f4fddd2eb78a77f501d27aaae1f885968a3ed4dc0adffab22ab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d044380014d7d3b3fa30b38e77b0edd277e2fc32/ofl/lemonada/Lemonada-Regular.ttf?raw=true";
      name = "Lemonada-Regular.ttf";
      sha256 = "55c0ca646312e3a9f15cda950a021bff5cc5099dfc9193db575b8489d88ea097";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d044380014d7d3b3fa30b38e77b0edd277e2fc32/ofl/lemonada/Lemonada-SemiBold.ttf?raw=true";
      name = "Lemonada-SemiBold.ttf";
      sha256 = "58259d86cdd3315d94751aa4c183e06be4c5059c6d6c2850dbffd7c9c016bf6f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d044380014d7d3b3fa30b38e77b0edd277e2fc32/ofl/lemonada/Lemonada-Bold.ttf?raw=true";
      name = "Lemonada-Bold.ttf";
      sha256 = "cff57e01db70f8ef1f4bdaa2db9c9cbafa88e7831127a568ddf3c4ff86276cbb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lemonada-Light.ttf $out/share/fonts/truetype/Lemonada-Light.ttf
     install -Dm644 Lemonada-Regular.ttf $out/share/fonts/truetype/Lemonada-Regular.ttf
     install -Dm644 Lemonada-SemiBold.ttf $out/share/fonts/truetype/Lemonada-SemiBold.ttf
     install -Dm644 Lemonada-Bold.ttf $out/share/fonts/truetype/Lemonada-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Lemonada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
