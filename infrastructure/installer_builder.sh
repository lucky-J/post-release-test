#!/bin/bash

#Usage: installer_builder.sh 1.0.0

if (( $# != 1 )); then
    echo -e "Illegal number of parameters"
    exit 1
fi

VERSION=$1
CURRENT_DIR=$(pwd)
TMP_DIR="${CURRENT_DIR}/tmp"

mkdir -p "${TMP_DIR}/bin"
mkdir -p "${CURRENT_DIR}/build"
cp "${CURRENT_DIR}/index.php" "${TMP_DIR}/bin/"
cp -R "${CURRENT_DIR}/infrastructure" "${TMP_DIR}/"

echo "${VERSION}" > "${TMP_DIR}/VERSION"

cd "${TMP_DIR}"
tar cJf test.tar.gz bin/ infrastructure/sdk.Dockerfile infrastructure/sdk.local.Dockerfile infrastructure/sdk.debug.Dockerfile \
    infrastructure/debug/php/69-xdebug.ini VERSION
cd "$CURRENT_DIR"

cat "${TMP_DIR}/infrastructure/installer_header.sh" "${TMP_DIR}/test.tar.gz" > "${CURRENT_DIR}/build/installer.sh"
chmod a+x "${CURRENT_DIR}/build/installer.sh"

# Clean up

rm -rf "${TMP_DIR}"

