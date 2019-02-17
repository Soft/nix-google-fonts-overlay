{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "irish-grover-${version}";
  version = "2017-08-07-204419";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/daa6505c6b31624e0c129f44da0f3a4341093734/apache/irishgrover/IrishGrover-Regular.ttf?raw=true";
      name = "IrishGrover-Regular.ttf";
      sha256 = "d894be4e904bbd08a9d46670b4f631e84b7de5d70ede2c89e8217958ca32eec4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IrishGrover-Regular.ttf $out/share/fonts/truetype/IrishGrover-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Irish Grover";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
