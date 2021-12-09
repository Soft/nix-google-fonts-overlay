{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kalam-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fe561d9c7f9c635d086bd13ac9ee6557e3375cca/ofl/kalam/Kalam-Light.ttf?raw=true";
      name = "Kalam-Light.ttf";
      sha256 = "2b8f2c0208d397a1823688783da3317d6af18ea007a9a1b56ddb17e27820507e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fe561d9c7f9c635d086bd13ac9ee6557e3375cca/ofl/kalam/Kalam-Regular.ttf?raw=true";
      name = "Kalam-Regular.ttf";
      sha256 = "57cecb63d4608019371954274ae1d8c397764debd5b19d4a33c1efa4dc923c0b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fe561d9c7f9c635d086bd13ac9ee6557e3375cca/ofl/kalam/Kalam-Bold.ttf?raw=true";
      name = "Kalam-Bold.ttf";
      sha256 = "2f6576601db015d4f6c08678120277fc8510b98c06e932ce7a6a9cbff4cbdded";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kalam-Light.ttf $out/share/fonts/truetype/Kalam-Light.ttf
     install -Dm644 Kalam-Regular.ttf $out/share/fonts/truetype/Kalam-Regular.ttf
     install -Dm644 Kalam-Bold.ttf $out/share/fonts/truetype/Kalam-Bold.ttf
  '';

  meta = with lib; {
    description = "Kalam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
