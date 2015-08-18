#!/bin/bash

# ======================================================================
# Lib Loader
# Manage the sourcing of lib files so they don't muck up the main page
# ======================================================================

source "${DIR}"/lib/inet_check.sh
source "${DIR}"/lib/results.sh
source "${DIR}"/lib/dependency_check.sh
source "${DIR}"/lib/install.sh
source "${DIR}"/lib/cleanup_install_files.sh
source "${DIR}"/lib/persist_sudo.sh
