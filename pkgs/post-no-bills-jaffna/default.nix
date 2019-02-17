{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "post-no-bills-jaffna-${version}";
  version = "2017-02-17-185437";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dccad0049890ea0e2aa3db1da0dfd3df4fbd2182/ofl/postnobillsjaffna/PostNoBillsJaffna-Light.ttf?raw=true";
      name = "PostNoBillsJaffna-Light.ttf";
      sha256 = "12c5145bee9afcf1448b6787b8e9b0b2b2c9839c0510847f9e76f29ca4bc103c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dccad0049890ea0e2aa3db1da0dfd3df4fbd2182/ofl/postnobillsjaffna/PostNoBillsJaffna-Regular.ttf?raw=true";
      name = "PostNoBillsJaffna-Regular.ttf";
      sha256 = "2819b71b4b5aa3ccefe4241cdacac7c2e3c7851423cc946b3006362e68cae540";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dccad0049890ea0e2aa3db1da0dfd3df4fbd2182/ofl/postnobillsjaffna/PostNoBillsJaffna-Medium.ttf?raw=true";
      name = "PostNoBillsJaffna-Medium.ttf";
      sha256 = "67cd7a8db2b283dc6ba7b3471a57575ce6a2c9ec2c04d29127d1fcc165ce9804";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dccad0049890ea0e2aa3db1da0dfd3df4fbd2182/ofl/postnobillsjaffna/PostNoBillsJaffna-SemiBold.ttf?raw=true";
      name = "PostNoBillsJaffna-SemiBold.ttf";
      sha256 = "e68daa1128d81ace3af0b705390d5c6f5eaf60ca80527458f6ff297477253baf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dccad0049890ea0e2aa3db1da0dfd3df4fbd2182/ofl/postnobillsjaffna/PostNoBillsJaffna-Bold.ttf?raw=true";
      name = "PostNoBillsJaffna-Bold.ttf";
      sha256 = "99086f900b2c5115616aaf3ef5e0c6a0c283ce70cd8713228a0c3d845341527d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dccad0049890ea0e2aa3db1da0dfd3df4fbd2182/ofl/postnobillsjaffna/PostNoBillsJaffna-ExtraBold.ttf?raw=true";
      name = "PostNoBillsJaffna-ExtraBold.ttf";
      sha256 = "9df50682021bf1014f2c233edcb964b080be1fcd2aa2570334b935d643aca9a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PostNoBillsJaffna-Light.ttf $out/share/fonts/truetype/PostNoBillsJaffna-Light.ttf
     install -Dm644 PostNoBillsJaffna-Regular.ttf $out/share/fonts/truetype/PostNoBillsJaffna-Regular.ttf
     install -Dm644 PostNoBillsJaffna-Medium.ttf $out/share/fonts/truetype/PostNoBillsJaffna-Medium.ttf
     install -Dm644 PostNoBillsJaffna-SemiBold.ttf $out/share/fonts/truetype/PostNoBillsJaffna-SemiBold.ttf
     install -Dm644 PostNoBillsJaffna-Bold.ttf $out/share/fonts/truetype/PostNoBillsJaffna-Bold.ttf
     install -Dm644 PostNoBillsJaffna-ExtraBold.ttf $out/share/fonts/truetype/PostNoBillsJaffna-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Post No Bills Jaffna";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
