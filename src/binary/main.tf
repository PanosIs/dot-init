locals {
  binary_list = [
    "obsidian",
  ]

  binary_versions = {
    obsidian = "0.13.23"
  }
}

resource "shell_script" "obsidian" {
  for_each = toset(local.binary_list)

  lifecycle_commands {
    create = file(format("${path.root}/scripts/install-%s.sh", each.value))
    read   = "echo \"{}\""
    delete = "sudo rm $(which obsidian)"
  }

  environment = {
    VERSION = local.binary_versions[each.value]
  }
}
