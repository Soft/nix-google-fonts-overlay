{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bio-rhyme-expanded-${version}";
  version = "2017-05-23-171533";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57523b5f6bc6e64b2664dbc4b9bf3d26192076ef/ofl/biorhymeexpanded/BioRhymeExpanded-ExtraLight.ttf?raw=true";
      name = "BioRhymeExpanded-ExtraLight.ttf";
      sha256 = "16ba12fa8b94712383e5a4eac51d11addba2a8ce44a0c239ee13583cd7c32fc1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57523b5f6bc6e64b2664dbc4b9bf3d26192076ef/ofl/biorhymeexpanded/BioRhymeExpanded-Light.ttf?raw=true";
      name = "BioRhymeExpanded-Light.ttf";
      sha256 = "396a934bcfcd29009432f281c5be6ee2d1ed9552ca45eae509af3f9076d511cb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57523b5f6bc6e64b2664dbc4b9bf3d26192076ef/ofl/biorhymeexpanded/BioRhymeExpanded-Regular.ttf?raw=true";
      name = "BioRhymeExpanded-Regular.ttf";
      sha256 = "e75a7c996c8884d3d26c0823e7cfbf3cf404d27a36ddff715f6dfd95389affa7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57523b5f6bc6e64b2664dbc4b9bf3d26192076ef/ofl/biorhymeexpanded/BioRhymeExpanded-Bold.ttf?raw=true";
      name = "BioRhymeExpanded-Bold.ttf";
      sha256 = "b90136544a46250d2c366d8fdb3268419f0433ba6a6c96998baafe0d17319a77";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57523b5f6bc6e64b2664dbc4b9bf3d26192076ef/ofl/biorhymeexpanded/BioRhymeExpanded-ExtraBold.ttf?raw=true";
      name = "BioRhymeExpanded-ExtraBold.ttf";
      sha256 = "3b916880fa74c804153051745376988e856029c86bed1f7facd532cebeee000d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BioRhymeExpanded-ExtraLight.ttf $out/share/fonts/truetype/BioRhymeExpanded-ExtraLight.ttf
     install -Dm644 BioRhymeExpanded-Light.ttf $out/share/fonts/truetype/BioRhymeExpanded-Light.ttf
     install -Dm644 BioRhymeExpanded-Regular.ttf $out/share/fonts/truetype/BioRhymeExpanded-Regular.ttf
     install -Dm644 BioRhymeExpanded-Bold.ttf $out/share/fonts/truetype/BioRhymeExpanded-Bold.ttf
     install -Dm644 BioRhymeExpanded-ExtraBold.ttf $out/share/fonts/truetype/BioRhymeExpanded-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bio Rhyme Expanded";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
