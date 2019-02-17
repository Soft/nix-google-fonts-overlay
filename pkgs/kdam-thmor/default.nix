{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kdam-thmor-${version}";
  version = "2016-09-26-145146";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/kdamthmor/KdamThmor-Regular.ttf?raw=true";
      name = "KdamThmor-Regular.ttf";
      sha256 = "adf234c417f867e6083569b0eedcdafe68762f1bfc1233bdc6125ad5adde7dcd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KdamThmor-Regular.ttf $out/share/fonts/truetype/KdamThmor-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kdam Thmor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
