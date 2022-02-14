locals {
  files = [
    ".bashrc",
    ".bash_aliases",
    ".config/starship.toml",
  ]


  files_templated = [
    ".gitconfig",
  ]

  template_vars = {
    EMAIL    = var.email
    NAME     = var.name
  }
}

resource "local_file" "files" {
  for_each = toset(local.files)
  content  = file("${path.module}/files/${each.value}")
  filename = pathexpand("~/${each.value}")
}

resource "local_file" "template_file" {
  for_each = toset(local.files_templated)
  content  = templatefile("${path.module}/files-templated/${each.value}", local.template_vars)
  filename = pathexpand("~/${each.value}")
}