{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-mono-one-${version}";
  version = "2016-11-09-144052";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0fc79a83d486f399f0fe3c07f4d0a5ab6a39ad1f/ofl/rubikmonoone/RubikMonoOne-Regular.ttf?raw=true";
      name = "RubikMonoOne-Regular.ttf";
      sha256 = "b22624b6a36e543e942106edfccd198c50b57b65b924bfe02a6f0a5699429e6b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikMonoOne-Regular.ttf $out/share/fonts/truetype/RubikMonoOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rubik Mono One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
