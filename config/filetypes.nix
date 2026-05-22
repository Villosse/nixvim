{ lib, ... }:
{
  filetype = {
    extension =
      lib.genAttrs [ "tf" "tfvars" "hcl" ] (_: "terraform")
      // lib.genAttrs [ "tig" "tih" ] (_: "tiger")
      // {
        mly = "menhir";
        mli = "ocamlinterface";
        mll = "ocamllex";
        re = "reason";
        rei = "reason";
      };
    pattern = {
    };
  };
}
