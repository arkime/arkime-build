# arkime-build
This repo is used to create the docker containers that Arkime is built with.
These containers are NOT for running Arkime.

To make new images, push the Dockerfile changes and run the Build containers workflow with a new version tag (always increment it after any change, runners and registries cache images by tag so reusing one can run the old image), from the Actions tab or with `gh workflow run build.yml -R arkime/arkime-build -f version=7.0.0-5 -f arkime_branch=multidb -f targets=10,10-arm64,f44,f44-arm64`. Leaving targets blank builds every image in `.github/images.json`. The images are pushed to `ghcr.io/arkime/arkime-build-<name>:<version>`; then point the `container` entries in arkime's `.github/workflows/versions` at the new tag.
