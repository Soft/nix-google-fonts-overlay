{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cabin-${version}";
  version = "2017-05-01-173727";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5c0f88b9cfd4c1359948ffe05e046ec603b16e/ofl/cabin/Cabin-Regular.ttf?raw=true";
      name = "Cabin-Regular.ttf";
      sha256 = "4c2e1fa3c5fb75fe902ea787cddfe572f8afc700a8b291e6719cd3f8295ad21e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5c0f88b9cfd4c1359948ffe05e046ec603b16e/ofl/cabin/Cabin-Italic.ttf?raw=true";
      name = "Cabin-Italic.ttf";
      sha256 = "5b376cbd2026651712668dd0af354fe887f59b299484fa223197fb8e6244811a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5c0f88b9cfd4c1359948ffe05e046ec603b16e/ofl/cabin/Cabin-Medium.ttf?raw=true";
      name = "Cabin-Medium.ttf";
      sha256 = "bff11c3223a96fec3a9042fe4464dc04eb0943ccaadf686cf8850a3fd480d7ee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5c0f88b9cfd4c1359948ffe05e046ec603b16e/ofl/cabin/Cabin-MediumItalic.ttf?raw=true";
      name = "Cabin-MediumItalic.ttf";
      sha256 = "f70430094ed4c6d167fd8f7cdc8fbd71eba14b9107a890083b10bf8d77522c58";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5c0f88b9cfd4c1359948ffe05e046ec603b16e/ofl/cabin/Cabin-SemiBold.ttf?raw=true";
      name = "Cabin-SemiBold.ttf";
      sha256 = "59746e9042f7bf09a2470a0eec96a08a3840862038b47f2a1378df0d1d677fda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5c0f88b9cfd4c1359948ffe05e046ec603b16e/ofl/cabin/Cabin-SemiBoldItalic.ttf?raw=true";
      name = "Cabin-SemiBoldItalic.ttf";
      sha256 = "bb653804155eb719f704f59b432c719668854c1f5d0d3e810946c744a9df4ec7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5c0f88b9cfd4c1359948ffe05e046ec603b16e/ofl/cabin/Cabin-Bold.ttf?raw=true";
      name = "Cabin-Bold.ttf";
      sha256 = "85bc3031aabb020dc98144ce81deb86b1fefe83c483af19cd5dea9e0e1a1390e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5c0f88b9cfd4c1359948ffe05e046ec603b16e/ofl/cabin/Cabin-BoldItalic.ttf?raw=true";
      name = "Cabin-BoldItalic.ttf";
      sha256 = "a63061f859a3ee91e781833bb674e0231f68494a1572e14b18432b22a67f3671";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cabin-Regular.ttf $out/share/fonts/truetype/Cabin-Regular.ttf
     install -Dm644 Cabin-Italic.ttf $out/share/fonts/truetype/Cabin-Italic.ttf
     install -Dm644 Cabin-Medium.ttf $out/share/fonts/truetype/Cabin-Medium.ttf
     install -Dm644 Cabin-MediumItalic.ttf $out/share/fonts/truetype/Cabin-MediumItalic.ttf
     install -Dm644 Cabin-SemiBold.ttf $out/share/fonts/truetype/Cabin-SemiBold.ttf
     install -Dm644 Cabin-SemiBoldItalic.ttf $out/share/fonts/truetype/Cabin-SemiBoldItalic.ttf
     install -Dm644 Cabin-Bold.ttf $out/share/fonts/truetype/Cabin-Bold.ttf
     install -Dm644 Cabin-BoldItalic.ttf $out/share/fonts/truetype/Cabin-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cabin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
