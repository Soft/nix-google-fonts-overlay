{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fira-sans-extra-condensed-${version}";
  version = "2016-12-06-185145";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-Thin.ttf?raw=true";
      name = "FiraSansExtraCondensed-Thin.ttf";
      sha256 = "f978b751ded3e71c9d0a90b992adce21d19302744def16b9cc4b0bb4af76d1e5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-ThinItalic.ttf?raw=true";
      name = "FiraSansExtraCondensed-ThinItalic.ttf";
      sha256 = "bcb35a0e984a24dea2db51495b725af99253dbc9087811aec4b850532e9176d5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-ExtraLight.ttf?raw=true";
      name = "FiraSansExtraCondensed-ExtraLight.ttf";
      sha256 = "de6c39406d47dfe9a0439acb4e30ed4abef3a7e038222e6940d43000292e8cc7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-ExtraLightItalic.ttf?raw=true";
      name = "FiraSansExtraCondensed-ExtraLightItalic.ttf";
      sha256 = "b622420322624f283b8ecfb7ff9686cfa5f8ca191bceb421009ecea8aa84a62f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-Light.ttf?raw=true";
      name = "FiraSansExtraCondensed-Light.ttf";
      sha256 = "1ceb377344ff1f91a10ab1a3ecc97606adec33391f34d515850cca5abea55290";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-LightItalic.ttf?raw=true";
      name = "FiraSansExtraCondensed-LightItalic.ttf";
      sha256 = "142f55c1a46efa9925f81e93349b992f20b0f1973ba33c83c0663573afad88e5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-Regular.ttf?raw=true";
      name = "FiraSansExtraCondensed-Regular.ttf";
      sha256 = "51f01985ca8dc740b951afd3d21478cc51cb1d8546136643c3b031a74add5479";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-Italic.ttf?raw=true";
      name = "FiraSansExtraCondensed-Italic.ttf";
      sha256 = "088f1c48c502447c9d5c17f70f8096fe9e48074011c3500f9be2c75f2b0a9b47";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-Medium.ttf?raw=true";
      name = "FiraSansExtraCondensed-Medium.ttf";
      sha256 = "d1b3612452391dd580966d724c5dd602a23955e33b466c22020dcbd47837ee22";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-MediumItalic.ttf?raw=true";
      name = "FiraSansExtraCondensed-MediumItalic.ttf";
      sha256 = "c7ca21914a6ec284e464ea3f8bbc717464ed954d6f474956f4d3e44ee2328c89";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-SemiBold.ttf?raw=true";
      name = "FiraSansExtraCondensed-SemiBold.ttf";
      sha256 = "54fc425c016631fbaa1ae2aa1f59f53e46e9c3805fa1df5a217613d8b6228ec7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-SemiBoldItalic.ttf?raw=true";
      name = "FiraSansExtraCondensed-SemiBoldItalic.ttf";
      sha256 = "bfd59e8ee7913a2c01e5e971d1bcc52322aace188b63b6e5b9f6e92b231b9bd8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-Bold.ttf?raw=true";
      name = "FiraSansExtraCondensed-Bold.ttf";
      sha256 = "3e385cfbd93c8a924ac4b33b0f33a39dd49c3919dffa2f661091a3f21cc4150e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-BoldItalic.ttf?raw=true";
      name = "FiraSansExtraCondensed-BoldItalic.ttf";
      sha256 = "037c729bd61f851f2ea7addfb2d7c3d40cef2ad18b133ef74f56916d4574c5f5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-ExtraBold.ttf?raw=true";
      name = "FiraSansExtraCondensed-ExtraBold.ttf";
      sha256 = "056cad28b3697bf0a093eb49e55d02e873b1de1eb4ed64467c8c80b10c6750e9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-ExtraBoldItalic.ttf?raw=true";
      name = "FiraSansExtraCondensed-ExtraBoldItalic.ttf";
      sha256 = "10ad497da09e30352585fafaffa5f032a055d28767d28dc326cd531d80b2f920";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-Black.ttf?raw=true";
      name = "FiraSansExtraCondensed-Black.ttf";
      sha256 = "9792878489db97d068aaf115cab50bdadd1e843274ff51b3786ca8102ba16a87";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8eaa3ebfc21d9c4b7d830a84ce7ba2f16eec1e1/ofl/firasansextracondensed/FiraSansExtraCondensed-BlackItalic.ttf?raw=true";
      name = "FiraSansExtraCondensed-BlackItalic.ttf";
      sha256 = "9ca866c1aff106aeb850e22dc1541ea35c0cf6862b25869a452a833fe6821fb1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FiraSansExtraCondensed-Thin.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-Thin.ttf
     install -Dm644 FiraSansExtraCondensed-ThinItalic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-ThinItalic.ttf
     install -Dm644 FiraSansExtraCondensed-ExtraLight.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-ExtraLight.ttf
     install -Dm644 FiraSansExtraCondensed-ExtraLightItalic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-ExtraLightItalic.ttf
     install -Dm644 FiraSansExtraCondensed-Light.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-Light.ttf
     install -Dm644 FiraSansExtraCondensed-LightItalic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-LightItalic.ttf
     install -Dm644 FiraSansExtraCondensed-Regular.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-Regular.ttf
     install -Dm644 FiraSansExtraCondensed-Italic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-Italic.ttf
     install -Dm644 FiraSansExtraCondensed-Medium.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-Medium.ttf
     install -Dm644 FiraSansExtraCondensed-MediumItalic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-MediumItalic.ttf
     install -Dm644 FiraSansExtraCondensed-SemiBold.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-SemiBold.ttf
     install -Dm644 FiraSansExtraCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-SemiBoldItalic.ttf
     install -Dm644 FiraSansExtraCondensed-Bold.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-Bold.ttf
     install -Dm644 FiraSansExtraCondensed-BoldItalic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-BoldItalic.ttf
     install -Dm644 FiraSansExtraCondensed-ExtraBold.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-ExtraBold.ttf
     install -Dm644 FiraSansExtraCondensed-ExtraBoldItalic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-ExtraBoldItalic.ttf
     install -Dm644 FiraSansExtraCondensed-Black.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-Black.ttf
     install -Dm644 FiraSansExtraCondensed-BlackItalic.ttf $out/share/fonts/truetype/FiraSansExtraCondensed-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Fira Sans Extra Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
