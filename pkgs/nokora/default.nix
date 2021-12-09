{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nokora-${version}";
  version = "2017-08-07-193929";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/59ebae85bc9c7454666a974c081eb78ce4f82047/apache/nokora/Nokora-Regular.ttf?raw=true";
      name = "Nokora-Regular.ttf";
      sha256 = "df37472e9f335797cb42b53765c2f845bdf2730a0ebdef94e92da14421399dc7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/59ebae85bc9c7454666a974c081eb78ce4f82047/apache/nokora/Nokora-Bold.ttf?raw=true";
      name = "Nokora-Bold.ttf";
      sha256 = "b0169f8d452cb21edddfa335b08a6b62aacedccda85c989f9bd5bcab9eb2c18b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nokora-Regular.ttf $out/share/fonts/truetype/Nokora-Regular.ttf
     install -Dm644 Nokora-Bold.ttf $out/share/fonts/truetype/Nokora-Bold.ttf
  '';

  meta = with lib; {
    description = "Nokora";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
