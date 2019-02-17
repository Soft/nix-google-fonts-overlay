{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pangolin-${version}";
  version = "2017-05-01-173145";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae709f65e8f86678a2517308b2ef2cf621595793/ofl/pangolin/Pangolin-Regular.ttf?raw=true";
      name = "Pangolin-Regular.ttf";
      sha256 = "cf4f0a46704c7859d4943320fce6c6d06cc7dc450ef971c3676ef36f9f482299";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pangolin-Regular.ttf $out/share/fonts/truetype/Pangolin-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Pangolin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
