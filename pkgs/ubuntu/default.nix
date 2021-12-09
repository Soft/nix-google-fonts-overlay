{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ubuntu-${version}";
  version = "2017-05-14-031219";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a50de97857f6626d6628c91e6a34c12ee8a16ede/ufl/ubuntu/Ubuntu-Light.ttf?raw=true";
      name = "Ubuntu-Light.ttf";
      sha256 = "a5d3ef89f219e90e1f22616adf2bd4a86c8ddd37aff58cd223482c44e3a92eef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a50de97857f6626d6628c91e6a34c12ee8a16ede/ufl/ubuntu/Ubuntu-LightItalic.ttf?raw=true";
      name = "Ubuntu-LightItalic.ttf";
      sha256 = "8fc50d6238be2076f602578d846c81a680f3c1ad58c372cc272b4dee6e68ff90";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a50de97857f6626d6628c91e6a34c12ee8a16ede/ufl/ubuntu/Ubuntu-Regular.ttf?raw=true";
      name = "Ubuntu-Regular.ttf";
      sha256 = "3128df86a31805618436d0ae5651ba4285d0c9de0a39057d025f64ee33bceb64";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a50de97857f6626d6628c91e6a34c12ee8a16ede/ufl/ubuntu/Ubuntu-Italic.ttf?raw=true";
      name = "Ubuntu-Italic.ttf";
      sha256 = "4ab857e72f781a8967a6e4a9ac8858fbd6b3a9f9782db349d4b62b78ed02860b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a50de97857f6626d6628c91e6a34c12ee8a16ede/ufl/ubuntu/Ubuntu-Medium.ttf?raw=true";
      name = "Ubuntu-Medium.ttf";
      sha256 = "3cd952b8b52581e48a8fa95b31c8829c2baa41b635042a69587d57f98092961e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a50de97857f6626d6628c91e6a34c12ee8a16ede/ufl/ubuntu/Ubuntu-MediumItalic.ttf?raw=true";
      name = "Ubuntu-MediumItalic.ttf";
      sha256 = "54f65387b462fef9b4fb45f4e84344d5a9cfa660e281189e8d5e0ddcfccf5e8c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a50de97857f6626d6628c91e6a34c12ee8a16ede/ufl/ubuntu/Ubuntu-Bold.ttf?raw=true";
      name = "Ubuntu-Bold.ttf";
      sha256 = "679b5c1e09cab3156bb8ef529735f9382bf31ca7ac737382ab959297f8d82ad4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a50de97857f6626d6628c91e6a34c12ee8a16ede/ufl/ubuntu/Ubuntu-BoldItalic.ttf?raw=true";
      name = "Ubuntu-BoldItalic.ttf";
      sha256 = "875d776e7f33c50b1d1b594791da0eba9865648f232f08bcba00bba9dfa01d96";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ubuntu-Light.ttf $out/share/fonts/truetype/Ubuntu-Light.ttf
     install -Dm644 Ubuntu-LightItalic.ttf $out/share/fonts/truetype/Ubuntu-LightItalic.ttf
     install -Dm644 Ubuntu-Regular.ttf $out/share/fonts/truetype/Ubuntu-Regular.ttf
     install -Dm644 Ubuntu-Italic.ttf $out/share/fonts/truetype/Ubuntu-Italic.ttf
     install -Dm644 Ubuntu-Medium.ttf $out/share/fonts/truetype/Ubuntu-Medium.ttf
     install -Dm644 Ubuntu-MediumItalic.ttf $out/share/fonts/truetype/Ubuntu-MediumItalic.ttf
     install -Dm644 Ubuntu-Bold.ttf $out/share/fonts/truetype/Ubuntu-Bold.ttf
     install -Dm644 Ubuntu-BoldItalic.ttf $out/share/fonts/truetype/Ubuntu-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Ubuntu";
    license = licenses.ufl;
    platforms = platforms.all;
  };
}
