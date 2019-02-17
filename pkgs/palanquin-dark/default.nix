{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "palanquin-dark-${version}";
  version = "2017-05-09-184824";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8af237765c48f3fa04c4a97028cecd1c1e63a76f/ofl/palanquindark/PalanquinDark-Regular.ttf?raw=true";
      name = "PalanquinDark-Regular.ttf";
      sha256 = "de7ba10d7038f13c677b6a57e01c4b2082dd49602a15406135d761296c949284";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8af237765c48f3fa04c4a97028cecd1c1e63a76f/ofl/palanquindark/PalanquinDark-Medium.ttf?raw=true";
      name = "PalanquinDark-Medium.ttf";
      sha256 = "32b2f0672eb1597556c71d002b59dbaff75aeb20e3d2fde9286c71b3793b483f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8af237765c48f3fa04c4a97028cecd1c1e63a76f/ofl/palanquindark/PalanquinDark-SemiBold.ttf?raw=true";
      name = "PalanquinDark-SemiBold.ttf";
      sha256 = "4729ae4e60cc20cbc1ec942b033354683339fd77a9dcf55f998e9153cb6d3036";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8af237765c48f3fa04c4a97028cecd1c1e63a76f/ofl/palanquindark/PalanquinDark-Bold.ttf?raw=true";
      name = "PalanquinDark-Bold.ttf";
      sha256 = "8bf3591c758a3a35977b9af72c6a9639aa60c6652743ddb9cdc59dc1a30f7971";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PalanquinDark-Regular.ttf $out/share/fonts/truetype/PalanquinDark-Regular.ttf
     install -Dm644 PalanquinDark-Medium.ttf $out/share/fonts/truetype/PalanquinDark-Medium.ttf
     install -Dm644 PalanquinDark-SemiBold.ttf $out/share/fonts/truetype/PalanquinDark-SemiBold.ttf
     install -Dm644 PalanquinDark-Bold.ttf $out/share/fonts/truetype/PalanquinDark-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Palanquin Dark";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
