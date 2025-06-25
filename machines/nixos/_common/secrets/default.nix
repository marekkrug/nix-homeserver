{
  inputs,
  ...
}:
{
  # age = { # TODO remove
  #   identityPaths = [
  #     "/persist/ssh/ssh_host_ed25519_key"
  #     "/home/murmeldin/.ssh/murmeldin"
  #   ];
  #   secrets = {
  #     hashedUserPassword.file = "${inputs.secrets}/hashedUserPassword.age";
  #     sambaPassword.file = "${inputs.secrets}/sambaPassword.age";
  #     smtpPassword = {
  #       file = "${inputs.secrets}/smtpPassword.age";
  #       owner = "murmeldin";
  #       group = "murmeldin";
  #       mode = "0440";
  #     };
  #     cloudflareDnsApiCredentials.file = "${inputs.secrets}/cloudflareDnsApiCredentials.age";
  #     tailscaleAuthKey.file = "${inputs.secrets}/tailscaleAuthKey.age";
  #     resticBackblazeEnv.file = "${inputs.secrets}/resticBackblazeEnv.age";
  #     tgNotifyCredentials.file = "${inputs.secrets}/tgNotifyCredentials.age";
  #     gitIncludes.file = "${inputs.secrets}/gitIncludes.age";
  #   };
  # };
}
