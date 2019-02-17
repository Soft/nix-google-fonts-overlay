{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "post-no-bills-colombo-${version}";
  version = "2017-02-17-185457";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5f37cea1d44d3d6d5a92da9d615a46830d052d2/ofl/postnobillscolombo/PostNoBillsColombo-Light.ttf?raw=true";
      name = "PostNoBillsColombo-Light.ttf";
      sha256 = "0109c8467d1b7dbec3fd8c06740e82044fd9f500849749c48b3527f62206a17c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5f37cea1d44d3d6d5a92da9d615a46830d052d2/ofl/postnobillscolombo/PostNoBillsColombo-Regular.ttf?raw=true";
      name = "PostNoBillsColombo-Regular.ttf";
      sha256 = "fb996860f2351cdeb7ab66f31cde5a7929e85cb8d070b7fc0462aa68ab30942a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5f37cea1d44d3d6d5a92da9d615a46830d052d2/ofl/postnobillscolombo/PostNoBillsColombo-Medium.ttf?raw=true";
      name = "PostNoBillsColombo-Medium.ttf";
      sha256 = "04934c38c33f2b6569120bf81ac1dc69786305fe7279a390cc9b93f0856f6340";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5f37cea1d44d3d6d5a92da9d615a46830d052d2/ofl/postnobillscolombo/PostNoBillsColombo-SemiBold.ttf?raw=true";
      name = "PostNoBillsColombo-SemiBold.ttf";
      sha256 = "37d53b1a056b0b096cc5ad5de242abd3a2e27dc14bea58b3d432db726713ffb7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5f37cea1d44d3d6d5a92da9d615a46830d052d2/ofl/postnobillscolombo/PostNoBillsColombo-Bold.ttf?raw=true";
      name = "PostNoBillsColombo-Bold.ttf";
      sha256 = "beca286bddb28a387d2c54045574bde8bd7dd49eb1ab242be2df2e324f86d9e9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f5f37cea1d44d3d6d5a92da9d615a46830d052d2/ofl/postnobillscolombo/PostNoBillsColombo-ExtraBold.ttf?raw=true";
      name = "PostNoBillsColombo-ExtraBold.ttf";
      sha256 = "2d91452ac5628f437ab249ac61c710bc4adc7f3da75e8b8755bebd7f5bcd6fd5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PostNoBillsColombo-Light.ttf $out/share/fonts/truetype/PostNoBillsColombo-Light.ttf
     install -Dm644 PostNoBillsColombo-Regular.ttf $out/share/fonts/truetype/PostNoBillsColombo-Regular.ttf
     install -Dm644 PostNoBillsColombo-Medium.ttf $out/share/fonts/truetype/PostNoBillsColombo-Medium.ttf
     install -Dm644 PostNoBillsColombo-SemiBold.ttf $out/share/fonts/truetype/PostNoBillsColombo-SemiBold.ttf
     install -Dm644 PostNoBillsColombo-Bold.ttf $out/share/fonts/truetype/PostNoBillsColombo-Bold.ttf
     install -Dm644 PostNoBillsColombo-ExtraBold.ttf $out/share/fonts/truetype/PostNoBillsColombo-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Post No Bills Colombo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
