{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bhavuka-${version}";
  version = "2016-09-26-145146";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/bhavuka/Bhavuka-Regular.ttf?raw=true";
      name = "Bhavuka-Regular.ttf";
      sha256 = "153806257782e9bb99f4504659175a4ba27a5933291702963416c98870b37aa9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bhavuka-Regular.ttf $out/share/fonts/truetype/Bhavuka-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bhavuka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
