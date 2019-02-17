{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "itim-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/daa233403bbd018ad2f10292b6a399037bf6a347/ofl/itim/Itim-Regular.ttf?raw=true";
      name = "Itim-Regular.ttf";
      sha256 = "9164d7eb92ca717b53b07193e3445c96782222d24215151b8d2851b576b17645";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Itim-Regular.ttf $out/share/fonts/truetype/Itim-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Itim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
