{
  pkgs,
  ...
}:
{
  nix.settings.trusted-users = [ "murmeldin" ];

  users = {
    users = {
      murmeldin = {
        shell = pkgs.zsh;
        uid = 1000;
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "users"
          "video"
          "podman"
          "input"
        ];
        group = "murmeldin";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKGUGMUo1dRl9xoDlMxQGb8dNSY+6xiEpbZWAu6FAbWw moe@notthebe.ee"
        ];
      };
    };
    groups = {
      murmeldin = {
        gid = 1000;
      };
    };
  };
  programs.zsh.enable = true;

}
