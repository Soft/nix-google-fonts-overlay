{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sarpanch-${version}";
  version = "2017-05-09-185149";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bd4414a4108aae7dfc7e6ac4a15ea5ea55b43b1d/ofl/sarpanch/Sarpanch-Regular.ttf?raw=true";
      name = "Sarpanch-Regular.ttf";
      sha256 = "2828287b0825b08c7b2cbba15779fd8b3b85c1907df8b9a987f08848cd6947f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bd4414a4108aae7dfc7e6ac4a15ea5ea55b43b1d/ofl/sarpanch/Sarpanch-Medium.ttf?raw=true";
      name = "Sarpanch-Medium.ttf";
      sha256 = "9f1ab5f1ba96df5a968c5f7f02bbb560b1af1bdd92bba8a33ef09384cc41b7be";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bd4414a4108aae7dfc7e6ac4a15ea5ea55b43b1d/ofl/sarpanch/Sarpanch-SemiBold.ttf?raw=true";
      name = "Sarpanch-SemiBold.ttf";
      sha256 = "ced773bc2a7597ec1a5145ffce6dfacec076255204cf02f1303907a82c6102f2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bd4414a4108aae7dfc7e6ac4a15ea5ea55b43b1d/ofl/sarpanch/Sarpanch-Bold.ttf?raw=true";
      name = "Sarpanch-Bold.ttf";
      sha256 = "c23f96c15d1d075b339bb7a5ede342591d1389924331464b98584865d88c8ebf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bd4414a4108aae7dfc7e6ac4a15ea5ea55b43b1d/ofl/sarpanch/Sarpanch-ExtraBold.ttf?raw=true";
      name = "Sarpanch-ExtraBold.ttf";
      sha256 = "5ffb125033d467fafd79e8b13dc11fa88c3ce317840d6042afb56d3bb94dc32b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bd4414a4108aae7dfc7e6ac4a15ea5ea55b43b1d/ofl/sarpanch/Sarpanch-Black.ttf?raw=true";
      name = "Sarpanch-Black.ttf";
      sha256 = "a1e1f81adb8404de57803bcd42096ec6702bf85bfb9524049f03f26cfcf4f771";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sarpanch-Regular.ttf $out/share/fonts/truetype/Sarpanch-Regular.ttf
     install -Dm644 Sarpanch-Medium.ttf $out/share/fonts/truetype/Sarpanch-Medium.ttf
     install -Dm644 Sarpanch-SemiBold.ttf $out/share/fonts/truetype/Sarpanch-SemiBold.ttf
     install -Dm644 Sarpanch-Bold.ttf $out/share/fonts/truetype/Sarpanch-Bold.ttf
     install -Dm644 Sarpanch-ExtraBold.ttf $out/share/fonts/truetype/Sarpanch-ExtraBold.ttf
     install -Dm644 Sarpanch-Black.ttf $out/share/fonts/truetype/Sarpanch-Black.ttf
  '';

  meta = with lib; {
    description = "Sarpanch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
