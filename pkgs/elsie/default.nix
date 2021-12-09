{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "elsie-${version}";
  version = "2017-05-08-202211";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/702fc4554a93231b0bfab4fe9ac68ee653b9215d/ofl/elsie/Elsie-Regular.ttf?raw=true";
      name = "Elsie-Regular.ttf";
      sha256 = "ccc773e8a7b836887e124bb7e3d9219932e7392cf92c38c22f1869853a143d1b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/702fc4554a93231b0bfab4fe9ac68ee653b9215d/ofl/elsie/Elsie-Black.ttf?raw=true";
      name = "Elsie-Black.ttf";
      sha256 = "69339fcd10a5d5c12b72cf5127b44be5a0147d2531baf494004c7adad4af6338";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Elsie-Regular.ttf $out/share/fonts/truetype/Elsie-Regular.ttf
     install -Dm644 Elsie-Black.ttf $out/share/fonts/truetype/Elsie-Black.ttf
  '';

  meta = with lib; {
    description = "Elsie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
