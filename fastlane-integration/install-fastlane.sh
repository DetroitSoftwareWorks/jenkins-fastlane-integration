#!/bin/bash

mkdir -p fastlane
pushd fastlane

curl -fLO https://github.com/fastlane/fastlane/releases/latest
RELEASE_PATH="$(grep /fastlane/fastlane latest | grep .zip | sed -e 's/^.*<a href="//g' -e 's/" rel="nofollow">.*$//g')"
rm -f latest
RELEASE_FILE="$(basename ${RELEASE_PATH})"
echo "Release path: ${RELEASE_PATH}"
echo "Release file: ${RELEASE_FILE}"

if [[ ! -e ${RELEASE_FILE} ]]
then
	FASTLANE_ZIP_URL="https://github.com${RELEASE_PATH}"
	echo ${FASTLANE_ZIP_URL}
	curl -fLO ${FASTLANE_ZIP_URL}
	curl -fLO https://github.com/${RELASE_PATH}
	ln -s $(basename ${RELEASE_PATH}) fastlane.zip
fi

RELEASE_NAME=${RELEASE_FILE%".zip"}
echo ${RELEASE_NAME}

if [[ ! -d "fastlane-${RELEASE_NAME}" ]]
then
	unzip fastlane.zip
fi

rm -f fastlane-latest
ln -s "fastlane-${RELEASE_NAME}" fastlane-latest
ls -lathr fastlane-latest/
# ./install

# fastlane init

popd
