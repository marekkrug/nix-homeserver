{ inputs, ... }:
{
  imports = 
    [
      inputs.sop-nix.nixosModules.sops
    ];
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/home/murmeldin/.config/sops/age/keys.txt";
    };
    secrets = {
      wireguardCredentials = { };
      borgBackupKey = { };
      radicaleHtpasswd = { };
      cloudflareFirewallApiKey = { };
      keycloakDbPasswordFile = { }; 
      keycloakCloudflared = { }; 
      adiosBotToken = { }; 
      borgBackupSSHKey = { };
      invoiceNinja = { };
      paperlessWebdav = { };
      paperlessPassword = { };
      nextcloudCloudflared = { };
      nextcloudAdminPassword = { };
      vaultwardenCloudflared = { };
      microbinCloudflared = { };
      minifluxAdminPassword = { };
      minifluxCloudflared = { };
      duckDNSDomain = { };
      duckDNSToken = { };
      resticPassword = { };
  };
}
