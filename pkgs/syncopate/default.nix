{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "syncopate-${version}";
  version = "2017-08-07-205625";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/56cadf2effb0b99c13c520ac4b05ec12580f707d/apache/syncopate/Syncopate-Regular.ttf?raw=true";
      name = "Syncopate-Regular.ttf";
      sha256 = "fcbb10798b80c981afabaa1055bde2ee29b283069b44cdfc68457e903a056ac1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/56cadf2effb0b99c13c520ac4b05ec12580f707d/apache/syncopate/Syncopate-Bold.ttf?raw=true";
      name = "Syncopate-Bold.ttf";
      sha256 = "c71f5a40a83115518443c13474e5132804f4a91ce26e26fd9718cd3814ad4b2e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Syncopate-Regular.ttf $out/share/fonts/truetype/Syncopate-Regular.ttf
     install -Dm644 Syncopate-Bold.ttf $out/share/fonts/truetype/Syncopate-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Syncopate";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
