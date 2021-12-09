{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sansita-${version}";
  version = "2016-12-06-220634";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0ca11aa5f31345fc8edcce5f7e7c113d6a396fb0/ofl/sansita/Sansita-Regular.ttf?raw=true";
      name = "Sansita-Regular.ttf";
      sha256 = "1b25171a67a8fb26972f8bdabe31ed3ccd37db4ea8f7d817fc37d572024208ad";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0ca11aa5f31345fc8edcce5f7e7c113d6a396fb0/ofl/sansita/Sansita-Italic.ttf?raw=true";
      name = "Sansita-Italic.ttf";
      sha256 = "10bd5c614aa8d17e7ee27a788342b835bcb355d14a49bdc19d6edf7ecdd94858";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0ca11aa5f31345fc8edcce5f7e7c113d6a396fb0/ofl/sansita/Sansita-Bold.ttf?raw=true";
      name = "Sansita-Bold.ttf";
      sha256 = "03d70e42bdc01c1cfb43da0a54ddf21e6f768ddbbc7cbf86134bcdbc2a860174";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0ca11aa5f31345fc8edcce5f7e7c113d6a396fb0/ofl/sansita/Sansita-BoldItalic.ttf?raw=true";
      name = "Sansita-BoldItalic.ttf";
      sha256 = "bd35f8c971731bcbc963b76e9db4511e7cd9e5b8a30acd94a8cd6d106204f3ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0ca11aa5f31345fc8edcce5f7e7c113d6a396fb0/ofl/sansita/Sansita-ExtraBold.ttf?raw=true";
      name = "Sansita-ExtraBold.ttf";
      sha256 = "f513fd5f5c45f47572e17d849affd3e488676fa48472817dc38069b820403480";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0ca11aa5f31345fc8edcce5f7e7c113d6a396fb0/ofl/sansita/Sansita-ExtraBoldItalic.ttf?raw=true";
      name = "Sansita-ExtraBoldItalic.ttf";
      sha256 = "f4a9f1ad4126507a4d7f33875afd5fc79912e64a58af03657939528a59ced503";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0ca11aa5f31345fc8edcce5f7e7c113d6a396fb0/ofl/sansita/Sansita-Black.ttf?raw=true";
      name = "Sansita-Black.ttf";
      sha256 = "392e7979b1667704c2ed9aebf3fbf014c1f927a372ab31fd05b19b291dc4d24b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0ca11aa5f31345fc8edcce5f7e7c113d6a396fb0/ofl/sansita/Sansita-BlackItalic.ttf?raw=true";
      name = "Sansita-BlackItalic.ttf";
      sha256 = "e537293697dcb4905ad05a90cbe5cabc352ccdd31d54ef70b0927ea51b919925";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sansita-Regular.ttf $out/share/fonts/truetype/Sansita-Regular.ttf
     install -Dm644 Sansita-Italic.ttf $out/share/fonts/truetype/Sansita-Italic.ttf
     install -Dm644 Sansita-Bold.ttf $out/share/fonts/truetype/Sansita-Bold.ttf
     install -Dm644 Sansita-BoldItalic.ttf $out/share/fonts/truetype/Sansita-BoldItalic.ttf
     install -Dm644 Sansita-ExtraBold.ttf $out/share/fonts/truetype/Sansita-ExtraBold.ttf
     install -Dm644 Sansita-ExtraBoldItalic.ttf $out/share/fonts/truetype/Sansita-ExtraBoldItalic.ttf
     install -Dm644 Sansita-Black.ttf $out/share/fonts/truetype/Sansita-Black.ttf
     install -Dm644 Sansita-BlackItalic.ttf $out/share/fonts/truetype/Sansita-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Sansita";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
