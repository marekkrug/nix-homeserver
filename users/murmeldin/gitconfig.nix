{
  inputs,
  lib,
  config,
  ...
}:
{
  age.secrets.gitIncludes = {
    file = "${inputs.secrets}/gitIncludes.age";
    path = "$HOME/.config/git/includes";
  };

  programs.git = {
    enable = true;
    userName = "murmeldin";
    userEmail = "git@marekkrug.de";

    extraConfig = {
      core = {
        sshCommand = "ssh -o 'IdentitiesOnly=yes' -i ~/.ssh/murmeldin";
      };
    };
    includes = [
      {
        path = "~" + (lib.removePrefix "$HOME" config.sops.secrets.gitIncludes.path);
        condition = "gitdir:~/Workspace/Projects/";
      }
    ];
  };
}
