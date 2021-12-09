{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "markazi-text-${version}";
  version = "2018-06-07-150915";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/389397a7c8b69e8c880e870b74cf455db20b442b/ofl/markazitext/MarkaziText-Roman-VF.ttf?raw=true";
      name = "MarkaziText-Roman-VF.ttf";
      sha256 = "967e420776e4da0b9c0098eae46aaf3230b054f8eb4d1e8afcae8c651a3c406f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/389397a7c8b69e8c880e870b74cf455db20b442b/ofl/markazitext/MarkaziText-Roman-VF.ttf?raw=true";
      name = "MarkaziText-Roman-VF.ttf";
      sha256 = "967e420776e4da0b9c0098eae46aaf3230b054f8eb4d1e8afcae8c651a3c406f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/389397a7c8b69e8c880e870b74cf455db20b442b/ofl/markazitext/MarkaziText-Roman-VF.ttf?raw=true";
      name = "MarkaziText-Roman-VF.ttf";
      sha256 = "967e420776e4da0b9c0098eae46aaf3230b054f8eb4d1e8afcae8c651a3c406f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/389397a7c8b69e8c880e870b74cf455db20b442b/ofl/markazitext/MarkaziText-Roman-VF.ttf?raw=true";
      name = "MarkaziText-Roman-VF.ttf";
      sha256 = "967e420776e4da0b9c0098eae46aaf3230b054f8eb4d1e8afcae8c651a3c406f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MarkaziText-Roman-VF.ttf $out/share/fonts/truetype/MarkaziText-Roman-VF.ttf
     install -Dm644 MarkaziText-Roman-VF.ttf $out/share/fonts/truetype/MarkaziText-Roman-VF.ttf
     install -Dm644 MarkaziText-Roman-VF.ttf $out/share/fonts/truetype/MarkaziText-Roman-VF.ttf
     install -Dm644 MarkaziText-Roman-VF.ttf $out/share/fonts/truetype/MarkaziText-Roman-VF.ttf
  '';

  meta = with lib; {
    description = "Markazi Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
