{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spectral-sc-${version}";
  version = "2017-11-06-185023";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-ExtraLight.ttf?raw=true";
      name = "SpectralSC-ExtraLight.ttf";
      sha256 = "839ac691b6dc8c45fb3064ec76fba142460ef646b6606428241934e40d4a9018";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-ExtraLightItalic.ttf?raw=true";
      name = "SpectralSC-ExtraLightItalic.ttf";
      sha256 = "e51d200a94ff8b857a8d025d241e090d8282a6eb550bbb57026c76420801b8b2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-Light.ttf?raw=true";
      name = "SpectralSC-Light.ttf";
      sha256 = "7a94fa05fc197cc847f52dbd0ad74a37cc496bfdb476db7bcd011675a3a1eac8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-LightItalic.ttf?raw=true";
      name = "SpectralSC-LightItalic.ttf";
      sha256 = "b5d9f0824c9b8134d8691569e7ef7932e8cb4ed0cd9167ce5bc86f295c6a5644";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-Regular.ttf?raw=true";
      name = "SpectralSC-Regular.ttf";
      sha256 = "51e500a1da755ae02f0671a5b20a9f2caf71e8e19cbe6310aa4351011bc064df";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-Italic.ttf?raw=true";
      name = "SpectralSC-Italic.ttf";
      sha256 = "6c8286139466725dbc5798ceddcdb791d953b63fec1c331b5805ebc398a25c9e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-Medium.ttf?raw=true";
      name = "SpectralSC-Medium.ttf";
      sha256 = "a4f4f95bb91570da0b184911c7a6a1140666fbab566276f36b9a515ac63d2671";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-MediumItalic.ttf?raw=true";
      name = "SpectralSC-MediumItalic.ttf";
      sha256 = "05d4cbe413259ea6191c9f5ba21854396ac2b29d7458567b84209c6616bef311";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-SemiBold.ttf?raw=true";
      name = "SpectralSC-SemiBold.ttf";
      sha256 = "2e30211d187931f4961930cfcde6ebddb969c48ad2fe3efcbabc9833637a3d21";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-SemiBoldItalic.ttf?raw=true";
      name = "SpectralSC-SemiBoldItalic.ttf";
      sha256 = "f60bedd721677e2b418aa16d8a74261a76d18db43859e31c34febca0555da9a2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-Bold.ttf?raw=true";
      name = "SpectralSC-Bold.ttf";
      sha256 = "c1562b5023a0dd2f0b2bbb55cb18882861585257d5e2526ffe25732a317bde8e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-BoldItalic.ttf?raw=true";
      name = "SpectralSC-BoldItalic.ttf";
      sha256 = "c916d13bf918e1cd11130ade106db3571f15928a24f16ee47a683ca08d23fa6f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-ExtraBold.ttf?raw=true";
      name = "SpectralSC-ExtraBold.ttf";
      sha256 = "424127c5640fbbcac5bcbeac4b819ae6f15601a5d739fce35e0c1547757e2be0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/692e5efbeb6c642492829651da3abaa4780a89ad/ofl/spectralsc/SpectralSC-ExtraBoldItalic.ttf?raw=true";
      name = "SpectralSC-ExtraBoldItalic.ttf";
      sha256 = "dd9522e9f9b0fdb8bfa281355204c77b389021c8943dd9d93e1a4b5db9879a53";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpectralSC-ExtraLight.ttf $out/share/fonts/truetype/SpectralSC-ExtraLight.ttf
     install -Dm644 SpectralSC-ExtraLightItalic.ttf $out/share/fonts/truetype/SpectralSC-ExtraLightItalic.ttf
     install -Dm644 SpectralSC-Light.ttf $out/share/fonts/truetype/SpectralSC-Light.ttf
     install -Dm644 SpectralSC-LightItalic.ttf $out/share/fonts/truetype/SpectralSC-LightItalic.ttf
     install -Dm644 SpectralSC-Regular.ttf $out/share/fonts/truetype/SpectralSC-Regular.ttf
     install -Dm644 SpectralSC-Italic.ttf $out/share/fonts/truetype/SpectralSC-Italic.ttf
     install -Dm644 SpectralSC-Medium.ttf $out/share/fonts/truetype/SpectralSC-Medium.ttf
     install -Dm644 SpectralSC-MediumItalic.ttf $out/share/fonts/truetype/SpectralSC-MediumItalic.ttf
     install -Dm644 SpectralSC-SemiBold.ttf $out/share/fonts/truetype/SpectralSC-SemiBold.ttf
     install -Dm644 SpectralSC-SemiBoldItalic.ttf $out/share/fonts/truetype/SpectralSC-SemiBoldItalic.ttf
     install -Dm644 SpectralSC-Bold.ttf $out/share/fonts/truetype/SpectralSC-Bold.ttf
     install -Dm644 SpectralSC-BoldItalic.ttf $out/share/fonts/truetype/SpectralSC-BoldItalic.ttf
     install -Dm644 SpectralSC-ExtraBold.ttf $out/share/fonts/truetype/SpectralSC-ExtraBold.ttf
     install -Dm644 SpectralSC-ExtraBoldItalic.ttf $out/share/fonts/truetype/SpectralSC-ExtraBoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Spectral SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
