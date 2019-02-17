{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biryani-${version}";
  version = "2017-05-08-150504";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0212fe7f548996662fe390807e0de3e4eb8061bd/ofl/biryani/Biryani-ExtraLight.ttf?raw=true";
      name = "Biryani-ExtraLight.ttf";
      sha256 = "f2a95908cf136847faa9dbda8226d1d2f45cfcadf17696d082010404509dd770";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0212fe7f548996662fe390807e0de3e4eb8061bd/ofl/biryani/Biryani-Light.ttf?raw=true";
      name = "Biryani-Light.ttf";
      sha256 = "83238e32854ac489e02276aebca90d4c675ea95a4413c3ce3d012581c67fea8b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0212fe7f548996662fe390807e0de3e4eb8061bd/ofl/biryani/Biryani-Regular.ttf?raw=true";
      name = "Biryani-Regular.ttf";
      sha256 = "0b846b4f8600e7943a3a86a2f7ce04c20daa7d2cdad74c951edcc8e07c367116";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0212fe7f548996662fe390807e0de3e4eb8061bd/ofl/biryani/Biryani-SemiBold.ttf?raw=true";
      name = "Biryani-SemiBold.ttf";
      sha256 = "8bb5d78fb28fa27909394f3c3548ce544376e23448ff15fbb7cb22ee650b0e5d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0212fe7f548996662fe390807e0de3e4eb8061bd/ofl/biryani/Biryani-Bold.ttf?raw=true";
      name = "Biryani-Bold.ttf";
      sha256 = "5e1b0cc60cbf479a1ce41c6b764fcb25160726485c6676db8e789ed4bab43e43";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0212fe7f548996662fe390807e0de3e4eb8061bd/ofl/biryani/Biryani-ExtraBold.ttf?raw=true";
      name = "Biryani-ExtraBold.ttf";
      sha256 = "ea9ae707985de3f2318fb2ba812facef31253c27e1b039bae922dced15f2273a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0212fe7f548996662fe390807e0de3e4eb8061bd/ofl/biryani/Biryani-Black.ttf?raw=true";
      name = "Biryani-Black.ttf";
      sha256 = "45d7963ee617b4508f16d182e0eb7aeebb6431614a0641ccc8d4534f3673bafa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Biryani-ExtraLight.ttf $out/share/fonts/truetype/Biryani-ExtraLight.ttf
     install -Dm644 Biryani-Light.ttf $out/share/fonts/truetype/Biryani-Light.ttf
     install -Dm644 Biryani-Regular.ttf $out/share/fonts/truetype/Biryani-Regular.ttf
     install -Dm644 Biryani-SemiBold.ttf $out/share/fonts/truetype/Biryani-SemiBold.ttf
     install -Dm644 Biryani-Bold.ttf $out/share/fonts/truetype/Biryani-Bold.ttf
     install -Dm644 Biryani-ExtraBold.ttf $out/share/fonts/truetype/Biryani-ExtraBold.ttf
     install -Dm644 Biryani-Black.ttf $out/share/fonts/truetype/Biryani-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Biryani";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
