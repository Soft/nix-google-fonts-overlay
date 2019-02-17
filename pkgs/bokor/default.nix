{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bokor-${version}";
  version = "2017-08-07-195003";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/08635a26b2cb73314f1be07621c335f0667db598/ofl/bokor/Bokor-Regular.ttf?raw=true";
      name = "Bokor-Regular.ttf";
      sha256 = "e1d300a99aca205ecf1921aca3befe5b447964130fbb0ca18455fde7fc520286";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bokor-Regular.ttf $out/share/fonts/truetype/Bokor-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bokor";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
