final: prev:
{
  vivaldi = prev.vivaldi.overrideAttrs
      (oldAttrs: {
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [final.kdePackages.wrapQtAppsHook];
      });
}