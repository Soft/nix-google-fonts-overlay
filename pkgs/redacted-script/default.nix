{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "redacted-script-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bacec3651f66c2e219e20a9a0d0aa0286c74a777/ofl/redactedscript/RedactedScript-Regular.ttf?raw=true";
      name = "RedactedScript-Regular.ttf";
      sha256 = "0ea846f8aa0ea5049676e3bcda5a276e3b5b5b86002199ce11ba9ca2f03cfade";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bacec3651f66c2e219e20a9a0d0aa0286c74a777/ofl/redactedscript/RedactedScript-Bold.ttf?raw=true";
      name = "RedactedScript-Bold.ttf";
      sha256 = "e84ab9873e893d5a443ae9ee16283c816a21e20e577e8961ee64d22736978104";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedactedScript-Regular.ttf $out/share/fonts/truetype/RedactedScript-Regular.ttf
     install -Dm644 RedactedScript-Bold.ttf $out/share/fonts/truetype/RedactedScript-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Redacted Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
