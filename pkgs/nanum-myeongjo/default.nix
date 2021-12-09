{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nanum-myeongjo-${version}";
  version = "2018-03-13-211247";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/nanummyeongjo/NanumMyeongjo-Regular.ttf?raw=true";
      name = "NanumMyeongjo-Regular.ttf";
      sha256 = "42e62ca26e86f476797f92aa854ea7a66f5638a05873b4cddcf77ca239845270";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/245b697e303885b8b8373d75459623eee23259fb/ofl/nanummyeongjo/NanumMyeongjo-Bold.ttf?raw=true";
      name = "NanumMyeongjo-Bold.ttf";
      sha256 = "8c5e0c90a2d6511f3f326d2f0dc31adbbc8f26e1093668bdf00a6991fe80b238";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/245b697e303885b8b8373d75459623eee23259fb/ofl/nanummyeongjo/NanumMyeongjo-ExtraBold.ttf?raw=true";
      name = "NanumMyeongjo-ExtraBold.ttf";
      sha256 = "7081925ba6eb268e25fb8891855ee673b4ffc4d9cecb52c4cd3e0d90ef646d9e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NanumMyeongjo-Regular.ttf $out/share/fonts/truetype/NanumMyeongjo-Regular.ttf
     install -Dm644 NanumMyeongjo-Bold.ttf $out/share/fonts/truetype/NanumMyeongjo-Bold.ttf
     install -Dm644 NanumMyeongjo-ExtraBold.ttf $out/share/fonts/truetype/NanumMyeongjo-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Nanum Myeongjo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
