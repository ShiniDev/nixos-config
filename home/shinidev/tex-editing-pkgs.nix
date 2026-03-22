{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (texliveSmall.withPackages (
      ps: with ps; [
        latexmk
        titlesec
        enumitem
        geometry
        fullminipage
        roboto
        latexindent
        marvosym
        hvfloat
        xcolor
        hyperref
        charter
        cmap
        fontaxes
      ]
    ))
  ];

}
