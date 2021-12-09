{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mirza-${version}";
  version = "2017-05-11-034523";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cdca29ebe35b5f4f82be3300fa090c2713ebe182/ofl/mirza/Mirza-Regular.ttf?raw=true";
      name = "Mirza-Regular.ttf";
      sha256 = "5b1ac6cb285ca3492e313a53d5252b9784bf7607f2835a2d44cb3cbad0168539";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cdca29ebe35b5f4f82be3300fa090c2713ebe182/ofl/mirza/Mirza-Medium.ttf?raw=true";
      name = "Mirza-Medium.ttf";
      sha256 = "423532407cc832ef84cc8f08a3359f26b50e721c8aa0e00221e4215cc83440b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cdca29ebe35b5f4f82be3300fa090c2713ebe182/ofl/mirza/Mirza-SemiBold.ttf?raw=true";
      name = "Mirza-SemiBold.ttf";
      sha256 = "4225215d0df4ad389c4ac29d48fddc531703776591ade64c23f6f995669d4078";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cdca29ebe35b5f4f82be3300fa090c2713ebe182/ofl/mirza/Mirza-Bold.ttf?raw=true";
      name = "Mirza-Bold.ttf";
      sha256 = "306b412a39d9f93ca840c13ca62300eb5c7712e2afa94bd7ef2272b51131be6d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mirza-Regular.ttf $out/share/fonts/truetype/Mirza-Regular.ttf
     install -Dm644 Mirza-Medium.ttf $out/share/fonts/truetype/Mirza-Medium.ttf
     install -Dm644 Mirza-SemiBold.ttf $out/share/fonts/truetype/Mirza-SemiBold.ttf
     install -Dm644 Mirza-Bold.ttf $out/share/fonts/truetype/Mirza-Bold.ttf
  '';

  meta = with lib; {
    description = "Mirza";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
