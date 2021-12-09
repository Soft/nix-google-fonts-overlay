{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-upright-${version}";
  version = "2017-01-23-170610";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76d8bd2265dc7647a3475868398ece8e725806d8/ofl/cormorantupright/CormorantUpright-Light.ttf?raw=true";
      name = "CormorantUpright-Light.ttf";
      sha256 = "4623b17bf69369940e1b2114a2a81e5802710cb3ca84b1b8121fb95d8f53b4f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76d8bd2265dc7647a3475868398ece8e725806d8/ofl/cormorantupright/CormorantUpright-Regular.ttf?raw=true";
      name = "CormorantUpright-Regular.ttf";
      sha256 = "69d6fea133a07cfdeae0e928141822317dc5a4521e568af32dc4edc7456bc1d5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76d8bd2265dc7647a3475868398ece8e725806d8/ofl/cormorantupright/CormorantUpright-Medium.ttf?raw=true";
      name = "CormorantUpright-Medium.ttf";
      sha256 = "d79318204a87bf31f7513fe7f61dd1bfeb88aa90f7fd419622d4a50ef85bafc2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76d8bd2265dc7647a3475868398ece8e725806d8/ofl/cormorantupright/CormorantUpright-SemiBold.ttf?raw=true";
      name = "CormorantUpright-SemiBold.ttf";
      sha256 = "585e9106c433f1b4cc5d023103305123d92741526a7e27e9ff8a1f5befcc90e6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76d8bd2265dc7647a3475868398ece8e725806d8/ofl/cormorantupright/CormorantUpright-Bold.ttf?raw=true";
      name = "CormorantUpright-Bold.ttf";
      sha256 = "4b691441a35a78ec69490c046596f3b326235e3a3f88a56d3b288b4f2844aa6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantUpright-Light.ttf $out/share/fonts/truetype/CormorantUpright-Light.ttf
     install -Dm644 CormorantUpright-Regular.ttf $out/share/fonts/truetype/CormorantUpright-Regular.ttf
     install -Dm644 CormorantUpright-Medium.ttf $out/share/fonts/truetype/CormorantUpright-Medium.ttf
     install -Dm644 CormorantUpright-SemiBold.ttf $out/share/fonts/truetype/CormorantUpright-SemiBold.ttf
     install -Dm644 CormorantUpright-Bold.ttf $out/share/fonts/truetype/CormorantUpright-Bold.ttf
  '';

  meta = with lib; {
    description = "Cormorant Upright";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
