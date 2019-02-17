{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-chettan-${version}";
  version = "2017-08-07-193606";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/773419a307fe04c9a0452f2cf0a9e2e22e6d940a/ofl/baloochettan/BalooChettan-Regular.ttf?raw=true";
      name = "BalooChettan-Regular.ttf";
      sha256 = "7b77a520492e79d34c4110fe60978895d01ecba18f9225e7490ef59618834569";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooChettan-Regular.ttf $out/share/fonts/truetype/BalooChettan-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Baloo Chettan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
