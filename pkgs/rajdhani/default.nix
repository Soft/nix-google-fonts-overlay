{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rajdhani-${version}";
  version = "2017-05-16-003510";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d1ce2fc3c335cca32b6db00c19f55d57b0a68fe/ofl/rajdhani/Rajdhani-Light.ttf?raw=true";
      name = "Rajdhani-Light.ttf";
      sha256 = "140e9f13af69538161c5780fcf7f81594c069aea887e7bffd417ae1c641213c3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d1ce2fc3c335cca32b6db00c19f55d57b0a68fe/ofl/rajdhani/Rajdhani-Regular.ttf?raw=true";
      name = "Rajdhani-Regular.ttf";
      sha256 = "6e1fc228a8318251a6e569502ec57bac1e4656c582f92f59ccecc4688e039b98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d1ce2fc3c335cca32b6db00c19f55d57b0a68fe/ofl/rajdhani/Rajdhani-Medium.ttf?raw=true";
      name = "Rajdhani-Medium.ttf";
      sha256 = "12ff7dcfe4c206e3875ac53b1762eab57de6a2fa7f5a86c26b97b88d6591eac2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d1ce2fc3c335cca32b6db00c19f55d57b0a68fe/ofl/rajdhani/Rajdhani-SemiBold.ttf?raw=true";
      name = "Rajdhani-SemiBold.ttf";
      sha256 = "94bbd25a18ca665999feb05a537de9fd2b860dcfb78bbe9ca00270825bf235da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d1ce2fc3c335cca32b6db00c19f55d57b0a68fe/ofl/rajdhani/Rajdhani-Bold.ttf?raw=true";
      name = "Rajdhani-Bold.ttf";
      sha256 = "691470dd3286a14e9677940d0bf75796179841ba5215cbda1a2c8910a3226afd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rajdhani-Light.ttf $out/share/fonts/truetype/Rajdhani-Light.ttf
     install -Dm644 Rajdhani-Regular.ttf $out/share/fonts/truetype/Rajdhani-Regular.ttf
     install -Dm644 Rajdhani-Medium.ttf $out/share/fonts/truetype/Rajdhani-Medium.ttf
     install -Dm644 Rajdhani-SemiBold.ttf $out/share/fonts/truetype/Rajdhani-SemiBold.ttf
     install -Dm644 Rajdhani-Bold.ttf $out/share/fonts/truetype/Rajdhani-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rajdhani";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
