{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tauri-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/tauri/Tauri-Regular.ttf?raw=true";
      name = "Tauri-Regular.ttf";
      sha256 = "fca89fc675b89363e550b1308eeede7fa0f5f4e1eb2bf9b9bb5d432c01817a39";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tauri-Regular.ttf $out/share/fonts/truetype/Tauri-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Tauri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
