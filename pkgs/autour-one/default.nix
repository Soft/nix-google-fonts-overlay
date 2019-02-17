{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "autour-one-${version}";
  version = "2017-08-07-195922";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/592bee48b3d433ca40b3030ee9773e57c849c4dd/ofl/autourone/AutourOne-Regular.ttf?raw=true";
      name = "AutourOne-Regular.ttf";
      sha256 = "6a3f5bf27e9398c25bd8c4edaee8bd503d8074553537a2bf3b1d724353aab252";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AutourOne-Regular.ttf $out/share/fonts/truetype/AutourOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Autour One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
