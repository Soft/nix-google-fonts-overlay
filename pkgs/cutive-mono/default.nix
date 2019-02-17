{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cutive-mono-${version}";
  version = "2016-12-02-173234";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a070b8c1aeb9df027ce96135324183ac158c396/ofl/cutivemono/CutiveMono-Regular.ttf?raw=true";
      name = "CutiveMono-Regular.ttf";
      sha256 = "543c74f6185531aebf6151fba7c618f5aeb43af8cb6b09d70e97e3611b351e6e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CutiveMono-Regular.ttf $out/share/fonts/truetype/CutiveMono-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cutive Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
