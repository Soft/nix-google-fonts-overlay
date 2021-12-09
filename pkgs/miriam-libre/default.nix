{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miriam-libre-${version}";
  version = "2017-08-07-200528";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b07806a6f57c74b57f744be755b87ea3b24fb93e/ofl/miriamlibre/MiriamLibre-Regular.ttf?raw=true";
      name = "MiriamLibre-Regular.ttf";
      sha256 = "277eaa259e6ef59252e0827fcf0738f23f46e5af289b243a187fa0f78ec7917f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b07806a6f57c74b57f744be755b87ea3b24fb93e/ofl/miriamlibre/MiriamLibre-Bold.ttf?raw=true";
      name = "MiriamLibre-Bold.ttf";
      sha256 = "d88c315eb0b8c83f2db2929702b086063a7072448a5cccf78af47a9d2dd484f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MiriamLibre-Regular.ttf $out/share/fonts/truetype/MiriamLibre-Regular.ttf
     install -Dm644 MiriamLibre-Bold.ttf $out/share/fonts/truetype/MiriamLibre-Bold.ttf
  '';

  meta = with lib; {
    description = "Miriam Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
