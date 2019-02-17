{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-kochi-${version}";
  version = "2016-01-15-173120";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8fe6e7c51cf8f664af18fdb3df64400e319000ea/ofl/hindkochi/HindKochi-Light.ttf?raw=true";
      name = "HindKochi-Light.ttf";
      sha256 = "ab814d88fc60652e9675d92358d64c12ef5216032009b38d4b66ae4aba33b801";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8fe6e7c51cf8f664af18fdb3df64400e319000ea/ofl/hindkochi/HindKochi-Regular.ttf?raw=true";
      name = "HindKochi-Regular.ttf";
      sha256 = "be4ef5af5157c64ab86a758580f9cc41ade446c256fd15070800eb8fcfcdc639";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8fe6e7c51cf8f664af18fdb3df64400e319000ea/ofl/hindkochi/HindKochi-Medium.ttf?raw=true";
      name = "HindKochi-Medium.ttf";
      sha256 = "3c59b6ec6023c9e4b4e3473a0b006ce32cc1521ca38e35c618e1231eafcd4de5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8fe6e7c51cf8f664af18fdb3df64400e319000ea/ofl/hindkochi/HindKochi-SemiBold.ttf?raw=true";
      name = "HindKochi-SemiBold.ttf";
      sha256 = "58e6cbe26b7082018c55bc728c4056913d23cfbd7dd9d9147ba8ae219ac424bf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8fe6e7c51cf8f664af18fdb3df64400e319000ea/ofl/hindkochi/HindKochi-Bold.ttf?raw=true";
      name = "HindKochi-Bold.ttf";
      sha256 = "0015eaed80482e33b9cf4c18941e3250915ca5b8bed428b8b0f9d952496f3726";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindKochi-Light.ttf $out/share/fonts/truetype/HindKochi-Light.ttf
     install -Dm644 HindKochi-Regular.ttf $out/share/fonts/truetype/HindKochi-Regular.ttf
     install -Dm644 HindKochi-Medium.ttf $out/share/fonts/truetype/HindKochi-Medium.ttf
     install -Dm644 HindKochi-SemiBold.ttf $out/share/fonts/truetype/HindKochi-SemiBold.ttf
     install -Dm644 HindKochi-Bold.ttf $out/share/fonts/truetype/HindKochi-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hind Kochi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
