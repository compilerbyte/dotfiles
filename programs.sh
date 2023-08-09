#!/usr/bin/env bash

apps=(zsh )

# Print usage message.
usage() {
    local program_name
    program_name=${0##*/}
    cat <<EOF
Usage: $program_name [-option]

Options:
    --help    Print this message
    -i        Install programs 
    -r        Delete programs
EOF
}

detect_os(){
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      if [ -f "/etc/lsb-release" ]; then
          # Ubuntu/Debian
          install_debian
      elif [ -f "/etc/redhat-release" ]; then
          # CentOS/RHEL
          install_fedora
      else
          echo "Not supported on your system"
      fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
      # macOS
      install_mac
  else
      echo "Sistema operativo no compatible"
  fi
}

install_fedora() {
  sudo yum update
  sudo yum install -y zsh
}


uninstall_fedora(){
  sudo yum remove zsh
}

install_debian(){
  echo test
}


uninstall_debian() {
  echo test
}


install_mac() {
  echo test
}


uninstall_mac() {
  echo test
}

main() {
    case "$1" in
        ''|-h|--help)
            usage
            exit 0
            ;;
        -i)
            detect_os
            ;;
        -r)
            uninstall_dotfiles
            ;;
        *)
            echo "Command not found" >&2
            exit 1
    esac
}

main "$@"
