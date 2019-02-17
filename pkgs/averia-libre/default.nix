{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "averia-libre-${version}";
  version = "2017-08-07-195747";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc10731b16209081550c9c83815997d365b2fcd5/ofl/averialibre/AveriaLibre-Light.ttf?raw=true";
      name = "AveriaLibre-Light.ttf";
      sha256 = "b74d2b2dadfe7bf27abf1f25bb1b324504e52d8f6452ebb34a5672fbce12ff05";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc10731b16209081550c9c83815997d365b2fcd5/ofl/averialibre/AveriaLibre-LightItalic.ttf?raw=true";
      name = "AveriaLibre-LightItalic.ttf";
      sha256 = "34871b14abcea6cb9dcee65ab635be65d08b0f825cd88d70a44ed5217bb9a524";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc10731b16209081550c9c83815997d365b2fcd5/ofl/averialibre/AveriaLibre-Regular.ttf?raw=true";
      name = "AveriaLibre-Regular.ttf";
      sha256 = "3dda695e06012f89b39eaccd77fbbcf22133a17b00ce5ddf3e4e9a996546b865";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc10731b16209081550c9c83815997d365b2fcd5/ofl/averialibre/AveriaLibre-Italic.ttf?raw=true";
      name = "AveriaLibre-Italic.ttf";
      sha256 = "5e5b4d33f0911fd1a2d23d2096533933f131dd258f8c3196e1695e64256a7202";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc10731b16209081550c9c83815997d365b2fcd5/ofl/averialibre/AveriaLibre-Bold.ttf?raw=true";
      name = "AveriaLibre-Bold.ttf";
      sha256 = "374f67a2b8b8c7e45a543ec6558e03437e8c6a4450cc724a5d70cae89aba679d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc10731b16209081550c9c83815997d365b2fcd5/ofl/averialibre/AveriaLibre-BoldItalic.ttf?raw=true";
      name = "AveriaLibre-BoldItalic.ttf";
      sha256 = "9a13370078d6be2c07778d2b03eee2e172aefc640c45327316a9ebf5c50d41a9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AveriaLibre-Light.ttf $out/share/fonts/truetype/AveriaLibre-Light.ttf
     install -Dm644 AveriaLibre-LightItalic.ttf $out/share/fonts/truetype/AveriaLibre-LightItalic.ttf
     install -Dm644 AveriaLibre-Regular.ttf $out/share/fonts/truetype/AveriaLibre-Regular.ttf
     install -Dm644 AveriaLibre-Italic.ttf $out/share/fonts/truetype/AveriaLibre-Italic.ttf
     install -Dm644 AveriaLibre-Bold.ttf $out/share/fonts/truetype/AveriaLibre-Bold.ttf
     install -Dm644 AveriaLibre-BoldItalic.ttf $out/share/fonts/truetype/AveriaLibre-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Averia Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
