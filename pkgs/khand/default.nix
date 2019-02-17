{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "khand-${version}";
  version = "2017-05-08-221739";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/21bb9bd12fb1cf1e94ce5817d3572a402cbbbc2c/ofl/khand/Khand-Light.ttf?raw=true";
      name = "Khand-Light.ttf";
      sha256 = "aa330bf068dd64dea07ef1a764c885053efddb51533975fe1b2773aa608bc5df";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/21bb9bd12fb1cf1e94ce5817d3572a402cbbbc2c/ofl/khand/Khand-Regular.ttf?raw=true";
      name = "Khand-Regular.ttf";
      sha256 = "c0102bfe641ba12cfb072c5bcdd8c3d7723e03aed17e785fecad1d45d6333a06";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/21bb9bd12fb1cf1e94ce5817d3572a402cbbbc2c/ofl/khand/Khand-Medium.ttf?raw=true";
      name = "Khand-Medium.ttf";
      sha256 = "959f51907a0581e8ab23383e8743badc516990643385af8999ae6f20657188e0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/21bb9bd12fb1cf1e94ce5817d3572a402cbbbc2c/ofl/khand/Khand-SemiBold.ttf?raw=true";
      name = "Khand-SemiBold.ttf";
      sha256 = "373745b494d6ec8dbe736107624a3494d1c3fea45a55f09309cf8e2d4ebd588c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/21bb9bd12fb1cf1e94ce5817d3572a402cbbbc2c/ofl/khand/Khand-Bold.ttf?raw=true";
      name = "Khand-Bold.ttf";
      sha256 = "cc10f4a89f64cb03ec21e07a371e6a4892169192ffb2795a8fecd236e88f6f31";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Khand-Light.ttf $out/share/fonts/truetype/Khand-Light.ttf
     install -Dm644 Khand-Regular.ttf $out/share/fonts/truetype/Khand-Regular.ttf
     install -Dm644 Khand-Medium.ttf $out/share/fonts/truetype/Khand-Medium.ttf
     install -Dm644 Khand-SemiBold.ttf $out/share/fonts/truetype/Khand-SemiBold.ttf
     install -Dm644 Khand-Bold.ttf $out/share/fonts/truetype/Khand-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Khand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
