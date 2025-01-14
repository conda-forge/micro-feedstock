#! /usr/bin/env bash

set -eoux pipefail

go build -buildmode=pie -trimpath -o=${PREFIX}/bin/${PKG_NAME} -ldflags="-s -w" ./cmd/micro
make test

go-licenses save "${SRC_DIR}/cmd/micro" --save_path="${RECIPE_DIR}/thirdparty-licenses/"
