module "brew" {
  source = "./brew"
}

module "dnf" {
  source = "./dnf"
}

module "interactive" {
  count = var.interactive ? 1 : 0
  source = "./interactive"
}