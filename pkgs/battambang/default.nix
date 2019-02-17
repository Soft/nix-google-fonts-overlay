{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "battambang-${version}";
  version = "2017-08-07-194014";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4fac0ad378ff3963fc2f11bdf42233297e7ad3b7/ofl/battambang/Battambang-Regular.ttf?raw=true";
      name = "Battambang-Regular.ttf";
      sha256 = "9ee76deaf205f55d200b3dcddb56878fea6c3c3d01ff64ac8e13fe17a651b580";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4fac0ad378ff3963fc2f11bdf42233297e7ad3b7/ofl/battambang/Battambang-Bold.ttf?raw=true";
      name = "Battambang-Bold.ttf";
      sha256 = "81c02bf544344a5992629fb55c778a3f1a5e12faa8bb410a52a0e81c57ffd0a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Battambang-Regular.ttf $out/share/fonts/truetype/Battambang-Regular.ttf
     install -Dm644 Battambang-Bold.ttf $out/share/fonts/truetype/Battambang-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Battambang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
