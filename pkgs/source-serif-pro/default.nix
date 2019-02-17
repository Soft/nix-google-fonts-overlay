{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-serif-pro-${version}";
  version = "2017-01-25-142259";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a61b1e3dbd07f99d3e5c213ea9c068ad5e0fb6dc/ofl/sourceserifpro/SourceSerifPro-ExtraLight.ttf?raw=true";
      name = "SourceSerifPro-ExtraLight.ttf";
      sha256 = "3e4c569c6f653e6f901d760aa20b84942e395b7def7b24609904c03403ca2e15";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a61b1e3dbd07f99d3e5c213ea9c068ad5e0fb6dc/ofl/sourceserifpro/SourceSerifPro-Light.ttf?raw=true";
      name = "SourceSerifPro-Light.ttf";
      sha256 = "9e2c5d18a099a87e0196ff38742eccd20d95bb06216c6fa118fcd2976296ad77";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a61b1e3dbd07f99d3e5c213ea9c068ad5e0fb6dc/ofl/sourceserifpro/SourceSerifPro-Regular.ttf?raw=true";
      name = "SourceSerifPro-Regular.ttf";
      sha256 = "8a38530cac2dfe79a01db2edb44717288d1045224a452def3ccff1b4ff159679";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/41892e2bd2f8eb3f108c1cceb320afc5d9566344/ofl/sourceserifpro/SourceSerifPro-SemiBold.ttf?raw=true";
      name = "SourceSerifPro-SemiBold.ttf";
      sha256 = "9ef80417d2b26e51b47b634baea2d6df2ee2b27fb36486ba64e9c88017fe8c2b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a61b1e3dbd07f99d3e5c213ea9c068ad5e0fb6dc/ofl/sourceserifpro/SourceSerifPro-Bold.ttf?raw=true";
      name = "SourceSerifPro-Bold.ttf";
      sha256 = "3e72cdb4f4056f5b44546cae509d5732babbcae8e06b82943ab9108a8df9984c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a61b1e3dbd07f99d3e5c213ea9c068ad5e0fb6dc/ofl/sourceserifpro/SourceSerifPro-Black.ttf?raw=true";
      name = "SourceSerifPro-Black.ttf";
      sha256 = "bec9e14a4e39ad6fcdd81c757c0e5fdeff42d9086888bb484057d741288d892f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourceSerifPro-ExtraLight.ttf $out/share/fonts/truetype/SourceSerifPro-ExtraLight.ttf
     install -Dm644 SourceSerifPro-Light.ttf $out/share/fonts/truetype/SourceSerifPro-Light.ttf
     install -Dm644 SourceSerifPro-Regular.ttf $out/share/fonts/truetype/SourceSerifPro-Regular.ttf
     install -Dm644 SourceSerifPro-SemiBold.ttf $out/share/fonts/truetype/SourceSerifPro-SemiBold.ttf
     install -Dm644 SourceSerifPro-Bold.ttf $out/share/fonts/truetype/SourceSerifPro-Bold.ttf
     install -Dm644 SourceSerifPro-Black.ttf $out/share/fonts/truetype/SourceSerifPro-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Source Serif Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
