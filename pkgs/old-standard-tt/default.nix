{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "old-standard-tt-${version}";
  version = "2017-01-17-072958";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2aec2c16bb51f35ffad4adaef96775c40cf65c85/ofl/oldstandardtt/OldStandard-Regular.ttf?raw=true";
      name = "OldStandard-Regular.ttf";
      sha256 = "42717a1280b523a506ca2b0285cca380e77fe214b1f6e3d75a8b925005f19eac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2aec2c16bb51f35ffad4adaef96775c40cf65c85/ofl/oldstandardtt/OldStandard-Italic.ttf?raw=true";
      name = "OldStandard-Italic.ttf";
      sha256 = "4b9522f4711317fc06e2413a58b4662c249cb707df193d682b9d640e365ef564";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2aec2c16bb51f35ffad4adaef96775c40cf65c85/ofl/oldstandardtt/OldStandard-Bold.ttf?raw=true";
      name = "OldStandard-Bold.ttf";
      sha256 = "7d831e9d799ad23ee98e889381a9db2a283b2dac7f228dd5c06071decb9c54db";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OldStandard-Regular.ttf $out/share/fonts/truetype/OldStandard-Regular.ttf
     install -Dm644 OldStandard-Italic.ttf $out/share/fonts/truetype/OldStandard-Italic.ttf
     install -Dm644 OldStandard-Bold.ttf $out/share/fonts/truetype/OldStandard-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Old Standard TT";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
