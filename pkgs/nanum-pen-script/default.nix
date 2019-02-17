{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nanum-pen-script-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/nanumpenscript/NanumPenScript-Regular.ttf?raw=true";
      name = "NanumPenScript-Regular.ttf";
      sha256 = "6f0d1ab29c7894010dc88831fb7a0a51edb79136e450344183de5b1a8b52bd43";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NanumPenScript-Regular.ttf $out/share/fonts/truetype/NanumPenScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Nanum Pen Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
