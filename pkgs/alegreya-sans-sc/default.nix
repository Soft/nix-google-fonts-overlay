{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alegreya-sans-sc-${version}";
  version = "2017-10-31-200530";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-Thin.ttf?raw=true";
      name = "AlegreyaSansSC-Thin.ttf";
      sha256 = "14b8df3d295d6a67b28a31249f43f4f891eb91cf5bdd3d40820b322673cc071a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-ThinItalic.ttf?raw=true";
      name = "AlegreyaSansSC-ThinItalic.ttf";
      sha256 = "92c0ecbc1f3d52774f557b09a9cda4fa4e363e93e2f7f7bb9831abf7f63d18f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-Light.ttf?raw=true";
      name = "AlegreyaSansSC-Light.ttf";
      sha256 = "64088b83af22b58e945f56c494e39fffd9b4565ed2bddbbd849963ae2bdda4e3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-LightItalic.ttf?raw=true";
      name = "AlegreyaSansSC-LightItalic.ttf";
      sha256 = "430978829be347c7b30ebe2520d15110a35a7d0a38408aae4a5ad692aa625b91";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-Regular.ttf?raw=true";
      name = "AlegreyaSansSC-Regular.ttf";
      sha256 = "0c5d4abcdd83af0ce9f5d4ca49f226c2b3030d2a83adf92cb5a5c2638c8e68b0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-Italic.ttf?raw=true";
      name = "AlegreyaSansSC-Italic.ttf";
      sha256 = "f5e231dd870cfcb172a90e4e5686690a59d7f30280fab8a6e89e309fc03f5e06";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-Medium.ttf?raw=true";
      name = "AlegreyaSansSC-Medium.ttf";
      sha256 = "532c7dc4bc0fe8109d2c5f17829d9985597aacb86e8001023e045d4ee00f356a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-MediumItalic.ttf?raw=true";
      name = "AlegreyaSansSC-MediumItalic.ttf";
      sha256 = "bb3373b80b8803a047760415ea515faa0924db6336512653bc32b2ac3d7f71ce";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-Bold.ttf?raw=true";
      name = "AlegreyaSansSC-Bold.ttf";
      sha256 = "1f7f1ca33c4ae013a94d374106fd4044820b3d915e7f7a22182ddaf49b9c7912";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-BoldItalic.ttf?raw=true";
      name = "AlegreyaSansSC-BoldItalic.ttf";
      sha256 = "66e79aa70b8375bac7df4acb0545c4b790347ce724546eaf049527323e4d4cdb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-ExtraBold.ttf?raw=true";
      name = "AlegreyaSansSC-ExtraBold.ttf";
      sha256 = "f9e72a3ca819c1a087824c95f830ca9fa56a367d72078db5e57e62e7e0917a93";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-ExtraBoldItalic.ttf?raw=true";
      name = "AlegreyaSansSC-ExtraBoldItalic.ttf";
      sha256 = "b6275ac5e89e14f8cce5fb34571a5bc44a4ed6070ff209b25f70c038e70e4634";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-Black.ttf?raw=true";
      name = "AlegreyaSansSC-Black.ttf";
      sha256 = "786209b83189e790f95094a24f991537d8cef5b985ecef986be33b88bafded96";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e974a60e8278f045db8e341817dbc61abf6158e/ofl/alegreyasanssc/AlegreyaSansSC-BlackItalic.ttf?raw=true";
      name = "AlegreyaSansSC-BlackItalic.ttf";
      sha256 = "2fce60ff17e99d1be4bf3f010d71b129e632d047db248b9f92fb2fd1364c04a5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlegreyaSansSC-Thin.ttf $out/share/fonts/truetype/AlegreyaSansSC-Thin.ttf
     install -Dm644 AlegreyaSansSC-ThinItalic.ttf $out/share/fonts/truetype/AlegreyaSansSC-ThinItalic.ttf
     install -Dm644 AlegreyaSansSC-Light.ttf $out/share/fonts/truetype/AlegreyaSansSC-Light.ttf
     install -Dm644 AlegreyaSansSC-LightItalic.ttf $out/share/fonts/truetype/AlegreyaSansSC-LightItalic.ttf
     install -Dm644 AlegreyaSansSC-Regular.ttf $out/share/fonts/truetype/AlegreyaSansSC-Regular.ttf
     install -Dm644 AlegreyaSansSC-Italic.ttf $out/share/fonts/truetype/AlegreyaSansSC-Italic.ttf
     install -Dm644 AlegreyaSansSC-Medium.ttf $out/share/fonts/truetype/AlegreyaSansSC-Medium.ttf
     install -Dm644 AlegreyaSansSC-MediumItalic.ttf $out/share/fonts/truetype/AlegreyaSansSC-MediumItalic.ttf
     install -Dm644 AlegreyaSansSC-Bold.ttf $out/share/fonts/truetype/AlegreyaSansSC-Bold.ttf
     install -Dm644 AlegreyaSansSC-BoldItalic.ttf $out/share/fonts/truetype/AlegreyaSansSC-BoldItalic.ttf
     install -Dm644 AlegreyaSansSC-ExtraBold.ttf $out/share/fonts/truetype/AlegreyaSansSC-ExtraBold.ttf
     install -Dm644 AlegreyaSansSC-ExtraBoldItalic.ttf $out/share/fonts/truetype/AlegreyaSansSC-ExtraBoldItalic.ttf
     install -Dm644 AlegreyaSansSC-Black.ttf $out/share/fonts/truetype/AlegreyaSansSC-Black.ttf
     install -Dm644 AlegreyaSansSC-BlackItalic.ttf $out/share/fonts/truetype/AlegreyaSansSC-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Alegreya Sans SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
