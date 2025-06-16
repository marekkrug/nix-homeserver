{ stdenv }:
stdenv.mkDerivation rec {
  name = "keycloak_theme_murmeldin";
  version = "1.0";

  src = ./themes/murmeldin;

  nativeBuildInputs = [ ];
  buildInputs = [ ];

  installPhase = ''
    mkdir -p $out
    cp -a login $out
  '';
}
