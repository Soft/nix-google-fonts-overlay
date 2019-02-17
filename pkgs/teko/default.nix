{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "teko-${version}";
  version = "2017-05-09-191355";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0839c0359a262dbaaaf2b4a88d20473dbc81dad9/ofl/teko/Teko-Light.ttf?raw=true";
      name = "Teko-Light.ttf";
      sha256 = "c343e7bb862486808708eaa2c0191c780ee5804e0bf582424a267b9b7e279a3b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0839c0359a262dbaaaf2b4a88d20473dbc81dad9/ofl/teko/Teko-Regular.ttf?raw=true";
      name = "Teko-Regular.ttf";
      sha256 = "33c5b67e9e49294b22be78611a1e1048efcecf4a9ef97ea0c7bce0c853cdd0b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0839c0359a262dbaaaf2b4a88d20473dbc81dad9/ofl/teko/Teko-Medium.ttf?raw=true";
      name = "Teko-Medium.ttf";
      sha256 = "20fabbd59967020f9331eacba39c873eac85988b50216a56acd50c2bfbdf1958";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0839c0359a262dbaaaf2b4a88d20473dbc81dad9/ofl/teko/Teko-SemiBold.ttf?raw=true";
      name = "Teko-SemiBold.ttf";
      sha256 = "ae36e2c2da7cf43f8de9ada73423338669c119886e3be22987adf15cae355607";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0839c0359a262dbaaaf2b4a88d20473dbc81dad9/ofl/teko/Teko-Bold.ttf?raw=true";
      name = "Teko-Bold.ttf";
      sha256 = "59792b165cc69531ab87304792c4021f68271b24fb38660b965e84a0caa64e65";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Teko-Light.ttf $out/share/fonts/truetype/Teko-Light.ttf
     install -Dm644 Teko-Regular.ttf $out/share/fonts/truetype/Teko-Regular.ttf
     install -Dm644 Teko-Medium.ttf $out/share/fonts/truetype/Teko-Medium.ttf
     install -Dm644 Teko-SemiBold.ttf $out/share/fonts/truetype/Teko-SemiBold.ttf
     install -Dm644 Teko-Bold.ttf $out/share/fonts/truetype/Teko-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Teko";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
