{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "el-messiri-${version}";
  version = "2017-05-23-170716";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afdb7c421648bf38610b16badcf9fc88dc9ae40/ofl/elmessiri/ElMessiri-Regular.ttf?raw=true";
      name = "ElMessiri-Regular.ttf";
      sha256 = "c174ea26d5ba48e5d2937487aa9da02f63496142b8f26252826472b4354cf5ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afdb7c421648bf38610b16badcf9fc88dc9ae40/ofl/elmessiri/ElMessiri-Medium.ttf?raw=true";
      name = "ElMessiri-Medium.ttf";
      sha256 = "e768636f25ea98a38bb98566a3dd1835ed090b7175b19cde19e0bfcc82ae4475";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afdb7c421648bf38610b16badcf9fc88dc9ae40/ofl/elmessiri/ElMessiri-SemiBold.ttf?raw=true";
      name = "ElMessiri-SemiBold.ttf";
      sha256 = "f3befc50863f7f2da5247f6d7e640640d58b1a0f756e2d738adfb87d22c53ccc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afdb7c421648bf38610b16badcf9fc88dc9ae40/ofl/elmessiri/ElMessiri-Bold.ttf?raw=true";
      name = "ElMessiri-Bold.ttf";
      sha256 = "ac3aeac3c45ba3839d71adbec40f170b53e9497aba8ab7086d94d44d8ecc928c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ElMessiri-Regular.ttf $out/share/fonts/truetype/ElMessiri-Regular.ttf
     install -Dm644 ElMessiri-Medium.ttf $out/share/fonts/truetype/ElMessiri-Medium.ttf
     install -Dm644 ElMessiri-SemiBold.ttf $out/share/fonts/truetype/ElMessiri-SemiBold.ttf
     install -Dm644 ElMessiri-Bold.ttf $out/share/fonts/truetype/ElMessiri-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "El Messiri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
