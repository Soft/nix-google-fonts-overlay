{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arima-madurai-${version}";
  version = "2017-05-23-171355";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/02502c5d02ab5d7198388263cae76fb5d33dfb89/ofl/arimamadurai/ArimaMadurai-Thin.ttf?raw=true";
      name = "ArimaMadurai-Thin.ttf";
      sha256 = "ae33b2d7b434c1a2f058c723c05ecbd5c119f8435b2c574f7e7fc05194604e3e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/02502c5d02ab5d7198388263cae76fb5d33dfb89/ofl/arimamadurai/ArimaMadurai-ExtraLight.ttf?raw=true";
      name = "ArimaMadurai-ExtraLight.ttf";
      sha256 = "88fdf72f0a186b46432b750bef432c6f6d236481e6e9fb6e4d9b4f21676ac9d7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/02502c5d02ab5d7198388263cae76fb5d33dfb89/ofl/arimamadurai/ArimaMadurai-Light.ttf?raw=true";
      name = "ArimaMadurai-Light.ttf";
      sha256 = "05a71b72b898c555098d2157ece9ffd10d8f32c57813c4e877f6528609c2b9d6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/02502c5d02ab5d7198388263cae76fb5d33dfb89/ofl/arimamadurai/ArimaMadurai-Regular.ttf?raw=true";
      name = "ArimaMadurai-Regular.ttf";
      sha256 = "b2ae39bb7374346a97dc4c44212db880c8c3d71b7a30a4e918ce015c923cc0f5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/02502c5d02ab5d7198388263cae76fb5d33dfb89/ofl/arimamadurai/ArimaMadurai-Medium.ttf?raw=true";
      name = "ArimaMadurai-Medium.ttf";
      sha256 = "071429725ca78b8b375068c0b772a930ba725ee6ab33acc1be4f4550d75b3211";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/02502c5d02ab5d7198388263cae76fb5d33dfb89/ofl/arimamadurai/ArimaMadurai-Bold.ttf?raw=true";
      name = "ArimaMadurai-Bold.ttf";
      sha256 = "6e5a4a6db8ebfc6a17e4368cdc8cdb4ff2bc8c7581198befd70f3b01ca72808d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/02502c5d02ab5d7198388263cae76fb5d33dfb89/ofl/arimamadurai/ArimaMadurai-ExtraBold.ttf?raw=true";
      name = "ArimaMadurai-ExtraBold.ttf";
      sha256 = "935002d3da7300db9b7446c906efbaafb1d36420cc3df32a09c7966cd9339647";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/02502c5d02ab5d7198388263cae76fb5d33dfb89/ofl/arimamadurai/ArimaMadurai-Black.ttf?raw=true";
      name = "ArimaMadurai-Black.ttf";
      sha256 = "39acf064d2b6ad2bd624fc18a98ef71eb31db1e16e837008146afd7200634823";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArimaMadurai-Thin.ttf $out/share/fonts/truetype/ArimaMadurai-Thin.ttf
     install -Dm644 ArimaMadurai-ExtraLight.ttf $out/share/fonts/truetype/ArimaMadurai-ExtraLight.ttf
     install -Dm644 ArimaMadurai-Light.ttf $out/share/fonts/truetype/ArimaMadurai-Light.ttf
     install -Dm644 ArimaMadurai-Regular.ttf $out/share/fonts/truetype/ArimaMadurai-Regular.ttf
     install -Dm644 ArimaMadurai-Medium.ttf $out/share/fonts/truetype/ArimaMadurai-Medium.ttf
     install -Dm644 ArimaMadurai-Bold.ttf $out/share/fonts/truetype/ArimaMadurai-Bold.ttf
     install -Dm644 ArimaMadurai-ExtraBold.ttf $out/share/fonts/truetype/ArimaMadurai-ExtraBold.ttf
     install -Dm644 ArimaMadurai-Black.ttf $out/share/fonts/truetype/ArimaMadurai-Black.ttf
  '';

  meta = with lib; {
    description = "Arima Madurai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
