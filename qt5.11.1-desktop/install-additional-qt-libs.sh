#!/bin/sh

if [ $# -lt 2 ];
then
    echo
    echo "install-additional-qt-libs.sh path-to-qt-root-dir qt-version"
    echo " - path-to-qt-root-dir => /opt/Qt"
    echo " - qt-version => 5.11.1"
    echo
    exit -1
fi

QT_ROOT_PATH=$1
QT_VERSION=$2

QT_PATH=${QT_ROOT_PATH}/${QT_VERSION}
QT_BIN_DIR=${QT_PATH}/gcc_64/bin

export PATH=${QT_BIN_DIR}:${PATH}

if [ ! -d "$QT_BIN_DIR" ]; then
    echo
    echo "Qt bin dir not exist: $QT_BIN_DIR"
    echo
    exit -1
fi

# Install QtJsonSerializer libs
echo "Install QtJsonSerializer libs"
TAR_PATH=/tmp/QtJsonSerializer.tar.xz
curl -L -o ${TAR_PATH} https://github.com/Skycoder42/QtJsonSerializer/releases/download/3.1.2-3/build_gcc_64_${QT_VERSION}.tar.xz

tar -xJvf ${TAR_PATH} -C ${QT_PATH}

rm ${TAR_PATH}
