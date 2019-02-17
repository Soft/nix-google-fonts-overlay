{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-inline-${version}";
  version = "2017-05-23-164723";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/af0dce45e2acc67b26b81f0cf35676c33a972e78/ofl/bungeeinline/BungeeInline-Regular.ttf?raw=true";
      name = "BungeeInline-Regular.ttf";
      sha256 = "f498549ba864da83adefaf130ed6f1cd45ba41b2374799a901814fc1fb218876";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeInline-Regular.ttf $out/share/fonts/truetype/BungeeInline-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bungee Inline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
