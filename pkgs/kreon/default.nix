{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kreon-${version}";
  version = "2017-05-08-221902";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ca40bf388a8dab37afffd41f021d91fcd9507d89/ofl/kreon/Kreon-Light.ttf?raw=true";
      name = "Kreon-Light.ttf";
      sha256 = "c38d2be8ec1e28ad15116da590103cd15522e7c9707da0b79ad5bc67b3659dc1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ca40bf388a8dab37afffd41f021d91fcd9507d89/ofl/kreon/Kreon-Regular.ttf?raw=true";
      name = "Kreon-Regular.ttf";
      sha256 = "7dd3d73caf3383fefa5e853ed6f966734d38801a7a727bd1d3965942de99f399";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ca40bf388a8dab37afffd41f021d91fcd9507d89/ofl/kreon/Kreon-Bold.ttf?raw=true";
      name = "Kreon-Bold.ttf";
      sha256 = "a71f6bd74595be2d7ea68b56c837c25c4856eb8c9a4b03e10a77714f4885a76d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kreon-Light.ttf $out/share/fonts/truetype/Kreon-Light.ttf
     install -Dm644 Kreon-Regular.ttf $out/share/fonts/truetype/Kreon-Regular.ttf
     install -Dm644 Kreon-Bold.ttf $out/share/fonts/truetype/Kreon-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kreon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
