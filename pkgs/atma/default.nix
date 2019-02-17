{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "atma-${version}";
  version = "2017-05-11-034458";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d248fd361d2269bdcf64fa421ade67d5b8a4ba05/ofl/atma/Atma-Light.ttf?raw=true";
      name = "Atma-Light.ttf";
      sha256 = "44d29f1887173928289709a47ef6b6b5259209ac2349a8622922316a697f497c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d248fd361d2269bdcf64fa421ade67d5b8a4ba05/ofl/atma/Atma-Regular.ttf?raw=true";
      name = "Atma-Regular.ttf";
      sha256 = "3ddd9e02b4b6077b25c07f5d1f4411c9071e5030a4124d77dcd5a04fa292b921";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d248fd361d2269bdcf64fa421ade67d5b8a4ba05/ofl/atma/Atma-Medium.ttf?raw=true";
      name = "Atma-Medium.ttf";
      sha256 = "369d9788c926ea6f3650999617beb348238f370d65b3d5d180d638c82ea3d82a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d248fd361d2269bdcf64fa421ade67d5b8a4ba05/ofl/atma/Atma-SemiBold.ttf?raw=true";
      name = "Atma-SemiBold.ttf";
      sha256 = "15b935a57290a675391c6ca6bac4bd7fc746ead44e35495d6dc2562b2265a28f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d248fd361d2269bdcf64fa421ade67d5b8a4ba05/ofl/atma/Atma-Bold.ttf?raw=true";
      name = "Atma-Bold.ttf";
      sha256 = "d55399f5bcdb78f60da7dbd6c5abfdc92510154361586ad1b07bca7ee739dba6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Atma-Light.ttf $out/share/fonts/truetype/Atma-Light.ttf
     install -Dm644 Atma-Regular.ttf $out/share/fonts/truetype/Atma-Regular.ttf
     install -Dm644 Atma-Medium.ttf $out/share/fonts/truetype/Atma-Medium.ttf
     install -Dm644 Atma-SemiBold.ttf $out/share/fonts/truetype/Atma-SemiBold.ttf
     install -Dm644 Atma-Bold.ttf $out/share/fonts/truetype/Atma-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Atma";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
