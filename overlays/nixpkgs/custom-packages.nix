{ self }: final: prev: {
  custom = prev.callPackage (self + /custom-packages) {};
}