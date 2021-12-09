{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-semi-expanded-${version}";
  version = "2017-02-07-175235";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-Thin.ttf?raw=true";
      name = "EncodeSansSemiExpanded-Thin.ttf";
      sha256 = "2d62660af2b106f8ff45356d009c4dbc4107c950e5ce3145522b1a1137c3f86a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-ExtraLight.ttf?raw=true";
      name = "EncodeSansSemiExpanded-ExtraLight.ttf";
      sha256 = "ba81657a3d28eb922075b6419ef79b74098f6bf74770797f90e0ce59796a529a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-Light.ttf?raw=true";
      name = "EncodeSansSemiExpanded-Light.ttf";
      sha256 = "ed235d922e0f859ac9cbcd559d0441e32506d44ddae24aea89926e98841f982c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-Regular.ttf?raw=true";
      name = "EncodeSansSemiExpanded-Regular.ttf";
      sha256 = "aa69bcb0adf89d178c82e381ab6b959eca58c861440532cafbcc24e03cdce0ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-Medium.ttf?raw=true";
      name = "EncodeSansSemiExpanded-Medium.ttf";
      sha256 = "ceb8cd76cedec8021892bc46dff129cde6c47ae19cd5d9cf676044ff337b3a98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-SemiBold.ttf?raw=true";
      name = "EncodeSansSemiExpanded-SemiBold.ttf";
      sha256 = "1bc6f3f5aa3db42d4fc37d924f4b22f313a677fd3575fec805fc1169006e3e1f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-Bold.ttf?raw=true";
      name = "EncodeSansSemiExpanded-Bold.ttf";
      sha256 = "388f18cbf0bcc4dcafc916c5f03989be30de3efebab71ef800f36d1f86b65962";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-ExtraBold.ttf?raw=true";
      name = "EncodeSansSemiExpanded-ExtraBold.ttf";
      sha256 = "b50b6596ceb2e5ba62c33b46ba7e6f3a0a8cc7cf2b491f01bfa4ee30aa177a85";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b72acc6d6cbf82d2d7b5d431bcc5c673be18e412/ofl/encodesanssemiexpanded/EncodeSansSemiExpanded-Black.ttf?raw=true";
      name = "EncodeSansSemiExpanded-Black.ttf";
      sha256 = "5ccf895878db2154b4a21def75594258e89e7122d05134d56cd37981ea22ff8f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EncodeSansSemiExpanded-Thin.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-Thin.ttf
     install -Dm644 EncodeSansSemiExpanded-ExtraLight.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-ExtraLight.ttf
     install -Dm644 EncodeSansSemiExpanded-Light.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-Light.ttf
     install -Dm644 EncodeSansSemiExpanded-Regular.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-Regular.ttf
     install -Dm644 EncodeSansSemiExpanded-Medium.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-Medium.ttf
     install -Dm644 EncodeSansSemiExpanded-SemiBold.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-SemiBold.ttf
     install -Dm644 EncodeSansSemiExpanded-Bold.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-Bold.ttf
     install -Dm644 EncodeSansSemiExpanded-ExtraBold.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-ExtraBold.ttf
     install -Dm644 EncodeSansSemiExpanded-Black.ttf $out/share/fonts/truetype/EncodeSansSemiExpanded-Black.ttf
  '';

  meta = with lib; {
    description = "Encode Sans Semi Expanded";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
