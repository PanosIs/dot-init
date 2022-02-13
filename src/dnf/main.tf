locals {
  dnf_packages = [
    "fd",
    "fzf",
    "git",
    "glances",
    "htop",
    "micro",
    "xclip",
    "zoxide",
    "nextcloud-client",
    "persepolis"
  ]

  dnf_external_packages = [
    "kubectl",
    "docker-ce", 
    "docker-ce-cli", 
    "containerd.io",
    "1password",
    "discord",
    "code"
  ]

  cmd_print_version = jsonencode({ "\"version\"" = "\"$(dnf repoquery $PACKAGE --installed)\"" })
}

resource "shell_script" "dnf_package" {
  for_each = toset(local.dnf_packages)

  lifecycle_commands {
    # Sudo here will actually work normally during execution, if you have a pass you will be asked for it from STDIN
    create = format("sudo dnf --setopt=install_weak_deps=False install -y $PACKAGE; echo %s", local.cmd_print_version)
    read   = format("echo %s", local.cmd_print_version)
    update = format("sudo dnf --setopt=install_weak_deps=False upgrade $PACKAGE; echo %s", local.cmd_print_version)
    delete = "sudo dnf remove -y $PACKAGE"
  }

  environment = {
    PACKAGE = each.value
  }
}


resource "shell_script" "dnf_external_package" {
  for_each = toset(local.dnf_external_packages)
  depends_on = [shell_script.external_repos]

  lifecycle_commands {
    # Sudo here will actually work normally during execution, if you have a pass you will be asked for it from STDIN
    create = format("sudo dnf --setopt=install_weak_deps=False install -y $PACKAGE; echo %s", local.cmd_print_version)
    read   = format("echo %s", local.cmd_print_version)
    update = format("sudo dnf --setopt=install_weak_deps=False upgrade $PACKAGE; echo %s", local.cmd_print_version)
    delete = "sudo dnf remove -y $PACKAGE"
  }

  environment = {
    PACKAGE = each.value
  }
}