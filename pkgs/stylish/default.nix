{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stylish-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/stylish/Stylish-Regular.ttf?raw=true";
      name = "Stylish-Regular.ttf";
      sha256 = "3ea2e4c9d0183fdcc1362039305ef30fa8bb5154f030b303a029059a44a8516c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Stylish-Regular.ttf $out/share/fonts/truetype/Stylish-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Stylish";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
