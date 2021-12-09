{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kodchasan-${version}";
  version = "2018-09-07-135807";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-ExtraLight.ttf?raw=true";
      name = "Kodchasan-ExtraLight.ttf";
      sha256 = "822421bbdacb93d31b5f24f59216abcea5828f9c5a3c5b1d48ce2c9e66575235";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-ExtraLightItalic.ttf?raw=true";
      name = "Kodchasan-ExtraLightItalic.ttf";
      sha256 = "934fa55ffe7da4ed30d0819d7615b42a16d5b497552d424eae618313d679da3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-Light.ttf?raw=true";
      name = "Kodchasan-Light.ttf";
      sha256 = "31e78081f32a72613b3d60402cd836801427582257991ea040c6cd7f2fcce194";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-LightItalic.ttf?raw=true";
      name = "Kodchasan-LightItalic.ttf";
      sha256 = "28dca3671a0acc2358f7bd699eab80434b5ef5281c291f0c0c27687ee97b0721";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-Regular.ttf?raw=true";
      name = "Kodchasan-Regular.ttf";
      sha256 = "14c3507f90ad8a0f9de5ebb53997ec8111416a06983ab1d9d83a58427808f6f7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-Italic.ttf?raw=true";
      name = "Kodchasan-Italic.ttf";
      sha256 = "aede59bddb42c3bb1cf46e6f4a631ca9f41558be7967e1468eb78c6c1c0f5994";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-Medium.ttf?raw=true";
      name = "Kodchasan-Medium.ttf";
      sha256 = "3f48225a6ab583c863a06ce311e9c799eed469aa129c3a6ff8efcf87d2822318";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-MediumItalic.ttf?raw=true";
      name = "Kodchasan-MediumItalic.ttf";
      sha256 = "776227be9caf1e5b67794a17a593c1aa22425e5b9a2a4b6eaecbb96076d1079b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-SemiBold.ttf?raw=true";
      name = "Kodchasan-SemiBold.ttf";
      sha256 = "b0c8bca75251be375fdd50c48fa782fa8d7ebc5f67809f7559a2c7d5f4498241";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-SemiBoldItalic.ttf?raw=true";
      name = "Kodchasan-SemiBoldItalic.ttf";
      sha256 = "599aab7046c1a2593dfbb237e7ddaa1c530ec2f3db2ee90c482ab93d1a6aaf44";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-Bold.ttf?raw=true";
      name = "Kodchasan-Bold.ttf";
      sha256 = "2cd93da17fb98eea83461cde3b4fd99f0bc33c7a3df7a5c8d668d64bd1c6f223";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ad6b8bf2958e9cd8273de57791393a62acb0bc11/ofl/kodchasan/Kodchasan-BoldItalic.ttf?raw=true";
      name = "Kodchasan-BoldItalic.ttf";
      sha256 = "e9c1d503796239a8d3c24207d788b22922145bbdcd1a330cdf3ce913089c365a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kodchasan-ExtraLight.ttf $out/share/fonts/truetype/Kodchasan-ExtraLight.ttf
     install -Dm644 Kodchasan-ExtraLightItalic.ttf $out/share/fonts/truetype/Kodchasan-ExtraLightItalic.ttf
     install -Dm644 Kodchasan-Light.ttf $out/share/fonts/truetype/Kodchasan-Light.ttf
     install -Dm644 Kodchasan-LightItalic.ttf $out/share/fonts/truetype/Kodchasan-LightItalic.ttf
     install -Dm644 Kodchasan-Regular.ttf $out/share/fonts/truetype/Kodchasan-Regular.ttf
     install -Dm644 Kodchasan-Italic.ttf $out/share/fonts/truetype/Kodchasan-Italic.ttf
     install -Dm644 Kodchasan-Medium.ttf $out/share/fonts/truetype/Kodchasan-Medium.ttf
     install -Dm644 Kodchasan-MediumItalic.ttf $out/share/fonts/truetype/Kodchasan-MediumItalic.ttf
     install -Dm644 Kodchasan-SemiBold.ttf $out/share/fonts/truetype/Kodchasan-SemiBold.ttf
     install -Dm644 Kodchasan-SemiBoldItalic.ttf $out/share/fonts/truetype/Kodchasan-SemiBoldItalic.ttf
     install -Dm644 Kodchasan-Bold.ttf $out/share/fonts/truetype/Kodchasan-Bold.ttf
     install -Dm644 Kodchasan-BoldItalic.ttf $out/share/fonts/truetype/Kodchasan-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Kodchasan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
