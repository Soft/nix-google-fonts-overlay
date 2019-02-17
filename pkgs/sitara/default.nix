{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sitara-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e42686751df97a23655d6346ef916c030eb616a/ofl/sitara/Sitara-Regular.ttf?raw=true";
      name = "Sitara-Regular.ttf";
      sha256 = "db012b93bc95bb06c3d223165ac852a70a08153891f02dc6d8bbdd2f046245e0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e42686751df97a23655d6346ef916c030eb616a/ofl/sitara/Sitara-Italic.ttf?raw=true";
      name = "Sitara-Italic.ttf";
      sha256 = "fb27328a202750adeb1705e1ebbc10c2633da3334c49933b67fcf053088eef1e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e42686751df97a23655d6346ef916c030eb616a/ofl/sitara/Sitara-Bold.ttf?raw=true";
      name = "Sitara-Bold.ttf";
      sha256 = "6c1062617bde8a8b9156c5c19ec1645b02e15f7ad35680da8ff8b68b71864419";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e42686751df97a23655d6346ef916c030eb616a/ofl/sitara/Sitara-BoldItalic.ttf?raw=true";
      name = "Sitara-BoldItalic.ttf";
      sha256 = "72c75e8437992707246bd3b5340f651ab7335a9c8c3f38d93730e1270f7522c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sitara-Regular.ttf $out/share/fonts/truetype/Sitara-Regular.ttf
     install -Dm644 Sitara-Italic.ttf $out/share/fonts/truetype/Sitara-Italic.ttf
     install -Dm644 Sitara-Bold.ttf $out/share/fonts/truetype/Sitara-Bold.ttf
     install -Dm644 Sitara-BoldItalic.ttf $out/share/fonts/truetype/Sitara-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Sitara";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
