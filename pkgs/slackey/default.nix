{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "slackey-${version}";
  version = "2017-08-07-205200";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/20109382b7b7a1979ef07324dcdd4859c6bf60b9/apache/slackey/Slackey-Regular.ttf?raw=true";
      name = "Slackey-Regular.ttf";
      sha256 = "0be253cdeadcd1ea90ff5954e86641b3ccbef27152608e266af91619cd308eb2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Slackey-Regular.ttf $out/share/fonts/truetype/Slackey-Regular.ttf
  '';

  meta = with lib; {
    description = "Slackey";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
