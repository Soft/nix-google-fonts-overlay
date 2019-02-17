{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cinzel-decorative-${version}";
  version = "2017-05-08-201134";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/746f7045dba52d47cdca9c0aadc1a961eb860aa7/ofl/cinzeldecorative/CinzelDecorative-Regular.ttf?raw=true";
      name = "CinzelDecorative-Regular.ttf";
      sha256 = "5b862be329103ad287a10f0a53e27a40e8cc519999253f1a0223e2dc330b10b8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/746f7045dba52d47cdca9c0aadc1a961eb860aa7/ofl/cinzeldecorative/CinzelDecorative-Bold.ttf?raw=true";
      name = "CinzelDecorative-Bold.ttf";
      sha256 = "e854e68a388aa50d742a4415c1ae5c17a617ef7956c95a70021d0a4a44f20518";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/746f7045dba52d47cdca9c0aadc1a961eb860aa7/ofl/cinzeldecorative/CinzelDecorative-Black.ttf?raw=true";
      name = "CinzelDecorative-Black.ttf";
      sha256 = "a6c1eb3e228f639a98aafd8a8e8a035582dd50ad5f8a84e9dcbc8664e7457114";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CinzelDecorative-Regular.ttf $out/share/fonts/truetype/CinzelDecorative-Regular.ttf
     install -Dm644 CinzelDecorative-Bold.ttf $out/share/fonts/truetype/CinzelDecorative-Bold.ttf
     install -Dm644 CinzelDecorative-Black.ttf $out/share/fonts/truetype/CinzelDecorative-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cinzel Decorative";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
