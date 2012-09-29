android update project -p . -s --target 3 --name StellaTestCases
ndk-build
rm -fr bin; ant -v debug install
