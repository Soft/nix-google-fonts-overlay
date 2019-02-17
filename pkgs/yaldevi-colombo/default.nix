{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yaldevi-colombo-${version}";
  version = "2017-02-21-164106";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5daa9b3547005dba41ff8338a2bc8adf2f8fc087/ofl/yaldevicolombo/YaldeviColombo-ExtraLight.ttf?raw=true";
      name = "YaldeviColombo-ExtraLight.ttf";
      sha256 = "f20e9ebeb4d2b675de55723341ffecb39ab978f52a8e13dfa81eb152709b3919";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5daa9b3547005dba41ff8338a2bc8adf2f8fc087/ofl/yaldevicolombo/YaldeviColombo-Light.ttf?raw=true";
      name = "YaldeviColombo-Light.ttf";
      sha256 = "32a7effe1259d7b678b2eb0f2549cddf95fa20c75f573f8c06bdc220f7b4e7b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5daa9b3547005dba41ff8338a2bc8adf2f8fc087/ofl/yaldevicolombo/YaldeviColombo-Regular.ttf?raw=true";
      name = "YaldeviColombo-Regular.ttf";
      sha256 = "5577ba8af289a7c6bf2fa9d6afa653435a382c4cb41323adb7fa530db5440214";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5daa9b3547005dba41ff8338a2bc8adf2f8fc087/ofl/yaldevicolombo/YaldeviColombo-Medium.ttf?raw=true";
      name = "YaldeviColombo-Medium.ttf";
      sha256 = "0f9f4595dda66c8daa56f61689c62f897b21a4801b90dbe65b9803aef7c20eef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5daa9b3547005dba41ff8338a2bc8adf2f8fc087/ofl/yaldevicolombo/YaldeviColombo-SemiBold.ttf?raw=true";
      name = "YaldeviColombo-SemiBold.ttf";
      sha256 = "35e399999d7f8d84d28d21359d743ef8ad7c1f46a96b0096b2b0b9d684583414";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5daa9b3547005dba41ff8338a2bc8adf2f8fc087/ofl/yaldevicolombo/YaldeviColombo-Bold.ttf?raw=true";
      name = "YaldeviColombo-Bold.ttf";
      sha256 = "71df5bd96f75e17a78fb818b7fc7157cf70831c6764023611a146480a33a7305";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YaldeviColombo-ExtraLight.ttf $out/share/fonts/truetype/YaldeviColombo-ExtraLight.ttf
     install -Dm644 YaldeviColombo-Light.ttf $out/share/fonts/truetype/YaldeviColombo-Light.ttf
     install -Dm644 YaldeviColombo-Regular.ttf $out/share/fonts/truetype/YaldeviColombo-Regular.ttf
     install -Dm644 YaldeviColombo-Medium.ttf $out/share/fonts/truetype/YaldeviColombo-Medium.ttf
     install -Dm644 YaldeviColombo-SemiBold.ttf $out/share/fonts/truetype/YaldeviColombo-SemiBold.ttf
     install -Dm644 YaldeviColombo-Bold.ttf $out/share/fonts/truetype/YaldeviColombo-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Yaldevi Colombo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
