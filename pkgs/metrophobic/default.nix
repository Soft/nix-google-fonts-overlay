{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metrophobic-${version}";
  version = "2016-12-02-171607";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/65c2d1a710934827868d11df22a1788342017363/ofl/metrophobic/Metrophobic-Regular.ttf?raw=true";
      name = "Metrophobic-Regular.ttf";
      sha256 = "9977c0b8ba0f45640ae600f597532cd84e23c145874e27ee3daa3454ee658115";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Metrophobic-Regular.ttf $out/share/fonts/truetype/Metrophobic-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Metrophobic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
