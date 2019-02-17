{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cedarville-cursive-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/cedarvillecursive/Cedarville-Cursive.ttf?raw=true";
      name = "Cedarville-Cursive.ttf";
      sha256 = "5f86d71d08a68605d5912b9bcb639a060ce9c0debd7e0b715f5e268d4a4bc317";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cedarville-Cursive.ttf $out/share/fonts/truetype/Cedarville-Cursive.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cedarville Cursive";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
