{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "frank-ruhl-libre-${version}";
  version = "2017-08-07-211104";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0538aa296779ae372155c620b0032d8d8d1c6126/ofl/frankruhllibre/FrankRuhlLibre-Light.ttf?raw=true";
      name = "FrankRuhlLibre-Light.ttf";
      sha256 = "03903d080d94100f9e2bdfe7dece643273e964dd6c1b3b0f82036991b0b9e423";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0538aa296779ae372155c620b0032d8d8d1c6126/ofl/frankruhllibre/FrankRuhlLibre-Regular.ttf?raw=true";
      name = "FrankRuhlLibre-Regular.ttf";
      sha256 = "d661f4cef5e806a835d8defbc42309a1e128246bc294710115d927bf26e34ece";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0538aa296779ae372155c620b0032d8d8d1c6126/ofl/frankruhllibre/FrankRuhlLibre-Medium.ttf?raw=true";
      name = "FrankRuhlLibre-Medium.ttf";
      sha256 = "6e618096b0e009f9c7083668d05aec922064d8cde24901c89a81868d63c8b179";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0538aa296779ae372155c620b0032d8d8d1c6126/ofl/frankruhllibre/FrankRuhlLibre-Bold.ttf?raw=true";
      name = "FrankRuhlLibre-Bold.ttf";
      sha256 = "ff15b9c23bd0a38b3ef7e18b6529111113ad317ff4ae98d4c633e9b8a5b57f67";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0538aa296779ae372155c620b0032d8d8d1c6126/ofl/frankruhllibre/FrankRuhlLibre-Black.ttf?raw=true";
      name = "FrankRuhlLibre-Black.ttf";
      sha256 = "44fa408284b133c1d23de87e9de8ab929e592d98c991bca0b9f1be68b45e213c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FrankRuhlLibre-Light.ttf $out/share/fonts/truetype/FrankRuhlLibre-Light.ttf
     install -Dm644 FrankRuhlLibre-Regular.ttf $out/share/fonts/truetype/FrankRuhlLibre-Regular.ttf
     install -Dm644 FrankRuhlLibre-Medium.ttf $out/share/fonts/truetype/FrankRuhlLibre-Medium.ttf
     install -Dm644 FrankRuhlLibre-Bold.ttf $out/share/fonts/truetype/FrankRuhlLibre-Bold.ttf
     install -Dm644 FrankRuhlLibre-Black.ttf $out/share/fonts/truetype/FrankRuhlLibre-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Frank Ruhl Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
