{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-${version}";
  version = "2016-12-06-220634";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-Thin.ttf?raw=true";
      name = "Saira-Thin.ttf";
      sha256 = "581a1a51eda89f4c2ee35c15ef7de1fb057b270674013f66ff4db55f46a239cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-ExtraLight.ttf?raw=true";
      name = "Saira-ExtraLight.ttf";
      sha256 = "1edb5f082ff74b72f581b65b9ac1166380f749583f3d96d73c4fcd0ddce665c7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-Light.ttf?raw=true";
      name = "Saira-Light.ttf";
      sha256 = "281302aeae746a57365636d34115f0a7680a5da40b935d3f3f628aa73ac5e873";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-Regular.ttf?raw=true";
      name = "Saira-Regular.ttf";
      sha256 = "74f5b853b7936f5906909f655dd880b734464cdfc4d827fa8fc40fbe0e52b6b0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-Medium.ttf?raw=true";
      name = "Saira-Medium.ttf";
      sha256 = "8fc31c4ff4d68a0a8a3b73e194f37805f874252a5620569eea963f049e9b3d80";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-SemiBold.ttf?raw=true";
      name = "Saira-SemiBold.ttf";
      sha256 = "440f4c12f6d3cf0c0c31c0a238496f707b42cc8a68c305040e0e37a2acf9c331";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-Bold.ttf?raw=true";
      name = "Saira-Bold.ttf";
      sha256 = "aaceb2b9daad39f6ccf8a38bb91e05597d813338630a419b46a7820032057519";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-ExtraBold.ttf?raw=true";
      name = "Saira-ExtraBold.ttf";
      sha256 = "d52d6f163dd14668f818ddf36089613f4120a2acf9b0448a880b2ea788aa9a53";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d52197701e8ef626b6ae45b4dd26ca6c20e0138b/ofl/saira/Saira-Black.ttf?raw=true";
      name = "Saira-Black.ttf";
      sha256 = "c1036c7d164f3c2a4103bbc059e87edb653dcabb442f888f71eea3748b4b2e1b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Saira-Thin.ttf $out/share/fonts/truetype/Saira-Thin.ttf
     install -Dm644 Saira-ExtraLight.ttf $out/share/fonts/truetype/Saira-ExtraLight.ttf
     install -Dm644 Saira-Light.ttf $out/share/fonts/truetype/Saira-Light.ttf
     install -Dm644 Saira-Regular.ttf $out/share/fonts/truetype/Saira-Regular.ttf
     install -Dm644 Saira-Medium.ttf $out/share/fonts/truetype/Saira-Medium.ttf
     install -Dm644 Saira-SemiBold.ttf $out/share/fonts/truetype/Saira-SemiBold.ttf
     install -Dm644 Saira-Bold.ttf $out/share/fonts/truetype/Saira-Bold.ttf
     install -Dm644 Saira-ExtraBold.ttf $out/share/fonts/truetype/Saira-ExtraBold.ttf
     install -Dm644 Saira-Black.ttf $out/share/fonts/truetype/Saira-Black.ttf
  '';

  meta = with lib; {
    description = "Saira";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
