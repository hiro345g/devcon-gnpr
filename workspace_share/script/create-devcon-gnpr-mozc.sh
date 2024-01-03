#!/bin/sh
BASE_DIR=$(cd $(dirname $0)/..;pwd)
DEV_DIR=${BASE_DIR}/dev
DIST_DIR=${BASE_DIR}/devcon-gnpr-202312-mozc

if [ ! -e ${DEV_DIR}/devcon-gnpr-202312 ]; then
  cd ${DEV_DIR}/
  wget https://github.com/hiro345g/devcon-gnpr/archive/refs/heads/main.zip
  unzip ${DEV_DIR}/main.zip
  mv ${DEV_DIR}/devcon-gnpr-main ${DEV_DIR}/devcon-gnpr-202312
  rm ${DEV_DIR}/main.zip
fi
if [ ! -e ${DIST_DIR}/.devcontainer ]; then mkdir -p ${DIST_DIR}/.devcontainer; fi
if [ ! -e ${DIST_DIR}/workspace_share ]; then mkdir -p ${DIST_DIR}/workspace_share; fi
cp -r ${DEV_DIR}/devcon-gnpr-202312/.devcontainer/* ${DIST_DIR}/.devcontainer/
cp -r ${DEV_DIR}/devcon-gnpr-202312/docker-compose.yml ${DIST_DIR}/
sed -i 's/devcon-gnpr-202312/devcon-gnpr-202312-mozc/' ${DIST_DIR}/.devcontainer/devcontainer.json
sed -i 's/devcon-gnpr-202312/devcon-gnpr-202312-mozc/' ${DIST_DIR}/docker-compose.yml

rm -fr ${DEV_DIR}/devcon-gnpr-202312
