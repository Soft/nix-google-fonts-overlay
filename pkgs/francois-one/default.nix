{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "francois-one-${version}";
  version = "2016-12-02-173147";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/34f4f3eb31d67d2d8736a17b3092c9d17702be06/ofl/francoisone/FrancoisOne-Regular.ttf?raw=true";
      name = "FrancoisOne-Regular.ttf";
      sha256 = "700fb5e4a5b6edb14dde2dcd481e5a9cac14281579cf42500170bae7cddd3609";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FrancoisOne-Regular.ttf $out/share/fonts/truetype/FrancoisOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Francois One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
