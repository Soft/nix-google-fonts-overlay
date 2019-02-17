{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bio-rhyme-${version}";
  version = "2017-05-23-171645";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/81ab217e2e9c7535c52684d94e26093e1d5b0b90/ofl/biorhyme/BioRhyme-ExtraLight.ttf?raw=true";
      name = "BioRhyme-ExtraLight.ttf";
      sha256 = "dd795e7e593f05735133a48e8c40d78219fb3508f0d11bd14bf46b0c7c3a6da7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/81ab217e2e9c7535c52684d94e26093e1d5b0b90/ofl/biorhyme/BioRhyme-Light.ttf?raw=true";
      name = "BioRhyme-Light.ttf";
      sha256 = "1b2f7cf724ac282a925a2abab4ef11e21cfc0723d39c179a081bfe3feb5fca7d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/81ab217e2e9c7535c52684d94e26093e1d5b0b90/ofl/biorhyme/BioRhyme-Regular.ttf?raw=true";
      name = "BioRhyme-Regular.ttf";
      sha256 = "92ad801aeff313618b1d9990edaf6ddc4efb9349cb9eb8920fd40dd9d2087276";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/81ab217e2e9c7535c52684d94e26093e1d5b0b90/ofl/biorhyme/BioRhyme-Bold.ttf?raw=true";
      name = "BioRhyme-Bold.ttf";
      sha256 = "2b621a88aed4dc4b20a6d242eb3d062049ef15f93c7dfc177f2ff09d02cb0b3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/81ab217e2e9c7535c52684d94e26093e1d5b0b90/ofl/biorhyme/BioRhyme-ExtraBold.ttf?raw=true";
      name = "BioRhyme-ExtraBold.ttf";
      sha256 = "8a062b0a1cee7cfcf7f7b753a1c41ea2c968a3ea013d708e78891cf23f6ae178";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BioRhyme-ExtraLight.ttf $out/share/fonts/truetype/BioRhyme-ExtraLight.ttf
     install -Dm644 BioRhyme-Light.ttf $out/share/fonts/truetype/BioRhyme-Light.ttf
     install -Dm644 BioRhyme-Regular.ttf $out/share/fonts/truetype/BioRhyme-Regular.ttf
     install -Dm644 BioRhyme-Bold.ttf $out/share/fonts/truetype/BioRhyme-Bold.ttf
     install -Dm644 BioRhyme-ExtraBold.ttf $out/share/fonts/truetype/BioRhyme-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bio Rhyme";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
