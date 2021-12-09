{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "donegal-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/donegalone/DonegalOne-Regular.ttf?raw=true";
      name = "DonegalOne-Regular.ttf";
      sha256 = "1f9b07bbaf3813103281848f782fae74499f5dfc3b3b9f4e90ebea4aa42fbc75";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DonegalOne-Regular.ttf $out/share/fonts/truetype/DonegalOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Donegal One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
