{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amiko-${version}";
  version = "2017-05-23-171340";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/20b1ef87d6d2aff7383960ad63f0a454ea8a51ef/ofl/amiko/Amiko-Regular.ttf?raw=true";
      name = "Amiko-Regular.ttf";
      sha256 = "402d4d96034762fee68518fd95b778cf6a9d70cab838fa1a817cb783d39639a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/20b1ef87d6d2aff7383960ad63f0a454ea8a51ef/ofl/amiko/Amiko-SemiBold.ttf?raw=true";
      name = "Amiko-SemiBold.ttf";
      sha256 = "ddfc0e53ccdc4f13cac4599f97d5775be74b2e1e0773cf1bdce71483a476fbf6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/20b1ef87d6d2aff7383960ad63f0a454ea8a51ef/ofl/amiko/Amiko-Bold.ttf?raw=true";
      name = "Amiko-Bold.ttf";
      sha256 = "70d2a2e9eeee950c666f5c94836e9fcd3fd3297d1975c952db2518d0e5ebc9ef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amiko-Regular.ttf $out/share/fonts/truetype/Amiko-Regular.ttf
     install -Dm644 Amiko-SemiBold.ttf $out/share/fonts/truetype/Amiko-SemiBold.ttf
     install -Dm644 Amiko-Bold.ttf $out/share/fonts/truetype/Amiko-Bold.ttf
  '';

  meta = with lib; {
    description = "Amiko";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
