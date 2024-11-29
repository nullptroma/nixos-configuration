final: prev:
{
  vivaldi = prev.vivaldi.overrideAttrs
      (oldAttrs: {
        dontWrapQtApps = false;
        dontPatchELF = true;
        proprietaryCodecs = true;
        enableWidevine = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [final.kdePackages.wrapQtAppsHook];
      });
}