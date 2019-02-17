{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gentium-book-basic-${version}";
  version = "2016-09-26-145146";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/gentiumbookbasic/GenBkBasR.ttf?raw=true";
      name = "GenBkBasR.ttf";
      sha256 = "f0e5c2d48408804caf9779ee2e039687b3ac5cf56edff51577fc0aedc0908994";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/gentiumbookbasic/GenBkBasI.ttf?raw=true";
      name = "GenBkBasI.ttf";
      sha256 = "6879e401a0c44c6473fb796c284112f3139bd20c289cff92e6c4abb4dab7d369";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/gentiumbookbasic/GenBkBasB.ttf?raw=true";
      name = "GenBkBasB.ttf";
      sha256 = "37fc25b7916e4055ffff0b9bda2b9a9efe7d3404773339fa8cde00a15d5589a9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/gentiumbookbasic/GenBkBasBI.ttf?raw=true";
      name = "GenBkBasBI.ttf";
      sha256 = "dccbca56a0d1bdbcc440e3b2070ee0ef63fd834454196baeaa8226ead9c82f07";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GenBkBasR.ttf $out/share/fonts/truetype/GenBkBasR.ttf
     install -Dm644 GenBkBasI.ttf $out/share/fonts/truetype/GenBkBasI.ttf
     install -Dm644 GenBkBasB.ttf $out/share/fonts/truetype/GenBkBasB.ttf
     install -Dm644 GenBkBasBI.ttf $out/share/fonts/truetype/GenBkBasBI.ttf
  '';

  meta = with stdenv.lib; {
    description = "Gentium Book Basic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
