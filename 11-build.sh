#! /bin/bash

SOURCE="${BASH_SOURCE[0]}" . bash_get_src_dir.include

docker image build -t "$DOCKER_USER/odrive-cli" "$DIR"
