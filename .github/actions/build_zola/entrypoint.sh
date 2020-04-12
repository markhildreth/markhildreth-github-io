#!/bin/bash
set -eo pipefail

if [[ -z "$TOKEN" ]]; then
    echo "Set the TOKEN env variable."
    exit 1
fi

BRANCH="master"
BUILD_DIR="."
REMOTE_REPO="markhildreth/markhildreth.github.io"

main() {
    echo "Starting deploy..."

    version=$(zola --version)
    remote_repo="https://${TOKEN}@github.com/${REMOTE_REPO}.git"

    echo "Using $version"

    echo "Building in $BUILD_DIR directory"
    cd $BUILD_DIR
    
    echo Building with flags: ${BUILD_FLAGS:+"$BUILD_FLAGS"}
    zola build ${BUILD_FLAGS:+"$BUILD_FLAGS"}

    echo "Pushing artifacts to ${REMOTE_REPO}:$BRANCH"

    cd public
    git init
    git config user.name "GitHub Actions"
    git config user.email "github-actions-bot@users.noreply.github.com"
    git add .

    git commit -m "Deploy Zola site to ${REMOTE_REPO}:$BRANCH"
    git push --force "${remote_repo}" master:${BRANCH}

    echo "Deploy complete"
}

main "$@"
