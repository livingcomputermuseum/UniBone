. compile-bbb.env

# Debugging: remote from Eclipse. Compile on BBB is release.
export MAKE_CONFIGURATION=RELEASE

cd 10.03_app_demo/2_src

if [ "$1" == "-a" ] ; then
make clean
fi

make
cd ~

echo "To run binary, call"
echo "10.03_app_demo/4_deploy/demo"

