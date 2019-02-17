{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "crimson-text-${version}";
  version = "2017-05-16-005212";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cd74fef6f10ce7ce33a10a45128df0956a6ccd22/ofl/crimsontext/CrimsonText-Regular.ttf?raw=true";
      name = "CrimsonText-Regular.ttf";
      sha256 = "19a5c083c2c690d15c096d35b4c05f00b61e3d03e86e75b7a37181dddf2a8071";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cd74fef6f10ce7ce33a10a45128df0956a6ccd22/ofl/crimsontext/CrimsonText-Italic.ttf?raw=true";
      name = "CrimsonText-Italic.ttf";
      sha256 = "c72050dbd63c8e3c07bdb296e5fcab1d6d0ddc5aac06cc0f0955a0385bf0d961";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d774fc0799fdeddbd8720616a6d2d791be29fafa/ofl/crimsontext/CrimsonText-SemiBold.ttf?raw=true";
      name = "CrimsonText-SemiBold.ttf";
      sha256 = "f70906a3e0f841ee214397fd096bc172079d0abf02630954b074e37474c92633";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d774fc0799fdeddbd8720616a6d2d791be29fafa/ofl/crimsontext/CrimsonText-SemiBoldItalic.ttf?raw=true";
      name = "CrimsonText-SemiBoldItalic.ttf";
      sha256 = "d7baea56d58c7d9ba559f5b008214532d5b603953de14af5c156f6f90375fefa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cd74fef6f10ce7ce33a10a45128df0956a6ccd22/ofl/crimsontext/CrimsonText-Bold.ttf?raw=true";
      name = "CrimsonText-Bold.ttf";
      sha256 = "bada9fa2d3f13fc379ed8ebe4f46bc50e5a99ee8de7ad4f951b1ca16f0ec9936";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cd74fef6f10ce7ce33a10a45128df0956a6ccd22/ofl/crimsontext/CrimsonText-BoldItalic.ttf?raw=true";
      name = "CrimsonText-BoldItalic.ttf";
      sha256 = "4f8e7af94884af1afd278530ce6d638dc990f7fe6a45c1f003c516d6b3b1223f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CrimsonText-Regular.ttf $out/share/fonts/truetype/CrimsonText-Regular.ttf
     install -Dm644 CrimsonText-Italic.ttf $out/share/fonts/truetype/CrimsonText-Italic.ttf
     install -Dm644 CrimsonText-SemiBold.ttf $out/share/fonts/truetype/CrimsonText-SemiBold.ttf
     install -Dm644 CrimsonText-SemiBoldItalic.ttf $out/share/fonts/truetype/CrimsonText-SemiBoldItalic.ttf
     install -Dm644 CrimsonText-Bold.ttf $out/share/fonts/truetype/CrimsonText-Bold.ttf
     install -Dm644 CrimsonText-BoldItalic.ttf $out/share/fonts/truetype/CrimsonText-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Crimson Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
