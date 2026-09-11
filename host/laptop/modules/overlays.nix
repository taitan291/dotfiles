final: prev: {
  libfprint = prev.libfprint.overrideAttrs (_: {
    pname = "libfprint-etu906axx-e";
    version = "1.94.9-etu906axx-e";

    src = final.fetchFromGitHub {
      owner = "likeablob";
      repo = "libfprint-fmv-etu906axx-e";
      rev = "e105528828a04dffde789cda48742c204183386d";
      hash = "sha256-Hp5as35tfzTO57uAwN9FsXp7dS23gb7TaCHrYDab74w=";
    };

    doCheck = false;
  });
}
