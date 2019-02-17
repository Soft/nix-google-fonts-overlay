{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asap-condensed-${version}";
  version = "2017-07-26-232444";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/32e5e67eeb57bc282f8add6392b854b145fadc03/ofl/asapcondensed/AsapCondensed-Regular.ttf?raw=true";
      name = "AsapCondensed-Regular.ttf";
      sha256 = "302ffb7bfe60696eec189f41fe7cdd56a70d2deeffebad2441faa83a731e0389";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/32e5e67eeb57bc282f8add6392b854b145fadc03/ofl/asapcondensed/AsapCondensed-Italic.ttf?raw=true";
      name = "AsapCondensed-Italic.ttf";
      sha256 = "6e243aa0b334ab0f8c435cedbe411d08fe6b9df2542e4dc94b8dae5f1c11465b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/32e5e67eeb57bc282f8add6392b854b145fadc03/ofl/asapcondensed/AsapCondensed-Medium.ttf?raw=true";
      name = "AsapCondensed-Medium.ttf";
      sha256 = "d5c453b19cde5d7a89ffaa8e9a83f71279637f8da9cead6b68b89bd8bb3bc7fd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/32e5e67eeb57bc282f8add6392b854b145fadc03/ofl/asapcondensed/AsapCondensed-MediumItalic.ttf?raw=true";
      name = "AsapCondensed-MediumItalic.ttf";
      sha256 = "850a47be0740f7b011c42d86b1a7b7c971c8bd7cfd6fbd1a65dafd2cdc64a9ac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/32e5e67eeb57bc282f8add6392b854b145fadc03/ofl/asapcondensed/AsapCondensed-SemiBold.ttf?raw=true";
      name = "AsapCondensed-SemiBold.ttf";
      sha256 = "281deb1668e27800f3a474d329035f128de652c164873c91354eba8ee24afd79";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/32e5e67eeb57bc282f8add6392b854b145fadc03/ofl/asapcondensed/AsapCondensed-SemiBoldItalic.ttf?raw=true";
      name = "AsapCondensed-SemiBoldItalic.ttf";
      sha256 = "168cf421420510228694f6b1ab27779215eed3d41fad785bf5d0bdaa1586d1ab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/32e5e67eeb57bc282f8add6392b854b145fadc03/ofl/asapcondensed/AsapCondensed-Bold.ttf?raw=true";
      name = "AsapCondensed-Bold.ttf";
      sha256 = "129b17557e93ca846bbbf7ef2584285025cbd46ca509915bdc282cf64c51d2ba";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/32e5e67eeb57bc282f8add6392b854b145fadc03/ofl/asapcondensed/AsapCondensed-BoldItalic.ttf?raw=true";
      name = "AsapCondensed-BoldItalic.ttf";
      sha256 = "7678fe2f749823359b490feffb0eeb44cbcb33da87b378511f929336501a207d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AsapCondensed-Regular.ttf $out/share/fonts/truetype/AsapCondensed-Regular.ttf
     install -Dm644 AsapCondensed-Italic.ttf $out/share/fonts/truetype/AsapCondensed-Italic.ttf
     install -Dm644 AsapCondensed-Medium.ttf $out/share/fonts/truetype/AsapCondensed-Medium.ttf
     install -Dm644 AsapCondensed-MediumItalic.ttf $out/share/fonts/truetype/AsapCondensed-MediumItalic.ttf
     install -Dm644 AsapCondensed-SemiBold.ttf $out/share/fonts/truetype/AsapCondensed-SemiBold.ttf
     install -Dm644 AsapCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/AsapCondensed-SemiBoldItalic.ttf
     install -Dm644 AsapCondensed-Bold.ttf $out/share/fonts/truetype/AsapCondensed-Bold.ttf
     install -Dm644 AsapCondensed-BoldItalic.ttf $out/share/fonts/truetype/AsapCondensed-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Asap Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
