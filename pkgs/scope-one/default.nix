{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "scope-one-${version}";
  version = "2017-05-23-164632";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c810ed73f6f9825befb46e8b651b542b98f9e2c5/ofl/scopeone/ScopeOne-Regular.ttf?raw=true";
      name = "ScopeOne-Regular.ttf";
      sha256 = "3ea90d6c246321acc26260255f24095cc1f91fc33380bbc9283dfdf5b77118cd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ScopeOne-Regular.ttf $out/share/fonts/truetype/ScopeOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Scope One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
