locals {
  files = [
    ".bashrc",
    ".bash_aliases",
    ".fzf.bash",
    ".config/starship.toml",
  ]
}

resource "local_file" "files" {
  for_each = toset(local.files)
  content  = file("${path.module}/files/${each.value}")
  filename = pathexpand("~/${each.value}")
}