{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "allura-${version}";
  version = "2017-08-07-204213";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8f76cbc03fecf57f822340f46cf4fb7952c140f0/ofl/allura/Allura-Regular.ttf?raw=true";
      name = "Allura-Regular.ttf";
      sha256 = "4ef7d88faf0de12b02ebf8df63722a5bdbadf0d8a62b673b0fe67463a7905843";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Allura-Regular.ttf $out/share/fonts/truetype/Allura-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Allura";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
