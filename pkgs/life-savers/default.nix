{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "life-savers-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lifesavers/LifeSavers-Regular.ttf?raw=true";
      name = "LifeSavers-Regular.ttf";
      sha256 = "a8e392e51087f222fe5f009095e7c31150f2d8a588c32483af17084690ef9b7d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lifesavers/LifeSavers-Bold.ttf?raw=true";
      name = "LifeSavers-Bold.ttf";
      sha256 = "5e349bd05d25bbf43a459c343f339f8b08d1c0c267e3434e6f754eb7b7a649eb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lifesavers/LifeSavers-ExtraBold.ttf?raw=true";
      name = "LifeSavers-ExtraBold.ttf";
      sha256 = "b26f5dc2d7352c216ff6e6ee7234cdcc89439adc0323063b9298e2bf800c2ee3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LifeSavers-Regular.ttf $out/share/fonts/truetype/LifeSavers-Regular.ttf
     install -Dm644 LifeSavers-Bold.ttf $out/share/fonts/truetype/LifeSavers-Bold.ttf
     install -Dm644 LifeSavers-ExtraBold.ttf $out/share/fonts/truetype/LifeSavers-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Life Savers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
