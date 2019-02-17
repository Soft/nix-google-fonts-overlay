{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-mono-${version}";
  version = "2019-02-15-013019";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-Thin.ttf?raw=true";
      name = "IBMPlexMono-Thin.ttf";
      sha256 = "c3a4de8e1b59eb9069066dfcac45903edc297cc203993e6f7adeb5d8ed00356f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-ThinItalic.ttf?raw=true";
      name = "IBMPlexMono-ThinItalic.ttf";
      sha256 = "ead2652af310bf8ca5292ee6ef2b32bea3f87d5a7f0ebe3f6d0fe45234be0e10";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-ExtraLight.ttf?raw=true";
      name = "IBMPlexMono-ExtraLight.ttf";
      sha256 = "25f28dd05270f72b519d9beae7da2e46632df5aa045cca67e7ddf0e9285e5f3a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexMono-ExtraLightItalic.ttf";
      sha256 = "437d279ec2904184f8203402e562b397427df28fa7d1bb5675cb3e79344dfb38";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-Light.ttf?raw=true";
      name = "IBMPlexMono-Light.ttf";
      sha256 = "d6ae45c0884e2df9e57376a4ead8b4390fb7cebf8f9874ccf21c9037f8ca6b00";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-LightItalic.ttf?raw=true";
      name = "IBMPlexMono-LightItalic.ttf";
      sha256 = "6314eb374fc69b4c1ff352d96dc68954a2cbfdbffc91a82a10dcff1db5aa6c40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-Regular.ttf?raw=true";
      name = "IBMPlexMono-Regular.ttf";
      sha256 = "4ce3632e13a3635b6a39e4149bb2674e883c565cc2ff1b2cecd3b654a0c16e50";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-Italic.ttf?raw=true";
      name = "IBMPlexMono-Italic.ttf";
      sha256 = "5d634c60f366f9daa1e34d658ac149045fd1e6d1148a4e19e4c24672c6850dc5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-Medium.ttf?raw=true";
      name = "IBMPlexMono-Medium.ttf";
      sha256 = "f5da3c95bfd939b910e84c1e898fdb99befdbd9017f18510b8682c8988a4e7da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-MediumItalic.ttf?raw=true";
      name = "IBMPlexMono-MediumItalic.ttf";
      sha256 = "b1c894851af779fdf9cbbdccd09040e1956a71982c18918d64530993c38fccfb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-SemiBold.ttf?raw=true";
      name = "IBMPlexMono-SemiBold.ttf";
      sha256 = "be4eb6fe01c2db64b3ee75d67c400321a0bae4922f669e9ebe97aeb1672b1273";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexMono-SemiBoldItalic.ttf";
      sha256 = "86a0906b869df313cfafcfefeed02be184ed0f9f0bfbc965f752c5bfa66ff3b8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-Bold.ttf?raw=true";
      name = "IBMPlexMono-Bold.ttf";
      sha256 = "0959685fb3dfd306525a6d3ee11489726ddec1a5797750abdc8844e34a20fe01";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexmono/IBMPlexMono-BoldItalic.ttf?raw=true";
      name = "IBMPlexMono-BoldItalic.ttf";
      sha256 = "faf40ad4f8a86692c052355bcf59f72c2fbd8fb8849731bfa1a70a0e870f311f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexMono-Thin.ttf $out/share/fonts/truetype/IBMPlexMono-Thin.ttf
     install -Dm644 IBMPlexMono-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexMono-ThinItalic.ttf
     install -Dm644 IBMPlexMono-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexMono-ExtraLight.ttf
     install -Dm644 IBMPlexMono-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexMono-ExtraLightItalic.ttf
     install -Dm644 IBMPlexMono-Light.ttf $out/share/fonts/truetype/IBMPlexMono-Light.ttf
     install -Dm644 IBMPlexMono-LightItalic.ttf $out/share/fonts/truetype/IBMPlexMono-LightItalic.ttf
     install -Dm644 IBMPlexMono-Regular.ttf $out/share/fonts/truetype/IBMPlexMono-Regular.ttf
     install -Dm644 IBMPlexMono-Italic.ttf $out/share/fonts/truetype/IBMPlexMono-Italic.ttf
     install -Dm644 IBMPlexMono-Medium.ttf $out/share/fonts/truetype/IBMPlexMono-Medium.ttf
     install -Dm644 IBMPlexMono-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexMono-MediumItalic.ttf
     install -Dm644 IBMPlexMono-SemiBold.ttf $out/share/fonts/truetype/IBMPlexMono-SemiBold.ttf
     install -Dm644 IBMPlexMono-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexMono-SemiBoldItalic.ttf
     install -Dm644 IBMPlexMono-Bold.ttf $out/share/fonts/truetype/IBMPlexMono-Bold.ttf
     install -Dm644 IBMPlexMono-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexMono-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "IBM Plex Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
