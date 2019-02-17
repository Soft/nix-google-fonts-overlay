{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amethysta-${version}";
  version = "2017-08-07-204229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e23b59c52af840b082b22fd1ad3c0f7c392f2e7/ofl/amethysta/Amethysta-Regular.ttf?raw=true";
      name = "Amethysta-Regular.ttf";
      sha256 = "5e192003ec8b95595c27737e2a2bb3c9db2e468b24b572a9183b2f0003143f1c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amethysta-Regular.ttf $out/share/fonts/truetype/Amethysta-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Amethysta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
