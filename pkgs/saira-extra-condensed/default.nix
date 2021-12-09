{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-extra-condensed-${version}";
  version = "2016-12-06-220634";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-Thin.ttf?raw=true";
      name = "SairaExtraCondensed-Thin.ttf";
      sha256 = "fdf8ede0540521e92cc20d1723030342fa6c75de292832bb04b749cc734f9929";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-ExtraLight.ttf?raw=true";
      name = "SairaExtraCondensed-ExtraLight.ttf";
      sha256 = "c2c87ffbf6580f40e56344a2aaef4c1fc89853b981245797afb923a2a47e2d8a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-Light.ttf?raw=true";
      name = "SairaExtraCondensed-Light.ttf";
      sha256 = "c0084b0e163ec7369938d6e5122d648aa719b902029728da953b78de11845856";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-Regular.ttf?raw=true";
      name = "SairaExtraCondensed-Regular.ttf";
      sha256 = "5e9260f29b5ebaa3230df0937783a1b980d8f285fb4e982bd72e559ce990ec61";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-Medium.ttf?raw=true";
      name = "SairaExtraCondensed-Medium.ttf";
      sha256 = "3573d63198c6b346e8b281a998c3626aae1258e0224d8f46029db924bb7beeba";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-SemiBold.ttf?raw=true";
      name = "SairaExtraCondensed-SemiBold.ttf";
      sha256 = "a0e5bcf41ea6ec93a55de288f4f0db8c01a4c1f126020cd57db147ea6cd3baee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-Bold.ttf?raw=true";
      name = "SairaExtraCondensed-Bold.ttf";
      sha256 = "a185d0eb0320561d364273660ebbaa41d43a537ffb0c2308dbd70edb28911968";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-ExtraBold.ttf?raw=true";
      name = "SairaExtraCondensed-ExtraBold.ttf";
      sha256 = "0e282d00d8036c8a09576e3485b854dfad0fa8b1019dff41712df37cfe102594";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/679bd07fa26e1d0a05dc8d3fb45234564841ca7a/ofl/sairaextracondensed/SairaExtraCondensed-Black.ttf?raw=true";
      name = "SairaExtraCondensed-Black.ttf";
      sha256 = "0cbb12ef1ac0b3bd1ab13f36e1de15ef37a42a3423a9718a8393d8797965888c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SairaExtraCondensed-Thin.ttf $out/share/fonts/truetype/SairaExtraCondensed-Thin.ttf
     install -Dm644 SairaExtraCondensed-ExtraLight.ttf $out/share/fonts/truetype/SairaExtraCondensed-ExtraLight.ttf
     install -Dm644 SairaExtraCondensed-Light.ttf $out/share/fonts/truetype/SairaExtraCondensed-Light.ttf
     install -Dm644 SairaExtraCondensed-Regular.ttf $out/share/fonts/truetype/SairaExtraCondensed-Regular.ttf
     install -Dm644 SairaExtraCondensed-Medium.ttf $out/share/fonts/truetype/SairaExtraCondensed-Medium.ttf
     install -Dm644 SairaExtraCondensed-SemiBold.ttf $out/share/fonts/truetype/SairaExtraCondensed-SemiBold.ttf
     install -Dm644 SairaExtraCondensed-Bold.ttf $out/share/fonts/truetype/SairaExtraCondensed-Bold.ttf
     install -Dm644 SairaExtraCondensed-ExtraBold.ttf $out/share/fonts/truetype/SairaExtraCondensed-ExtraBold.ttf
     install -Dm644 SairaExtraCondensed-Black.ttf $out/share/fonts/truetype/SairaExtraCondensed-Black.ttf
  '';

  meta = with lib; {
    description = "Saira Extra Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
