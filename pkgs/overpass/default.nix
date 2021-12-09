{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "overpass-${version}";
  version = "2016-12-02-171425";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-Thin.ttf?raw=true";
      name = "Overpass-Thin.ttf";
      sha256 = "1136591f100f809010f071d5ddf77106f5e2c16e1d5eec28c63acca521f29486";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-ThinItalic.ttf?raw=true";
      name = "Overpass-ThinItalic.ttf";
      sha256 = "cb1100c83d0992644f92db2848943563236a6fa17dd19e01ce231c4e3d887a21";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-ExtraLight.ttf?raw=true";
      name = "Overpass-ExtraLight.ttf";
      sha256 = "d7498ba0eb3de0eef173ef9f5d8512a4ab2becfe6066ed296259bb3cedbf0f72";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-ExtraLightItalic.ttf?raw=true";
      name = "Overpass-ExtraLightItalic.ttf";
      sha256 = "7f9ae4f81e4cf759cbfcf40d6254ca5f29e60cd4377697c857491355c8bc4df9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-Light.ttf?raw=true";
      name = "Overpass-Light.ttf";
      sha256 = "943b98201305124c7bd811a6cc07c4469e026b228cb8fcaaeccbca54158c6a66";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-LightItalic.ttf?raw=true";
      name = "Overpass-LightItalic.ttf";
      sha256 = "3611d49b8121f9f3a9fb2b5eedd44f9483b0eb348fe9713faddff239a3c05303";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-Regular.ttf?raw=true";
      name = "Overpass-Regular.ttf";
      sha256 = "bcac000c9cbe8e83e69d54b8cf0e264d0f08f3f223ae9ce05e26adf8bac77676";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-Italic.ttf?raw=true";
      name = "Overpass-Italic.ttf";
      sha256 = "56c7302b0028a29120ff170e5c448671d8b3c35f1a4ce9bf01ad873d5a85d094";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-SemiBold.ttf?raw=true";
      name = "Overpass-SemiBold.ttf";
      sha256 = "c4ab3d29a69964c0a71eb4c25223f05b6d97516752e9f9942c9d4d7c8b6d5c07";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-SemiBoldItalic.ttf?raw=true";
      name = "Overpass-SemiBoldItalic.ttf";
      sha256 = "c680ad86791419c5af4a658fcf16e6c9efc665c3a871389d1da018e4caf1396d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-Bold.ttf?raw=true";
      name = "Overpass-Bold.ttf";
      sha256 = "f14034796433e6fadc6b4c795318beaa6c7c1425e40400128d800cdbf816e2ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-BoldItalic.ttf?raw=true";
      name = "Overpass-BoldItalic.ttf";
      sha256 = "3c575c297468dafa63fcc2599ec47852b2648f9c23a2308eb0c936e098398948";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-ExtraBold.ttf?raw=true";
      name = "Overpass-ExtraBold.ttf";
      sha256 = "97082e42e84ce52d1c9f4abf185fa73be2cdc4dd737188d517938e85aefc8e53";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-ExtraBoldItalic.ttf?raw=true";
      name = "Overpass-ExtraBoldItalic.ttf";
      sha256 = "86f31218fa0b77c618c9b81b0ad39e9be384c71063c709d7fdfe520462039e68";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-Black.ttf?raw=true";
      name = "Overpass-Black.ttf";
      sha256 = "5383dddb8ad859c3a135d77a86a4223708b59dd4ff58015d1e29fc95bf9e6c8a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6366850e68e79d5cfa1eb3947858f72d5511fa1e/ofl/overpass/Overpass-BlackItalic.ttf?raw=true";
      name = "Overpass-BlackItalic.ttf";
      sha256 = "c008db525c97effb20e6a56efb311956a3bd069d656e7013b4a47e9588a9c63f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Overpass-Thin.ttf $out/share/fonts/truetype/Overpass-Thin.ttf
     install -Dm644 Overpass-ThinItalic.ttf $out/share/fonts/truetype/Overpass-ThinItalic.ttf
     install -Dm644 Overpass-ExtraLight.ttf $out/share/fonts/truetype/Overpass-ExtraLight.ttf
     install -Dm644 Overpass-ExtraLightItalic.ttf $out/share/fonts/truetype/Overpass-ExtraLightItalic.ttf
     install -Dm644 Overpass-Light.ttf $out/share/fonts/truetype/Overpass-Light.ttf
     install -Dm644 Overpass-LightItalic.ttf $out/share/fonts/truetype/Overpass-LightItalic.ttf
     install -Dm644 Overpass-Regular.ttf $out/share/fonts/truetype/Overpass-Regular.ttf
     install -Dm644 Overpass-Italic.ttf $out/share/fonts/truetype/Overpass-Italic.ttf
     install -Dm644 Overpass-SemiBold.ttf $out/share/fonts/truetype/Overpass-SemiBold.ttf
     install -Dm644 Overpass-SemiBoldItalic.ttf $out/share/fonts/truetype/Overpass-SemiBoldItalic.ttf
     install -Dm644 Overpass-Bold.ttf $out/share/fonts/truetype/Overpass-Bold.ttf
     install -Dm644 Overpass-BoldItalic.ttf $out/share/fonts/truetype/Overpass-BoldItalic.ttf
     install -Dm644 Overpass-ExtraBold.ttf $out/share/fonts/truetype/Overpass-ExtraBold.ttf
     install -Dm644 Overpass-ExtraBoldItalic.ttf $out/share/fonts/truetype/Overpass-ExtraBoldItalic.ttf
     install -Dm644 Overpass-Black.ttf $out/share/fonts/truetype/Overpass-Black.ttf
     install -Dm644 Overpass-BlackItalic.ttf $out/share/fonts/truetype/Overpass-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Overpass";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
