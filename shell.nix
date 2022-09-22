{ juliaVersion, pkgs ? import <nixpkgs> { }, ... }:
let fhsCommand = pkgs.callPackage ./. { inherit juliaVersion; };

in pkgs.mkShell rec {
  CURL_CA_BUNDLE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  SSL_CERT_DIR = "${pkgs.cacert}/etc/ssl/certs";
  buildInputs = with pkgs; [ (fhsCommand "julia" "julia") ];

}
