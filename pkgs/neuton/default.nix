{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "neuton-${version}";
  version = "2016-12-02-172937";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94c47cb41d0489ddc92b5274dfa28b422ad38aa4/ofl/neuton/Neuton-ExtraLight.ttf?raw=true";
      name = "Neuton-ExtraLight.ttf";
      sha256 = "0dde410696b33f5546bf3975cecce5d00810dc367fb9d62c4e8c4deda6c84eb6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94c47cb41d0489ddc92b5274dfa28b422ad38aa4/ofl/neuton/Neuton-Light.ttf?raw=true";
      name = "Neuton-Light.ttf";
      sha256 = "055582e4bafdb13759e9f9bfc0b88d64c57c395c414b2c1e452866ccd1f5ef9d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94c47cb41d0489ddc92b5274dfa28b422ad38aa4/ofl/neuton/Neuton-Regular.ttf?raw=true";
      name = "Neuton-Regular.ttf";
      sha256 = "28ae41fd0ff18925c1a829358b7bd334e27994da23d6abdd72eaff646cacadb6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94c47cb41d0489ddc92b5274dfa28b422ad38aa4/ofl/neuton/Neuton-Italic.ttf?raw=true";
      name = "Neuton-Italic.ttf";
      sha256 = "b5c66a502ed69b489300887b7019923e79925f90f1bed92cebbc398ec54b5199";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94c47cb41d0489ddc92b5274dfa28b422ad38aa4/ofl/neuton/Neuton-Bold.ttf?raw=true";
      name = "Neuton-Bold.ttf";
      sha256 = "6e9594b4efae7508d434acd863e0c5fd22502ee76798e72a2e79a94a4255fa74";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94c47cb41d0489ddc92b5274dfa28b422ad38aa4/ofl/neuton/Neuton-ExtraBold.ttf?raw=true";
      name = "Neuton-ExtraBold.ttf";
      sha256 = "5b590903d739180edbca3c20363466358824e7ce34895829a53495ed91122a65";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Neuton-ExtraLight.ttf $out/share/fonts/truetype/Neuton-ExtraLight.ttf
     install -Dm644 Neuton-Light.ttf $out/share/fonts/truetype/Neuton-Light.ttf
     install -Dm644 Neuton-Regular.ttf $out/share/fonts/truetype/Neuton-Regular.ttf
     install -Dm644 Neuton-Italic.ttf $out/share/fonts/truetype/Neuton-Italic.ttf
     install -Dm644 Neuton-Bold.ttf $out/share/fonts/truetype/Neuton-Bold.ttf
     install -Dm644 Neuton-ExtraBold.ttf $out/share/fonts/truetype/Neuton-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Neuton";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
