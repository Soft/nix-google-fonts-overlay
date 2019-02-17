{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stardos-stencil-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/stardosstencil/StardosStencil-Regular.ttf?raw=true";
      name = "StardosStencil-Regular.ttf";
      sha256 = "851c1fcfab457340e3e259c96ffa3529f893ba7714a7f6b7dd44f8758fb33d18";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/stardosstencil/StardosStencil-Bold.ttf?raw=true";
      name = "StardosStencil-Bold.ttf";
      sha256 = "77d4b32606cddd6b52ec5769812652604270e6b70173aa57600920e18cb9fd11";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StardosStencil-Regular.ttf $out/share/fonts/truetype/StardosStencil-Regular.ttf
     install -Dm644 StardosStencil-Bold.ttf $out/share/fonts/truetype/StardosStencil-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Stardos Stencil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
