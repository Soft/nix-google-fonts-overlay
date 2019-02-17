{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "varta-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/681dfec717c17781ad270c9df7e76880cb48973e/ofl/varta/Varta-Light.ttf?raw=true";
      name = "Varta-Light.ttf";
      sha256 = "fd90c6a3d372489ca3e7267469ad44a3525800d563cf63a4c6436a5508863c95";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/681dfec717c17781ad270c9df7e76880cb48973e/ofl/varta/Varta-Regular.ttf?raw=true";
      name = "Varta-Regular.ttf";
      sha256 = "d07489e1322583673606a1d68fe77c48efe4db7b2de572f1b3358769df6e8552";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/681dfec717c17781ad270c9df7e76880cb48973e/ofl/varta/Varta-SemiBold.ttf?raw=true";
      name = "Varta-SemiBold.ttf";
      sha256 = "f49b1ec4b5f594b622561bba90aa6eb789560a46cad5bafeffa806b4d4db8dd9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/681dfec717c17781ad270c9df7e76880cb48973e/ofl/varta/Varta-Bold.ttf?raw=true";
      name = "Varta-Bold.ttf";
      sha256 = "3effa525e785e8d92198ac3ccefd767582d7f648c21656b1c9fd2eb628b20123";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Varta-Light.ttf $out/share/fonts/truetype/Varta-Light.ttf
     install -Dm644 Varta-Regular.ttf $out/share/fonts/truetype/Varta-Regular.ttf
     install -Dm644 Varta-SemiBold.ttf $out/share/fonts/truetype/Varta-SemiBold.ttf
     install -Dm644 Varta-Bold.ttf $out/share/fonts/truetype/Varta-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Varta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
