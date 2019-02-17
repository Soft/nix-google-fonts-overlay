{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sarala-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6e10d6038e9ae40a65bedd628e113e2938d8b29e/ofl/sarala/Sarala-Regular.ttf?raw=true";
      name = "Sarala-Regular.ttf";
      sha256 = "9e7e34335efeaec81e791b76126a3d26a77230bca9e580aa1658ccf72cebce7b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6e10d6038e9ae40a65bedd628e113e2938d8b29e/ofl/sarala/Sarala-Bold.ttf?raw=true";
      name = "Sarala-Bold.ttf";
      sha256 = "b08ccab2a22b3dcfad6a9b88d5b700cb830c7557ae13e9264e61cd6a96ecc268";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sarala-Regular.ttf $out/share/fonts/truetype/Sarala-Regular.ttf
     install -Dm644 Sarala-Bold.ttf $out/share/fonts/truetype/Sarala-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Sarala";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
