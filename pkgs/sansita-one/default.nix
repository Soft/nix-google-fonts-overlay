{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sansita-one-${version}";
  version = "2017-05-08-172241";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/715265304afa4e6f2d9672f8d84fa28050f6b1f9/ofl/sansitaone/SansitaOne-Regular.ttf?raw=true";
      name = "SansitaOne-Regular.ttf";
      sha256 = "8cbe88157d350a7a15faadb0e68eee7310cb18330b9d25ff2d64b1d32f3185ad";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SansitaOne-Regular.ttf $out/share/fonts/truetype/SansitaOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Sansita One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
