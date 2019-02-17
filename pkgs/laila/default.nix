{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "laila-${version}";
  version = "2017-05-16-005212";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfb13f7423dc513a8ef0d50cf3692e08334eb770/ofl/laila/Laila-Light.ttf?raw=true";
      name = "Laila-Light.ttf";
      sha256 = "53e37dfb3b1d5a979a8506264df6c6ef3538fe9cf25035d1705f71053b27e863";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfb13f7423dc513a8ef0d50cf3692e08334eb770/ofl/laila/Laila-Regular.ttf?raw=true";
      name = "Laila-Regular.ttf";
      sha256 = "f2a4a3f9ac8d8d5e340050fa3f42618e2e6da0adebcf8389a8fa6febbced31f2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfb13f7423dc513a8ef0d50cf3692e08334eb770/ofl/laila/Laila-Medium.ttf?raw=true";
      name = "Laila-Medium.ttf";
      sha256 = "ceab0829c5281aa7f6e8196ee6b8052c7cd6227dd36e5e41336e4c7dd61b5f33";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d774fc0799fdeddbd8720616a6d2d791be29fafa/ofl/laila/Laila-SemiBold.ttf?raw=true";
      name = "Laila-SemiBold.ttf";
      sha256 = "df916fbc664bbf3e25702b30fe0d94712217e09468ef875e43e4e183e719ab66";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfb13f7423dc513a8ef0d50cf3692e08334eb770/ofl/laila/Laila-Bold.ttf?raw=true";
      name = "Laila-Bold.ttf";
      sha256 = "3b50aae09041e0941e4309ba1cbc4bacd858f8852b5e76e240157ae6e7da87b3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Laila-Light.ttf $out/share/fonts/truetype/Laila-Light.ttf
     install -Dm644 Laila-Regular.ttf $out/share/fonts/truetype/Laila-Regular.ttf
     install -Dm644 Laila-Medium.ttf $out/share/fonts/truetype/Laila-Medium.ttf
     install -Dm644 Laila-SemiBold.ttf $out/share/fonts/truetype/Laila-SemiBold.ttf
     install -Dm644 Laila-Bold.ttf $out/share/fonts/truetype/Laila-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Laila";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
