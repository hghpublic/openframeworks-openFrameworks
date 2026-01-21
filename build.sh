#!/bin/sh

git clean -dxf

clean
set -ex

cd scripts/linux || exit
sudo ./download_libs.sh 2>&1 | sudo tee "${WORKSPACE_ROOT}"/dev/logs/download_libs.sh.log > /dev/null
cd - || exit

cd scripts/linux/ubuntu || exit
sudo ./install_dependencies.sh 2>&1 | sudo tee "${WORKSPACE_ROOT}"/dev/logs/install_dependencies.sh.log > /dev/null
cd - || exit

cd scripts/linux || exit
./compileOF.sh -j3 2>&1 | tee "${WORKSPACE_ROOT}"/dev/logs/compileOF.sh.log > /dev/null
cd - || exit
