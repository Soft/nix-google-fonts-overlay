{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-paaji-${version}";
  version = "2017-08-07-193427";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2b1a4865367d75775b92c48e8b29ce0699a8aaf0/ofl/baloopaaji/BalooPaaji-Regular.ttf?raw=true";
      name = "BalooPaaji-Regular.ttf";
      sha256 = "d09516f24d2f5389854fc6deb156d7c1abbb9c9f35ca99486ef3e6d2fabf56b1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooPaaji-Regular.ttf $out/share/fonts/truetype/BalooPaaji-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Baloo Paaji";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
