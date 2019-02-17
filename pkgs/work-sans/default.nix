{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "work-sans-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-Thin.ttf?raw=true";
      name = "WorkSans-Thin.ttf";
      sha256 = "cab9c618dc58951d31ca5f72662607469c75ee20573cf742cf6c966583db3318";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-ExtraLight.ttf?raw=true";
      name = "WorkSans-ExtraLight.ttf";
      sha256 = "7cf89c1c8347af0a259a553026aa684a468e6ac94f8dec3b98ea66e0c361444b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-Light.ttf?raw=true";
      name = "WorkSans-Light.ttf";
      sha256 = "6e70c1f9dba4772556c72c5ee23063bd25dc67922c01519b4072308a741507c0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-Regular.ttf?raw=true";
      name = "WorkSans-Regular.ttf";
      sha256 = "4e8b90b2380c6f73922e90ac611f7d79ed0ace91bbcd5fc73ea6f3b6d7cb3441";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-Medium.ttf?raw=true";
      name = "WorkSans-Medium.ttf";
      sha256 = "f35f060d9f1d4dce79ef2fb033d5171dc98432fd41a18135a9934d76156eb082";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-SemiBold.ttf?raw=true";
      name = "WorkSans-SemiBold.ttf";
      sha256 = "22e10fe34441064aa9f299fa998528c5fa9b139ad8febc19721970d5c41089b6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-Bold.ttf?raw=true";
      name = "WorkSans-Bold.ttf";
      sha256 = "d208b3c1cfe945d2077ca5277b9144cabbb515a1a7c6d6021386f6a59d3de0b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-ExtraBold.ttf?raw=true";
      name = "WorkSans-ExtraBold.ttf";
      sha256 = "0c35fdf796bd085bfe0cd7ead4a7eb8ba1ec36256fc59bd39b4dbbeeb83a8565";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04dc364d06d232b601c31570b870a27b4bd300ee/ofl/worksans/WorkSans-Black.ttf?raw=true";
      name = "WorkSans-Black.ttf";
      sha256 = "a1ef0759b74464d8f39e4f4dc09de0669880fba05573b279849f32db68763961";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WorkSans-Thin.ttf $out/share/fonts/truetype/WorkSans-Thin.ttf
     install -Dm644 WorkSans-ExtraLight.ttf $out/share/fonts/truetype/WorkSans-ExtraLight.ttf
     install -Dm644 WorkSans-Light.ttf $out/share/fonts/truetype/WorkSans-Light.ttf
     install -Dm644 WorkSans-Regular.ttf $out/share/fonts/truetype/WorkSans-Regular.ttf
     install -Dm644 WorkSans-Medium.ttf $out/share/fonts/truetype/WorkSans-Medium.ttf
     install -Dm644 WorkSans-SemiBold.ttf $out/share/fonts/truetype/WorkSans-SemiBold.ttf
     install -Dm644 WorkSans-Bold.ttf $out/share/fonts/truetype/WorkSans-Bold.ttf
     install -Dm644 WorkSans-ExtraBold.ttf $out/share/fonts/truetype/WorkSans-ExtraBold.ttf
     install -Dm644 WorkSans-Black.ttf $out/share/fonts/truetype/WorkSans-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Work Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
