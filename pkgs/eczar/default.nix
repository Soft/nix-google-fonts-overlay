{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "eczar-${version}";
  version = "2017-05-08-201923";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e721cb064ba2a4a3556a6e971a03ab15a8a7a653/ofl/eczar/Eczar-Regular.ttf?raw=true";
      name = "Eczar-Regular.ttf";
      sha256 = "3ae654bfefbfe0f5853d6dadd88f902007d373c2912a0f1132b87038fcbb0040";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e721cb064ba2a4a3556a6e971a03ab15a8a7a653/ofl/eczar/Eczar-Medium.ttf?raw=true";
      name = "Eczar-Medium.ttf";
      sha256 = "7a69028531c965022146cdacfb6ec8bb65f4104e4b6cf6807c618abc05d0e11a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e721cb064ba2a4a3556a6e971a03ab15a8a7a653/ofl/eczar/Eczar-SemiBold.ttf?raw=true";
      name = "Eczar-SemiBold.ttf";
      sha256 = "0bc829913e2d0b8cc6f03bef620ef724eb9e3d80868d7a2f2da2cbf33781d1ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e721cb064ba2a4a3556a6e971a03ab15a8a7a653/ofl/eczar/Eczar-Bold.ttf?raw=true";
      name = "Eczar-Bold.ttf";
      sha256 = "b2dcae3bc2192ac9cf92f9a33ca6ab41984eefa074329ae0a6056670faa1c0d8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e721cb064ba2a4a3556a6e971a03ab15a8a7a653/ofl/eczar/Eczar-ExtraBold.ttf?raw=true";
      name = "Eczar-ExtraBold.ttf";
      sha256 = "f06fd2a6d1b89c8593ef88f62a43796bfaac1b89f648364b00f721b22c371fae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Eczar-Regular.ttf $out/share/fonts/truetype/Eczar-Regular.ttf
     install -Dm644 Eczar-Medium.ttf $out/share/fonts/truetype/Eczar-Medium.ttf
     install -Dm644 Eczar-SemiBold.ttf $out/share/fonts/truetype/Eczar-SemiBold.ttf
     install -Dm644 Eczar-Bold.ttf $out/share/fonts/truetype/Eczar-Bold.ttf
     install -Dm644 Eczar-ExtraBold.ttf $out/share/fonts/truetype/Eczar-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Eczar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
