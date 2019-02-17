{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kantumruy-${version}";
  version = "2016-09-26-145146";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/kantumruy/Kantumruy-Light.ttf?raw=true";
      name = "Kantumruy-Light.ttf";
      sha256 = "f6d95de5e1c82e10da26df7d1636fd40d3f53003e3abb511450609adc45813c5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/kantumruy/Kantumruy-Regular.ttf?raw=true";
      name = "Kantumruy-Regular.ttf";
      sha256 = "669fa3916da00e80b9e5715626b71ff845cf919196a1112aa8229d9722338820";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/kantumruy/Kantumruy-Bold.ttf?raw=true";
      name = "Kantumruy-Bold.ttf";
      sha256 = "06e2c000b2c4f177b1e74059999f6e9932f8a4c083368af78bd920f7651e1ee4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kantumruy-Light.ttf $out/share/fonts/truetype/Kantumruy-Light.ttf
     install -Dm644 Kantumruy-Regular.ttf $out/share/fonts/truetype/Kantumruy-Regular.ttf
     install -Dm644 Kantumruy-Bold.ttf $out/share/fonts/truetype/Kantumruy-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kantumruy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
