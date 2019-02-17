{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asset-${version}";
  version = "2017-08-07-200225";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/15ff3b257446cb2ae1a35092e94afc7982cf0b0d/ofl/asset/Asset-Regular.ttf?raw=true";
      name = "Asset-Regular.ttf";
      sha256 = "4c7ed63fcae4c934b5c8b0141eb6d22572c35bbd3c71d7f6ecd687a65fb7e537";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Asset-Regular.ttf $out/share/fonts/truetype/Asset-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Asset";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
