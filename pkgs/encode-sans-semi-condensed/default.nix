{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-semi-condensed-${version}";
  version = "2017-02-07-175223";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-Thin.ttf?raw=true";
      name = "EncodeSansSemiCondensed-Thin.ttf";
      sha256 = "545db9aaaa86fc3051c286606a1a4355843de613d047895c19ef0af2800ae876";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-ExtraLight.ttf?raw=true";
      name = "EncodeSansSemiCondensed-ExtraLight.ttf";
      sha256 = "5f8c83276aaf0ae7ed873fb90fc466edbaa506f0e78e2cf601a305c39c2fe7cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-Light.ttf?raw=true";
      name = "EncodeSansSemiCondensed-Light.ttf";
      sha256 = "3266992ee0ca1960d3164a7b55f7a6b9783b5e8eb1c2b02af34ac3bd9173d833";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-Regular.ttf?raw=true";
      name = "EncodeSansSemiCondensed-Regular.ttf";
      sha256 = "a1b3ebf1d84017c4136870b6b8323f0ee055a22a9a9e49e58d9e26b67b0ef866";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-Medium.ttf?raw=true";
      name = "EncodeSansSemiCondensed-Medium.ttf";
      sha256 = "5b68f1f10caf92d76281a14ff5b058fa7a5cc81a90956751b2da353f913dcc64";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-SemiBold.ttf?raw=true";
      name = "EncodeSansSemiCondensed-SemiBold.ttf";
      sha256 = "f939e954819679898b15e4a7f6badc1e96949541e5c28efbfe5b02ad8b21b75a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-Bold.ttf?raw=true";
      name = "EncodeSansSemiCondensed-Bold.ttf";
      sha256 = "0a5b8d0dd5e3d9abb688b2b60e441f3acef5bd3d744f87315346d034df0b5fbf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-ExtraBold.ttf?raw=true";
      name = "EncodeSansSemiCondensed-ExtraBold.ttf";
      sha256 = "5d82c48dba9adef6c193dc91b626343cafd2c44fa3c40bc7e2140f332b59e427";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e6ebfc0361c8863bbee76d3ba617c60c6f17b29/ofl/encodesanssemicondensed/EncodeSansSemiCondensed-Black.ttf?raw=true";
      name = "EncodeSansSemiCondensed-Black.ttf";
      sha256 = "f9ba441d3677c10090e15ad4b1d60a0825c43028fa892c76c3d10a2b4fdde57c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EncodeSansSemiCondensed-Thin.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-Thin.ttf
     install -Dm644 EncodeSansSemiCondensed-ExtraLight.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-ExtraLight.ttf
     install -Dm644 EncodeSansSemiCondensed-Light.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-Light.ttf
     install -Dm644 EncodeSansSemiCondensed-Regular.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-Regular.ttf
     install -Dm644 EncodeSansSemiCondensed-Medium.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-Medium.ttf
     install -Dm644 EncodeSansSemiCondensed-SemiBold.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-SemiBold.ttf
     install -Dm644 EncodeSansSemiCondensed-Bold.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-Bold.ttf
     install -Dm644 EncodeSansSemiCondensed-ExtraBold.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-ExtraBold.ttf
     install -Dm644 EncodeSansSemiCondensed-Black.ttf $out/share/fonts/truetype/EncodeSansSemiCondensed-Black.ttf
  '';

  meta = with lib; {
    description = "Encode Sans Semi Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
