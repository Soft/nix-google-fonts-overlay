{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aref-ruqaa-${version}";
  version = "2017-08-07-210825";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7785dbc9150ffa19a5e2c7965e1789e6f151f8b1/ofl/arefruqaa/ArefRuqaa-Regular.ttf?raw=true";
      name = "ArefRuqaa-Regular.ttf";
      sha256 = "a8f0c27667bfaec627d7e1c2abfe22ddb753430ae8a673877c14e4e960f7f828";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7785dbc9150ffa19a5e2c7965e1789e6f151f8b1/ofl/arefruqaa/ArefRuqaa-Bold.ttf?raw=true";
      name = "ArefRuqaa-Bold.ttf";
      sha256 = "bf620622213efe5d4fa6302dbb457a25fd420565c8f2de4962cd3ff035cc42d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArefRuqaa-Regular.ttf $out/share/fonts/truetype/ArefRuqaa-Regular.ttf
     install -Dm644 ArefRuqaa-Bold.ttf $out/share/fonts/truetype/ArefRuqaa-Bold.ttf
  '';

  meta = with lib; {
    description = "Aref Ruqaa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
