{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nunito-${version}";
  version = "2017-02-17-184222";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-ExtraLight.ttf?raw=true";
      name = "Nunito-ExtraLight.ttf";
      sha256 = "6fea515044623ab263877b2ffbeca8e91e3a31a3b64c4bca0805d435e7c62c61";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-ExtraLightItalic.ttf?raw=true";
      name = "Nunito-ExtraLightItalic.ttf";
      sha256 = "a16f628500bac0cf46b9d4dfc2b158bf467d5a93d19086ba473b61ebcc0845b2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-Light.ttf?raw=true";
      name = "Nunito-Light.ttf";
      sha256 = "9a719d574ea01bffb7feff7da97050910e486c4880e44186ddb8d278b48c0267";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-LightItalic.ttf?raw=true";
      name = "Nunito-LightItalic.ttf";
      sha256 = "44c000e3b82abf79ad576609e0cd1cbc7699f1ef87f4ac295a4ef0e9c48eefc5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-Regular.ttf?raw=true";
      name = "Nunito-Regular.ttf";
      sha256 = "9d958cf411edb1b4a0ae3d9a62e7e9d23124ac6d30402aff4d9dc8ea8cd7beee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-Italic.ttf?raw=true";
      name = "Nunito-Italic.ttf";
      sha256 = "b3a1d95b94b2fe6e4c4d72049d4d7da8d73e76f187166f636dc6b2ea32da2012";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-SemiBold.ttf?raw=true";
      name = "Nunito-SemiBold.ttf";
      sha256 = "c01f8ea857d7f02729f45c77d721c7e7200c975dd4c88bacec153fc4f8d21dbd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-SemiBoldItalic.ttf?raw=true";
      name = "Nunito-SemiBoldItalic.ttf";
      sha256 = "5c10362cb41a03724410ade000810bf5682b58319b83f6aea42d31aa61069f42";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-Bold.ttf?raw=true";
      name = "Nunito-Bold.ttf";
      sha256 = "0a2c124569bc97b3f088e4fd22423b68c45df5bd85c88e5aa80c5c2f2cf99405";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-BoldItalic.ttf?raw=true";
      name = "Nunito-BoldItalic.ttf";
      sha256 = "d7dec3fffe08fb7c8cb4c1d971eea13408d2f6bda2f332c493d829a130e129bb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-ExtraBold.ttf?raw=true";
      name = "Nunito-ExtraBold.ttf";
      sha256 = "e6bdd0440e28c0bd08a9ef7c31dd9aa81d680db03278919804e2ba8ea2a8c465";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-ExtraBoldItalic.ttf?raw=true";
      name = "Nunito-ExtraBoldItalic.ttf";
      sha256 = "f8acfd0ceb521d366932f290dfe7882874d231bcd0b589eac724bfee0dfffb3b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-Black.ttf?raw=true";
      name = "Nunito-Black.ttf";
      sha256 = "055805e22a7efc737c3a0a4bc0423ac30b95f82acfef507b8af840a1ba877592";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/933df38730df8e7a99d5ba1cf5071b26b7894910/ofl/nunito/Nunito-BlackItalic.ttf?raw=true";
      name = "Nunito-BlackItalic.ttf";
      sha256 = "45600ed3245d85119962294ba7b7e0eee28550655659d5d77a5462215bf815b3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nunito-ExtraLight.ttf $out/share/fonts/truetype/Nunito-ExtraLight.ttf
     install -Dm644 Nunito-ExtraLightItalic.ttf $out/share/fonts/truetype/Nunito-ExtraLightItalic.ttf
     install -Dm644 Nunito-Light.ttf $out/share/fonts/truetype/Nunito-Light.ttf
     install -Dm644 Nunito-LightItalic.ttf $out/share/fonts/truetype/Nunito-LightItalic.ttf
     install -Dm644 Nunito-Regular.ttf $out/share/fonts/truetype/Nunito-Regular.ttf
     install -Dm644 Nunito-Italic.ttf $out/share/fonts/truetype/Nunito-Italic.ttf
     install -Dm644 Nunito-SemiBold.ttf $out/share/fonts/truetype/Nunito-SemiBold.ttf
     install -Dm644 Nunito-SemiBoldItalic.ttf $out/share/fonts/truetype/Nunito-SemiBoldItalic.ttf
     install -Dm644 Nunito-Bold.ttf $out/share/fonts/truetype/Nunito-Bold.ttf
     install -Dm644 Nunito-BoldItalic.ttf $out/share/fonts/truetype/Nunito-BoldItalic.ttf
     install -Dm644 Nunito-ExtraBold.ttf $out/share/fonts/truetype/Nunito-ExtraBold.ttf
     install -Dm644 Nunito-ExtraBoldItalic.ttf $out/share/fonts/truetype/Nunito-ExtraBoldItalic.ttf
     install -Dm644 Nunito-Black.ttf $out/share/fonts/truetype/Nunito-Black.ttf
     install -Dm644 Nunito-BlackItalic.ttf $out/share/fonts/truetype/Nunito-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Nunito";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
