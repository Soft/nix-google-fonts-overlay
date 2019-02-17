{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "archivo-narrow-${version}";
  version = "2017-08-07-210651";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/438f370f4e6324a6eb4ca3531bf5be0d0df3dab9/ofl/archivonarrow/ArchivoNarrow-Regular.ttf?raw=true";
      name = "ArchivoNarrow-Regular.ttf";
      sha256 = "442bf1abfb234359d38a0b8ebeac181f4c55261263422d2b3a9e49b4feaf37fa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/438f370f4e6324a6eb4ca3531bf5be0d0df3dab9/ofl/archivonarrow/ArchivoNarrow-Italic.ttf?raw=true";
      name = "ArchivoNarrow-Italic.ttf";
      sha256 = "15e6fa0177ec3c82fcaffd9f087eb1a69ffe2ee53e25e9ec6b472d4a6990c791";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/438f370f4e6324a6eb4ca3531bf5be0d0df3dab9/ofl/archivonarrow/ArchivoNarrow-Medium.ttf?raw=true";
      name = "ArchivoNarrow-Medium.ttf";
      sha256 = "82fc5167a933265dc375be42211c19c9624f6df6775627e06da2df2b62a909f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/438f370f4e6324a6eb4ca3531bf5be0d0df3dab9/ofl/archivonarrow/ArchivoNarrow-MediumItalic.ttf?raw=true";
      name = "ArchivoNarrow-MediumItalic.ttf";
      sha256 = "d4e1f5cf79f46ddcee22ed5e2012e97f2f972f957dd7782d0c5ecfbaa6172b25";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/438f370f4e6324a6eb4ca3531bf5be0d0df3dab9/ofl/archivonarrow/ArchivoNarrow-SemiBold.ttf?raw=true";
      name = "ArchivoNarrow-SemiBold.ttf";
      sha256 = "210c74a8e3cdb9cf1ffdedbc2179202b1f95c77400e3e3484af33f880fc1a308";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/438f370f4e6324a6eb4ca3531bf5be0d0df3dab9/ofl/archivonarrow/ArchivoNarrow-SemiBoldItalic.ttf?raw=true";
      name = "ArchivoNarrow-SemiBoldItalic.ttf";
      sha256 = "f286fd4e15b0251b26a033fc444115cf9926a1c0c43a03a0110d3ce5e1c07e4d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/438f370f4e6324a6eb4ca3531bf5be0d0df3dab9/ofl/archivonarrow/ArchivoNarrow-Bold.ttf?raw=true";
      name = "ArchivoNarrow-Bold.ttf";
      sha256 = "eaf1cd13444454290ad59822b6ec0edf817271f6ec48ef17ffda7572daa00a96";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/438f370f4e6324a6eb4ca3531bf5be0d0df3dab9/ofl/archivonarrow/ArchivoNarrow-BoldItalic.ttf?raw=true";
      name = "ArchivoNarrow-BoldItalic.ttf";
      sha256 = "ff27b48068c037afc8c59778a87272d4bb366bc25c88c47dfda059aa23714a54";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArchivoNarrow-Regular.ttf $out/share/fonts/truetype/ArchivoNarrow-Regular.ttf
     install -Dm644 ArchivoNarrow-Italic.ttf $out/share/fonts/truetype/ArchivoNarrow-Italic.ttf
     install -Dm644 ArchivoNarrow-Medium.ttf $out/share/fonts/truetype/ArchivoNarrow-Medium.ttf
     install -Dm644 ArchivoNarrow-MediumItalic.ttf $out/share/fonts/truetype/ArchivoNarrow-MediumItalic.ttf
     install -Dm644 ArchivoNarrow-SemiBold.ttf $out/share/fonts/truetype/ArchivoNarrow-SemiBold.ttf
     install -Dm644 ArchivoNarrow-SemiBoldItalic.ttf $out/share/fonts/truetype/ArchivoNarrow-SemiBoldItalic.ttf
     install -Dm644 ArchivoNarrow-Bold.ttf $out/share/fonts/truetype/ArchivoNarrow-Bold.ttf
     install -Dm644 ArchivoNarrow-BoldItalic.ttf $out/share/fonts/truetype/ArchivoNarrow-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Archivo Narrow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
