{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-madurai-${version}";
  version = "2017-05-08-212515";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/495992874082c10fb61885490308991be1d9eebc/ofl/hindmadurai/HindMadurai-Light.ttf?raw=true";
      name = "HindMadurai-Light.ttf";
      sha256 = "dbe7a2234d341e80b345d4ffc2002e3089492cd07cd4ff5c38fe2dcbbfea54cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/495992874082c10fb61885490308991be1d9eebc/ofl/hindmadurai/HindMadurai-Regular.ttf?raw=true";
      name = "HindMadurai-Regular.ttf";
      sha256 = "8bd56d6002d4fe4f5f378dd29f9ad382dbbd03a2bf16da24599aabe33f9b55b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/495992874082c10fb61885490308991be1d9eebc/ofl/hindmadurai/HindMadurai-Medium.ttf?raw=true";
      name = "HindMadurai-Medium.ttf";
      sha256 = "522aae6dea7fb9a9dfbf2ea25bf2ebf5d6f05c4ecba30fd2a56d22a690f4c072";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/495992874082c10fb61885490308991be1d9eebc/ofl/hindmadurai/HindMadurai-SemiBold.ttf?raw=true";
      name = "HindMadurai-SemiBold.ttf";
      sha256 = "fce32cd155130741e8dbae7256ddc2cb195eb07f7816746e7bc828e03c7b0ce5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/495992874082c10fb61885490308991be1d9eebc/ofl/hindmadurai/HindMadurai-Bold.ttf?raw=true";
      name = "HindMadurai-Bold.ttf";
      sha256 = "842086c4312100a032494dcb43fa7afc69ad5772fe004865e0761f92165910a1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindMadurai-Light.ttf $out/share/fonts/truetype/HindMadurai-Light.ttf
     install -Dm644 HindMadurai-Regular.ttf $out/share/fonts/truetype/HindMadurai-Regular.ttf
     install -Dm644 HindMadurai-Medium.ttf $out/share/fonts/truetype/HindMadurai-Medium.ttf
     install -Dm644 HindMadurai-SemiBold.ttf $out/share/fonts/truetype/HindMadurai-SemiBold.ttf
     install -Dm644 HindMadurai-Bold.ttf $out/share/fonts/truetype/HindMadurai-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hind Madurai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
