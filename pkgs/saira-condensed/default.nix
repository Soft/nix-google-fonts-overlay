{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-condensed-${version}";
  version = "2016-12-06-220634";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-Thin.ttf?raw=true";
      name = "SairaCondensed-Thin.ttf";
      sha256 = "fbc271bbbc10e447c53f43696bf28e82003c7ff4e2ae4e4693626fdfae21f121";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-ExtraLight.ttf?raw=true";
      name = "SairaCondensed-ExtraLight.ttf";
      sha256 = "9aef2e4f62025e9da75bdcb5b865bf6bb4d58157dba610d32c15ba88812e20f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-Light.ttf?raw=true";
      name = "SairaCondensed-Light.ttf";
      sha256 = "1685e52befb3fcc694335352443f417a51a2d90537775b1a735391638e62736a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-Regular.ttf?raw=true";
      name = "SairaCondensed-Regular.ttf";
      sha256 = "8f26edd9f227794818b66f936037dc35bd22674b287087d5d19a93d554d9a6f6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-Medium.ttf?raw=true";
      name = "SairaCondensed-Medium.ttf";
      sha256 = "a02d8fe45b8b7d952cb0dd341683b02ddc1b55dbd0ed89d9d438868be614b66f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-SemiBold.ttf?raw=true";
      name = "SairaCondensed-SemiBold.ttf";
      sha256 = "30f8ed4d078211003a9715c80c51ce031bab5c9a17e8771182e4c4599205634b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-Bold.ttf?raw=true";
      name = "SairaCondensed-Bold.ttf";
      sha256 = "560297e4bccfb8c6e643095e716b5ea2ea9d7289801ddd79ab901698ffb0dee6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-ExtraBold.ttf?raw=true";
      name = "SairaCondensed-ExtraBold.ttf";
      sha256 = "8821cabbc8bb3b0727be0a82d192c96baadbaf608012aff557eaaced1897ae84";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda91bff215c766697fcbbcf836a6425e5c167ac/ofl/sairacondensed/SairaCondensed-Black.ttf?raw=true";
      name = "SairaCondensed-Black.ttf";
      sha256 = "3edf5f2f027e2d5203218f5b56cda652b2af9258c0c08be7fb874f3f8cf266ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SairaCondensed-Thin.ttf $out/share/fonts/truetype/SairaCondensed-Thin.ttf
     install -Dm644 SairaCondensed-ExtraLight.ttf $out/share/fonts/truetype/SairaCondensed-ExtraLight.ttf
     install -Dm644 SairaCondensed-Light.ttf $out/share/fonts/truetype/SairaCondensed-Light.ttf
     install -Dm644 SairaCondensed-Regular.ttf $out/share/fonts/truetype/SairaCondensed-Regular.ttf
     install -Dm644 SairaCondensed-Medium.ttf $out/share/fonts/truetype/SairaCondensed-Medium.ttf
     install -Dm644 SairaCondensed-SemiBold.ttf $out/share/fonts/truetype/SairaCondensed-SemiBold.ttf
     install -Dm644 SairaCondensed-Bold.ttf $out/share/fonts/truetype/SairaCondensed-Bold.ttf
     install -Dm644 SairaCondensed-ExtraBold.ttf $out/share/fonts/truetype/SairaCondensed-ExtraBold.ttf
     install -Dm644 SairaCondensed-Black.ttf $out/share/fonts/truetype/SairaCondensed-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Saira Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
