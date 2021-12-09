{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-condensed-${version}";
  version = "2017-02-07-175246";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-Thin.ttf?raw=true";
      name = "EncodeSansCondensed-Thin.ttf";
      sha256 = "9f2177944414af43f7bea15c7d76869200b33c121e3333d20f403b934fcc3656";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-ExtraLight.ttf?raw=true";
      name = "EncodeSansCondensed-ExtraLight.ttf";
      sha256 = "de2d21c3c8e01db05bb9b291f774b09fc316f7a1727fa2404ef47d8fe35aa063";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-Light.ttf?raw=true";
      name = "EncodeSansCondensed-Light.ttf";
      sha256 = "3bbdaddd877bcba865cd90a0927cdde1281e144e2e302ce8667ba24f15f21923";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-Regular.ttf?raw=true";
      name = "EncodeSansCondensed-Regular.ttf";
      sha256 = "768d969127953c8a2e7d756a7735c7f803e08a3f86be60dcad77bafff3711788";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-Medium.ttf?raw=true";
      name = "EncodeSansCondensed-Medium.ttf";
      sha256 = "ae5721464a60c9747f7f5f8f2d824575dd1cfa6372905ba90d1fd48ef1e81987";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-SemiBold.ttf?raw=true";
      name = "EncodeSansCondensed-SemiBold.ttf";
      sha256 = "264adc117bfc4b6100b2a87fefeb8fb71d86ae9dac0c94a453b19602bbcb51b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-Bold.ttf?raw=true";
      name = "EncodeSansCondensed-Bold.ttf";
      sha256 = "a6896b28cc8e16fe8d1073c766127a07a9c89cc8f4df9ffac376a41ff4050b5f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-ExtraBold.ttf?raw=true";
      name = "EncodeSansCondensed-ExtraBold.ttf";
      sha256 = "d11153aa2eb89d00fb65a63fbb59a660681d0669e93cf5597a044aed913da4b0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2789b442616ea2950d014fb9b4b8e23f67b7fed4/ofl/encodesanscondensed/EncodeSansCondensed-Black.ttf?raw=true";
      name = "EncodeSansCondensed-Black.ttf";
      sha256 = "35c44453630af2b355120b73285f42d1ab9cc4e2aa0cf9211c1bf60109184053";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EncodeSansCondensed-Thin.ttf $out/share/fonts/truetype/EncodeSansCondensed-Thin.ttf
     install -Dm644 EncodeSansCondensed-ExtraLight.ttf $out/share/fonts/truetype/EncodeSansCondensed-ExtraLight.ttf
     install -Dm644 EncodeSansCondensed-Light.ttf $out/share/fonts/truetype/EncodeSansCondensed-Light.ttf
     install -Dm644 EncodeSansCondensed-Regular.ttf $out/share/fonts/truetype/EncodeSansCondensed-Regular.ttf
     install -Dm644 EncodeSansCondensed-Medium.ttf $out/share/fonts/truetype/EncodeSansCondensed-Medium.ttf
     install -Dm644 EncodeSansCondensed-SemiBold.ttf $out/share/fonts/truetype/EncodeSansCondensed-SemiBold.ttf
     install -Dm644 EncodeSansCondensed-Bold.ttf $out/share/fonts/truetype/EncodeSansCondensed-Bold.ttf
     install -Dm644 EncodeSansCondensed-ExtraBold.ttf $out/share/fonts/truetype/EncodeSansCondensed-ExtraBold.ttf
     install -Dm644 EncodeSansCondensed-Black.ttf $out/share/fonts/truetype/EncodeSansCondensed-Black.ttf
  '';

  meta = with lib; {
    description = "Encode Sans Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
