{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "niramit-${version}";
  version = "2018-09-30-185035";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-ExtraLight.ttf?raw=true";
      name = "Niramit-ExtraLight.ttf";
      sha256 = "3e3000d2c03a0922282785b16b2fe747bb3599d37281ef3ae3bc500de722f8f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-ExtraLightItalic.ttf?raw=true";
      name = "Niramit-ExtraLightItalic.ttf";
      sha256 = "bf8df5b484521f573ddf745345ed038dcf7bc40a021177d0d11d04c98a4cdf96";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-Light.ttf?raw=true";
      name = "Niramit-Light.ttf";
      sha256 = "8377d35d330aa20db2f60c96c7c190215bbf543fa2755a2a3ac9ef34dff0ff9e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-LightItalic.ttf?raw=true";
      name = "Niramit-LightItalic.ttf";
      sha256 = "a94c0512966e89ca2d4efe596d504389bfab862d018ca9a230fc29dcad2b5791";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-Regular.ttf?raw=true";
      name = "Niramit-Regular.ttf";
      sha256 = "04148fad64b055f6a062604c983be26409bfd3e4e1390279288a4eb839909ce0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-Italic.ttf?raw=true";
      name = "Niramit-Italic.ttf";
      sha256 = "f452832218722dc74160b6b17822b26029dbb1f9d388ceaf2a758581a51373e8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-Medium.ttf?raw=true";
      name = "Niramit-Medium.ttf";
      sha256 = "3d081b3dd75de218493d2d7b8aa2079beaaa841ecf92015b870519e1f239fa56";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-MediumItalic.ttf?raw=true";
      name = "Niramit-MediumItalic.ttf";
      sha256 = "dac47a23ba915b18661510c0a17fed53544cf1beeef6b7bf8d6992ea2055449d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-SemiBold.ttf?raw=true";
      name = "Niramit-SemiBold.ttf";
      sha256 = "b37c5e9d01592e3c1d8e381917fe6e2e96aabfa1064cd05e4f1b3ad349ee8e7c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-SemiBoldItalic.ttf?raw=true";
      name = "Niramit-SemiBoldItalic.ttf";
      sha256 = "ba4009ff541aec471256e2a8e8f4933525d520dc98df05fe6fc832eff84a686f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-Bold.ttf?raw=true";
      name = "Niramit-Bold.ttf";
      sha256 = "2ec7ae17137a0ba06017675e38280289a6716a6f6dc6ac210f0b54b2563eac64";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec092d93766dc28fb19b1bb4cb97c3189aad7b52/ofl/niramit/Niramit-BoldItalic.ttf?raw=true";
      name = "Niramit-BoldItalic.ttf";
      sha256 = "58cb12e37eecdd59076b5fff00fd70f22347e3bbd5088f5a7d0b8f7e2a83d5f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Niramit-ExtraLight.ttf $out/share/fonts/truetype/Niramit-ExtraLight.ttf
     install -Dm644 Niramit-ExtraLightItalic.ttf $out/share/fonts/truetype/Niramit-ExtraLightItalic.ttf
     install -Dm644 Niramit-Light.ttf $out/share/fonts/truetype/Niramit-Light.ttf
     install -Dm644 Niramit-LightItalic.ttf $out/share/fonts/truetype/Niramit-LightItalic.ttf
     install -Dm644 Niramit-Regular.ttf $out/share/fonts/truetype/Niramit-Regular.ttf
     install -Dm644 Niramit-Italic.ttf $out/share/fonts/truetype/Niramit-Italic.ttf
     install -Dm644 Niramit-Medium.ttf $out/share/fonts/truetype/Niramit-Medium.ttf
     install -Dm644 Niramit-MediumItalic.ttf $out/share/fonts/truetype/Niramit-MediumItalic.ttf
     install -Dm644 Niramit-SemiBold.ttf $out/share/fonts/truetype/Niramit-SemiBold.ttf
     install -Dm644 Niramit-SemiBoldItalic.ttf $out/share/fonts/truetype/Niramit-SemiBoldItalic.ttf
     install -Dm644 Niramit-Bold.ttf $out/share/fonts/truetype/Niramit-Bold.ttf
     install -Dm644 Niramit-BoldItalic.ttf $out/share/fonts/truetype/Niramit-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Niramit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
