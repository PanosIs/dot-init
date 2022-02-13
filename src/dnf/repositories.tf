resource "shell_script" "external_repos" {
  lifecycle_commands {
    create = file("${path.root}/scripts/external-repo-add.sh")
    read   = "echo \"{}\""
    delete = file("${path.root}/scripts/external-repo-remove.sh")
  }
}