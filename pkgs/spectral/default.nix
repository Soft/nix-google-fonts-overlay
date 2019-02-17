{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spectral-${version}";
  version = "2017-11-06-185002";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-ExtraLight.ttf?raw=true";
      name = "Spectral-ExtraLight.ttf";
      sha256 = "51b068460469fb9be9ff81a350102b8eef7d39e0d1f3ace87d9a2e518f0e7f68";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-ExtraLightItalic.ttf?raw=true";
      name = "Spectral-ExtraLightItalic.ttf";
      sha256 = "c880181264feed10195cf2bb4a439551a9acca3e190256a30be939a48b4ec4e6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-Light.ttf?raw=true";
      name = "Spectral-Light.ttf";
      sha256 = "68efd194d714f1471a38cd5451daa47516c39e50310191a0b61e54252fa2a01f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-LightItalic.ttf?raw=true";
      name = "Spectral-LightItalic.ttf";
      sha256 = "103f14954b4fc44cac98d90ddd27aae5e733b3a465fadd1f6e0c0976abda28f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-Regular.ttf?raw=true";
      name = "Spectral-Regular.ttf";
      sha256 = "fb147ad6ef88dfa39d06e368f08ac84a86274bb0590466af146fe06cd4a287a2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-Italic.ttf?raw=true";
      name = "Spectral-Italic.ttf";
      sha256 = "a14d10bc698bb5561c1ee5097dbb8e57cc521ba9699a8fa2f6fe5bb2f9325d25";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-Medium.ttf?raw=true";
      name = "Spectral-Medium.ttf";
      sha256 = "c210f15365a7bc8e1f0b9991ebe88cc66237fd7159d2975826f427a69c7e6808";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-MediumItalic.ttf?raw=true";
      name = "Spectral-MediumItalic.ttf";
      sha256 = "33b6d201be5e778bdd5e2cd7414a90aa8415563cd348cc16bc6bacc2a58fb4cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-SemiBold.ttf?raw=true";
      name = "Spectral-SemiBold.ttf";
      sha256 = "376abb0253fa6e517c8b7d5c83cfde93c4ada07858143927e62c330bc084fd77";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-SemiBoldItalic.ttf?raw=true";
      name = "Spectral-SemiBoldItalic.ttf";
      sha256 = "d0d8a8f0029e3e584195331f898f12b243521fe63b18ed30ec9bc557c1e18e1c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-Bold.ttf?raw=true";
      name = "Spectral-Bold.ttf";
      sha256 = "5f93ecd9966a3a1581a949c9f882eced5f93015104e7df1ea80c37ffd9986f31";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-BoldItalic.ttf?raw=true";
      name = "Spectral-BoldItalic.ttf";
      sha256 = "ce2e6e87edd549c5d6b4f72caaf2d7e4df51d101733b2e5c19b17e5e2e5459ae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-ExtraBold.ttf?raw=true";
      name = "Spectral-ExtraBold.ttf";
      sha256 = "99f385f4df531a481cede2166f396f8bc130bf3c0919c794ec30ac437c63894a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68de4ebfd9566ea5d6e759218bf1f0280bc2df1b/ofl/spectral/Spectral-ExtraBoldItalic.ttf?raw=true";
      name = "Spectral-ExtraBoldItalic.ttf";
      sha256 = "8bd936f5c046f5169c1601e669e5ffbbfb6d8f9f9004c40f53a452394249f8fb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Spectral-ExtraLight.ttf $out/share/fonts/truetype/Spectral-ExtraLight.ttf
     install -Dm644 Spectral-ExtraLightItalic.ttf $out/share/fonts/truetype/Spectral-ExtraLightItalic.ttf
     install -Dm644 Spectral-Light.ttf $out/share/fonts/truetype/Spectral-Light.ttf
     install -Dm644 Spectral-LightItalic.ttf $out/share/fonts/truetype/Spectral-LightItalic.ttf
     install -Dm644 Spectral-Regular.ttf $out/share/fonts/truetype/Spectral-Regular.ttf
     install -Dm644 Spectral-Italic.ttf $out/share/fonts/truetype/Spectral-Italic.ttf
     install -Dm644 Spectral-Medium.ttf $out/share/fonts/truetype/Spectral-Medium.ttf
     install -Dm644 Spectral-MediumItalic.ttf $out/share/fonts/truetype/Spectral-MediumItalic.ttf
     install -Dm644 Spectral-SemiBold.ttf $out/share/fonts/truetype/Spectral-SemiBold.ttf
     install -Dm644 Spectral-SemiBoldItalic.ttf $out/share/fonts/truetype/Spectral-SemiBoldItalic.ttf
     install -Dm644 Spectral-Bold.ttf $out/share/fonts/truetype/Spectral-Bold.ttf
     install -Dm644 Spectral-BoldItalic.ttf $out/share/fonts/truetype/Spectral-BoldItalic.ttf
     install -Dm644 Spectral-ExtraBold.ttf $out/share/fonts/truetype/Spectral-ExtraBold.ttf
     install -Dm644 Spectral-ExtraBoldItalic.ttf $out/share/fonts/truetype/Spectral-ExtraBoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Spectral";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
