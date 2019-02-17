{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "astloch-${version}";
  version = "2017-08-07-200135";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94982614b3aec3585bc85ccaa415cf463ac0e4fd/ofl/astloch/Astloch-Regular.ttf?raw=true";
      name = "Astloch-Regular.ttf";
      sha256 = "1c1505d568bef7a21b3fe48ad3d16efb5f19ba7c63d9a42a5dcb3058a0058562";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/94982614b3aec3585bc85ccaa415cf463ac0e4fd/ofl/astloch/Astloch-Bold.ttf?raw=true";
      name = "Astloch-Bold.ttf";
      sha256 = "b6fcf52838e2e886f89588ce64beb612aace3050d3acbbc2e4caa5836f2a87bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Astloch-Regular.ttf $out/share/fonts/truetype/Astloch-Regular.ttf
     install -Dm644 Astloch-Bold.ttf $out/share/fonts/truetype/Astloch-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Astloch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
