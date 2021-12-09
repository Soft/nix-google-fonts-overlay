{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "romanesco-${version}";
  version = "2016-09-26-145146";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/romanesco/Romanesco-Regular.ttf?raw=true";
      name = "Romanesco-Regular.ttf";
      sha256 = "2af822e2e972a6552572667f73fee23adb4f146db97f89edfe6ad722d0c16076";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Romanesco-Regular.ttf $out/share/fonts/truetype/Romanesco-Regular.ttf
  '';

  meta = with lib; {
    description = "Romanesco";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
