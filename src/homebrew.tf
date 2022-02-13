resource "shell_script" "homebrew_install" {
  lifecycle_commands {
    # Sudo here will actually work normally during execution, if you have a pass you will be asked for it from STDIN
    create = "echo | /bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\" > /dev/null"
    read   = "echo \"{}\""
    delete = "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)\""
  }
}