{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montserrat-alternates-${version}";
  version = "2017-11-03-205118";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-Thin.ttf?raw=true";
      name = "MontserratAlternates-Thin.ttf";
      sha256 = "51c6e65e305eab5e9ae47ee6334c6cf615e66418dfdb168128a700cd65a6ba97";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-ThinItalic.ttf?raw=true";
      name = "MontserratAlternates-ThinItalic.ttf";
      sha256 = "66f562ad5ff8be653ddf8e194db669b9a8e56571c24d6539fe92d178b1d7e07a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-ExtraLight.ttf?raw=true";
      name = "MontserratAlternates-ExtraLight.ttf";
      sha256 = "61a5008e6564e427593d35e1799d9f230c33f502f9632e75f45935f8eb345e02";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-ExtraLightItalic.ttf?raw=true";
      name = "MontserratAlternates-ExtraLightItalic.ttf";
      sha256 = "bbf6a02448865d2085601ef2b9de2571e4c77fbb9a2bd3cffffc35981e6a11a5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-Light.ttf?raw=true";
      name = "MontserratAlternates-Light.ttf";
      sha256 = "70288e0bda9b8680c2b2fae4c3c6690bb97cb2196a6335ff626b2fe32d5070e9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-LightItalic.ttf?raw=true";
      name = "MontserratAlternates-LightItalic.ttf";
      sha256 = "df4174a4836a8f7131f9b2a46f4a7a111a405a28a8a3819da524c96093216d21";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-Regular.ttf?raw=true";
      name = "MontserratAlternates-Regular.ttf";
      sha256 = "3b7c563f2087888279fdb7c21cc57b073ba1931dbe413e1202485b46ebfb7ead";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-Italic.ttf?raw=true";
      name = "MontserratAlternates-Italic.ttf";
      sha256 = "eda385390e3149fb3138f250a949bcec412793484aa99508148322eefdb825d6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-Medium.ttf?raw=true";
      name = "MontserratAlternates-Medium.ttf";
      sha256 = "acd0b8e8ca755b4304caccf9d2c8432c2b60e8a4f292415e8c468ed12c974779";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-MediumItalic.ttf?raw=true";
      name = "MontserratAlternates-MediumItalic.ttf";
      sha256 = "1e2e65e29ce84de715fe4aca89b5b6ef0cba823c4c7e68f559ef85f648135186";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-SemiBold.ttf?raw=true";
      name = "MontserratAlternates-SemiBold.ttf";
      sha256 = "8596df6b4c8c51d227ad7bed7a69d6d7bbd4fcb388a318e0afd8e29135c7d909";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-SemiBoldItalic.ttf?raw=true";
      name = "MontserratAlternates-SemiBoldItalic.ttf";
      sha256 = "8b2f9a4a694fd9fa487ad387d8f96e3e74d5e462a930af7eaa0a22c843e148e0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-Bold.ttf?raw=true";
      name = "MontserratAlternates-Bold.ttf";
      sha256 = "98f35386bc203067407b20ff1f22eefd750c9ff3e637a6bfb36b2a2ef3b8fbb0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-BoldItalic.ttf?raw=true";
      name = "MontserratAlternates-BoldItalic.ttf";
      sha256 = "11004d3d235bda580fe5ed7e70d6c617919ce91e5521f6734929a8844a65a1b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-ExtraBold.ttf?raw=true";
      name = "MontserratAlternates-ExtraBold.ttf";
      sha256 = "66dcd7efa7e568113a958864e68f45ed18bc96eacc16b5d2c1a85ffeedb9dfc6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-ExtraBoldItalic.ttf?raw=true";
      name = "MontserratAlternates-ExtraBoldItalic.ttf";
      sha256 = "0cacbf2c2fbaaff1b6a86db6c9554f0d0bb5460b2e8e23758fa5d859df854fc1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-Black.ttf?raw=true";
      name = "MontserratAlternates-Black.ttf";
      sha256 = "6fa4bf87ef8927790cc11cc87b8bcadefe2d8a1326664b6d750f5b4e5e2cf943";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b80d67e4275eb6101d67c4a70c25a82ec2210cb/ofl/montserratalternates/MontserratAlternates-BlackItalic.ttf?raw=true";
      name = "MontserratAlternates-BlackItalic.ttf";
      sha256 = "fe505e4ec2d6a5863ab1bb42e3e721d95a987dd93abd10d3cdfd4c53594e3d31";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MontserratAlternates-Thin.ttf $out/share/fonts/truetype/MontserratAlternates-Thin.ttf
     install -Dm644 MontserratAlternates-ThinItalic.ttf $out/share/fonts/truetype/MontserratAlternates-ThinItalic.ttf
     install -Dm644 MontserratAlternates-ExtraLight.ttf $out/share/fonts/truetype/MontserratAlternates-ExtraLight.ttf
     install -Dm644 MontserratAlternates-ExtraLightItalic.ttf $out/share/fonts/truetype/MontserratAlternates-ExtraLightItalic.ttf
     install -Dm644 MontserratAlternates-Light.ttf $out/share/fonts/truetype/MontserratAlternates-Light.ttf
     install -Dm644 MontserratAlternates-LightItalic.ttf $out/share/fonts/truetype/MontserratAlternates-LightItalic.ttf
     install -Dm644 MontserratAlternates-Regular.ttf $out/share/fonts/truetype/MontserratAlternates-Regular.ttf
     install -Dm644 MontserratAlternates-Italic.ttf $out/share/fonts/truetype/MontserratAlternates-Italic.ttf
     install -Dm644 MontserratAlternates-Medium.ttf $out/share/fonts/truetype/MontserratAlternates-Medium.ttf
     install -Dm644 MontserratAlternates-MediumItalic.ttf $out/share/fonts/truetype/MontserratAlternates-MediumItalic.ttf
     install -Dm644 MontserratAlternates-SemiBold.ttf $out/share/fonts/truetype/MontserratAlternates-SemiBold.ttf
     install -Dm644 MontserratAlternates-SemiBoldItalic.ttf $out/share/fonts/truetype/MontserratAlternates-SemiBoldItalic.ttf
     install -Dm644 MontserratAlternates-Bold.ttf $out/share/fonts/truetype/MontserratAlternates-Bold.ttf
     install -Dm644 MontserratAlternates-BoldItalic.ttf $out/share/fonts/truetype/MontserratAlternates-BoldItalic.ttf
     install -Dm644 MontserratAlternates-ExtraBold.ttf $out/share/fonts/truetype/MontserratAlternates-ExtraBold.ttf
     install -Dm644 MontserratAlternates-ExtraBoldItalic.ttf $out/share/fonts/truetype/MontserratAlternates-ExtraBoldItalic.ttf
     install -Dm644 MontserratAlternates-Black.ttf $out/share/fonts/truetype/MontserratAlternates-Black.ttf
     install -Dm644 MontserratAlternates-BlackItalic.ttf $out/share/fonts/truetype/MontserratAlternates-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Montserrat Alternates";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
