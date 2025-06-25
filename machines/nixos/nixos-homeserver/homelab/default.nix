{ config, lib, ... }:
let
  hl = config.homelab;
in
{
  services.fail2ban-cloudflare = {
    enable = true;
    apiKeyFile = config.sops.secrets.cloudflareFirewallApiKey;
    zoneId = "5a125e72bca5869bfb929db157d89d96";

  };
  homelab = {
    enable = true;
    baseDomain = "marekkrug.de";
    cloudflare.dnsCredentialsFile = config.sops.secrets.cloudflareDnsApiCredentials;
    timeZone = "Europe/Berlin";
    mounts = {
      config = "/persist/opt/services";
      slow = "/mnt/mergerfs_slow";
      fast = "/mnt/cache";
      merged = "/mnt/user";
    };
    samba = {
      enable = true;
      passwordFile = config.sops.secrets.sambaPassword;
      shares = {
        Backups = {
          path = "${hl.mounts.merged}/Backups";
        };
        Documents = {
          path = "${hl.mounts.fast}/Documents";
        };
        Media = {
          path = "${hl.mounts.merged}/Media";
        };
        Music = {
          path = "${hl.mounts.fast}/Media/Music";
        };
        Misc = {
          path = "${hl.mounts.merged}/Misc";
        }; 
      };
    };
    services = {
      enable = true;
      backup = {
        enable = false; # TODO
        passwordFile = config.sops.secrets.resticPassword;
        s3.enable = true;
        s3.url = "https://s3.eu-central-003.backblazeb2.com/murmeldin-ojfca-backups";
        s3.environmentFile = config.sops.secrets.resticBackblazeEnv;
        local.enable = true;
      };
      keycloak = {
        enable = false;
        dbPasswordFile = config.sops.secrets.keycloakDbPasswordFile;
        cloudflared = {
          tunnelId = "06b27fd2-4cb9-42e5-9d79-f4c4c44ca0c6";
          credentialsFile = config.sops.secrets.keycloakCloudflared;
        };
      };
      radicale = {
        enable = false;
        passwordFile = config.sops.secrets.radicaleHtpasswd;
      };
      immich = {
        enable = false; # TODO
        mediaDir = "${hl.mounts.fast}/Media/Photos"; # TODO
      };
      homepage = {
        enable = false;
        misc = [
          {
            PiKVM =
              let
                ip = config.homelab.networks.local.lan.reservations.pikvm.Address;
              in
              {
                href = "https://${ip}";
                siteMonitor = "https://${ip}";
                description = "Open-source KVM solution";
                icon = "pikvm.png";
              };
          }
          {
            FritzBox = {
              href = "http://192.168.178.1";
              siteMonitor = "http://192.168.178.1";
              description = "Cable Modem WebUI";
              icon = "avm-fritzbox.png";
            };
          }
          {
            "Immich (Parents)" = {
              href = "https://photos.aria.goose.party";
              description = "Self-hosted photo and video management solution";
              icon = "immich.svg";
              siteMonitor = "";
            };
          }
        ];
      };
      jellyfin.enable = false; # TODO
      paperless = {
        enable = false; # TODO
        passwordFile = config.sops.secrets.paperlessPassword;
      };
      sabnzbd.enable = true;
      sonarr.enable = true;
      radarr.enable = true;
      bazarr.enable = true;
      prowlarr.enable = true;
      nextcloud = {
        enable = false;
        adminpassFile = config.sops.secrets.nextcloudAdminPassword;
        cloudflared = {
          tunnelId = "cc246d42-a03d-41d4-97e2-48aa15d47297";
          credentialsFile = config.sops.secrets.nextcloudCloudflared;
        };
      };
      vaultwarden = {
        enable = false; # todo
        cloudflared = {
          tunnelId = "3bcbbc74-3667-4504-9258-f272ce006a18";
          credentialsFile = config.sops.secrets.vaultwardenCloudflared;
        };
      };
      microbin = {
        enable = false;
        cloudflared = {
          tunnelId = "216d72b6-6b2b-412f-90bc-1a44c1264871";
          credentialsFile = config.sops.secrets.microbinCloudflared;
        };
      };
      miniflux = {
        enable = false;
        cloudflared = {
          tunnelId = "9b2cac61-a439-4b1f-a979-f8519ea00e58";
          credentialsFile = config.sops.secrets.minifluxCloudflared;
        };
        adminCredentialsFile = config.sops.secrets.minifluxAdminPassword;
      };
      audiobookshelf.enable = false;
      deluge.enable = false;
      wireguard-netns = {
        enable = false;
        configFile = config.sops.secrets.wireguardCredentials;
        privateIP = "10.100.0.2";
        dnsIP = "10.100.0.1";
      };
    };
  };
}
