#!/bin/bash
# ==================================================================
# Jetty Installation
# Jetty provides a Web server and javax.servlet container, plus support 
# for SPDY, WebSocket, OSGi, JMX, JNDI, JAAS and many other integrations.
# ==================================================================
recipe="jetty"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe}


