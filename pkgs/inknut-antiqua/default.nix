{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inknut-antiqua-${version}";
  version = "2017-05-08-202623";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/afd76e905c2869bd18142b45cac747638af45170/ofl/inknutantiqua/InknutAntiqua-Light.ttf?raw=true";
      name = "InknutAntiqua-Light.ttf";
      sha256 = "b6a2ff96a4a36383a21ffc9eaf01a30649428f280a252e856a6c4cf4ee435467";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/afd76e905c2869bd18142b45cac747638af45170/ofl/inknutantiqua/InknutAntiqua-Regular.ttf?raw=true";
      name = "InknutAntiqua-Regular.ttf";
      sha256 = "d73f0ab0d5502420c3b596a1a9e9971840f722959904a35a211eee48b018a160";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/afd76e905c2869bd18142b45cac747638af45170/ofl/inknutantiqua/InknutAntiqua-Medium.ttf?raw=true";
      name = "InknutAntiqua-Medium.ttf";
      sha256 = "5365b0a85a65b1144041e1a6caad8b373029ae675bca8cde715f3c4733aa1068";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/afd76e905c2869bd18142b45cac747638af45170/ofl/inknutantiqua/InknutAntiqua-SemiBold.ttf?raw=true";
      name = "InknutAntiqua-SemiBold.ttf";
      sha256 = "0f3f9927a09f166eb23a473613a844bd2b8cd008b97ca5af67993b71a0392c2f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/afd76e905c2869bd18142b45cac747638af45170/ofl/inknutantiqua/InknutAntiqua-Bold.ttf?raw=true";
      name = "InknutAntiqua-Bold.ttf";
      sha256 = "0d000d49dbeed476a1993c97c36fd72ae32a8bc92441af941e6f4b001ff33d84";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/afd76e905c2869bd18142b45cac747638af45170/ofl/inknutantiqua/InknutAntiqua-ExtraBold.ttf?raw=true";
      name = "InknutAntiqua-ExtraBold.ttf";
      sha256 = "9ed65bafdc3f19afea4f3668a3ff2e01ed1912cc6fb7c678d2443bd97c6d58f7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/afd76e905c2869bd18142b45cac747638af45170/ofl/inknutantiqua/InknutAntiqua-Black.ttf?raw=true";
      name = "InknutAntiqua-Black.ttf";
      sha256 = "6d3b10f0006bd9ce031ffa7d522c2134ff40cbd89942881ff576bbf6f3e6b9b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 InknutAntiqua-Light.ttf $out/share/fonts/truetype/InknutAntiqua-Light.ttf
     install -Dm644 InknutAntiqua-Regular.ttf $out/share/fonts/truetype/InknutAntiqua-Regular.ttf
     install -Dm644 InknutAntiqua-Medium.ttf $out/share/fonts/truetype/InknutAntiqua-Medium.ttf
     install -Dm644 InknutAntiqua-SemiBold.ttf $out/share/fonts/truetype/InknutAntiqua-SemiBold.ttf
     install -Dm644 InknutAntiqua-Bold.ttf $out/share/fonts/truetype/InknutAntiqua-Bold.ttf
     install -Dm644 InknutAntiqua-ExtraBold.ttf $out/share/fonts/truetype/InknutAntiqua-ExtraBold.ttf
     install -Dm644 InknutAntiqua-Black.ttf $out/share/fonts/truetype/InknutAntiqua-Black.ttf
  '';

  meta = with lib; {
    description = "Inknut Antiqua";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
