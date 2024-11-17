{ python3Packages, pkgs }:
python3Packages.buildPythonApplication rec {
    pname = "adb-wifi";
    version = "1.0.0";
    format = "other";

    propagatedBuildInputs = (with python3Packages; [
      python-nmap
      netifaces
      netaddr
    ]) ++ (with pkgs; [ 
      android-tools
      gawk
    ]);

    dontUnpack = true;
    installPhase = ''
        install -Dm755 ${./${pname}} $out/bin/${pname}
    '';
}
