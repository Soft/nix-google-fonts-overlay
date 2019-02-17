{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hanuman-${version}";
  version = "2017-05-08-202601";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e9b45b6a2b5beb64eb7a39cf28b611834ed19e3b/ofl/hanuman/Hanuman-Regular.ttf?raw=true";
      name = "Hanuman-Regular.ttf";
      sha256 = "651fd3f1935bd92704bd401071c37014eeae32485cb3d69c047a59f9725f6bb1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e9b45b6a2b5beb64eb7a39cf28b611834ed19e3b/ofl/hanuman/Hanuman-Bold.ttf?raw=true";
      name = "Hanuman-Bold.ttf";
      sha256 = "937f93569fc4c0676bdfe7c5f7f23d28a75752fb1d20bd6d6572e613322fbbe0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hanuman-Regular.ttf $out/share/fonts/truetype/Hanuman-Regular.ttf
     install -Dm644 Hanuman-Bold.ttf $out/share/fonts/truetype/Hanuman-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hanuman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
