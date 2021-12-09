{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abyssinica-sil-${version}";
  version = "2016-01-26-020200";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6d3047828cd43bf4bcbb2f3f7810714b6238909c/ofl/abyssinicasil/AbyssinicaSIL-Regular.ttf?raw=true";
      name = "AbyssinicaSIL-Regular.ttf";
      sha256 = "9e3f55bea243e2ab01c1d11be8726f0f1dc7011e87e0a47d416674a9879cfb88";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AbyssinicaSIL-Regular.ttf $out/share/fonts/truetype/AbyssinicaSIL-Regular.ttf
  '';

  meta = with lib; {
    description = "Abyssinica SIL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
