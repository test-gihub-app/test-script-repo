#!/bin/bash

# Install commitlint globally using npm
# npm install --save-dev @commitlint/cli
npm install --save-dev @commitlint/{cli,config-conventional}
# Install husky as a dev dependency in the current project
npm install --save-dev husky

# Verify installation
commitlint --version
husky --version

# Initialize commitlint configuration
echo "module.exports = { extends: ['@commitlint/config-conventional'] };" > commitlint.config.js

# Configure husky to use commitlint for pre-commit hook
npx husky install
npx husky add .husky/pre-commit "npx --no-install commitlint --edit $1"

# Display success message
echo "Commitlint and Husky installed successfully."
