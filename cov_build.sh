#!/bin/bash
set -x
set -e
##############################
GITHUB_WORKSPACE="${PWD}"
ls -la ${GITHUB_WORKSPACE}
############################

# Build entservices-usersettings
echo "building entservices-usersettings"

cd ${GITHUB_WORKSPACE}
cmake -G Ninja -S "$GITHUB_WORKSPACE" -B build/entservices-usersettings \


cmake --build build/entservices-usersettings --target install
echo "======================================================================================"
# Build usersettings plugin only
echo "building usersettings plugin"

cd ${GITHUB_WORKSPACE}
cmake -G Ninja -S "$GITHUB_WORKSPACE" -B build/usersettings \
	-DUSE_THUNDER_R4=ON \
	-DCMAKE_INSTALL_PREFIX="$GITHUB_WORKSPACE/install/usr" \
	-DCMAKE_MODULE_PATH="$GITHUB_WORKSPACE/install/tools/cmake" \
	-DCMAKE_VERBOSE_MAKEFILE=ON \
	-DCOMCAST_CONFIG=OFF \
	-DRDK_SERVICES_COVERITY=ON \
	-DRDK_SERVICES_L1_TEST=ON \
	-DCMAKE_CXX_FLAGS="-DEXCEPTIONS_ENABLE=ON -Wall -Werror -Wno-error=format -Wl,-wrap,system -Wl,-wrap,popen -Wl,-wrap,syslog" \

cmake --build build/usersettings --target install
echo "======================================================================================"
exit 0
exit 0
