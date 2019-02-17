{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asap-${version}";
  version = "2017-08-04-161811";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d54cd8b5aef007dd3502115eb8afb114b88b7c21/ofl/asap/Asap-Regular.ttf?raw=true";
      name = "Asap-Regular.ttf";
      sha256 = "90969b7e74c8e2603d6b41f49e62b87955c8b6e8c2e4fc84645539fc1d01e3d3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d54cd8b5aef007dd3502115eb8afb114b88b7c21/ofl/asap/Asap-Italic.ttf?raw=true";
      name = "Asap-Italic.ttf";
      sha256 = "67bd845ccb76fc46aa4381498e73c22ff526647726a0cd93176971f54fe854e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d54cd8b5aef007dd3502115eb8afb114b88b7c21/ofl/asap/Asap-Medium.ttf?raw=true";
      name = "Asap-Medium.ttf";
      sha256 = "e6f2675871f56bd2e6e0a5fec1196503240763975689080caeb295b5c9205272";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d54cd8b5aef007dd3502115eb8afb114b88b7c21/ofl/asap/Asap-MediumItalic.ttf?raw=true";
      name = "Asap-MediumItalic.ttf";
      sha256 = "3c223f49f677e403b1b91114833b459c8955f84b1dad831f7f93c5f6cb9518d9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d54cd8b5aef007dd3502115eb8afb114b88b7c21/ofl/asap/Asap-SemiBold.ttf?raw=true";
      name = "Asap-SemiBold.ttf";
      sha256 = "0e58964be776a602672f455341cb8232a8d119021b64b044cc65981ebd2f0db5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d54cd8b5aef007dd3502115eb8afb114b88b7c21/ofl/asap/Asap-SemiBoldItalic.ttf?raw=true";
      name = "Asap-SemiBoldItalic.ttf";
      sha256 = "0bc329dc40c709311efdaf20430006aca3f2da04b238749b581945942f37b90a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d54cd8b5aef007dd3502115eb8afb114b88b7c21/ofl/asap/Asap-Bold.ttf?raw=true";
      name = "Asap-Bold.ttf";
      sha256 = "c205c258a03b33d690fe0a123196fc60d16e126653ba94c89bffae443bfe1d02";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d54cd8b5aef007dd3502115eb8afb114b88b7c21/ofl/asap/Asap-BoldItalic.ttf?raw=true";
      name = "Asap-BoldItalic.ttf";
      sha256 = "8e7c1eeecc3e18f8ef12f3e2a61cdec39fce3cd44bf4b2e11a6293dfe29e68b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Asap-Regular.ttf $out/share/fonts/truetype/Asap-Regular.ttf
     install -Dm644 Asap-Italic.ttf $out/share/fonts/truetype/Asap-Italic.ttf
     install -Dm644 Asap-Medium.ttf $out/share/fonts/truetype/Asap-Medium.ttf
     install -Dm644 Asap-MediumItalic.ttf $out/share/fonts/truetype/Asap-MediumItalic.ttf
     install -Dm644 Asap-SemiBold.ttf $out/share/fonts/truetype/Asap-SemiBold.ttf
     install -Dm644 Asap-SemiBoldItalic.ttf $out/share/fonts/truetype/Asap-SemiBoldItalic.ttf
     install -Dm644 Asap-Bold.ttf $out/share/fonts/truetype/Asap-Bold.ttf
     install -Dm644 Asap-BoldItalic.ttf $out/share/fonts/truetype/Asap-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Asap";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
