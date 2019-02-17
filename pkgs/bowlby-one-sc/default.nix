{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bowlby-one-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c6a838cef39810335b295d7088865ccda00ccc61/ofl/bowlbyonesc/BowlbyOneSC-Regular.ttf?raw=true";
      name = "BowlbyOneSC-Regular.ttf";
      sha256 = "dc9f2325fb6bab327c26619a752b274b8f0f4022756d896450911e885609f071";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BowlbyOneSC-Regular.ttf $out/share/fonts/truetype/BowlbyOneSC-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bowlby One SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
