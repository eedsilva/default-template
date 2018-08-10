echo "Generating wasm and abi..."

eosiocpp -o ./contracts/{contract_folder}/{contract_filename}.wasm ./contracts/player/player.cpp
eosiocpp -g ./contracts/{contract_folder}/{contract_filename}.abi ./contracts/player/player.cpp

echo "*** done ***"

echo "running build script..."

sh $1/build.sh

echo "*** done ***"

echo "moving .abi and .wasm files to deploy folder"

mkdir -p build_deploy

cp ./build/contracts/{contract_folder}/{contract_filename}.wasm ./build_deploy
cp ./build/contracts/{contract_folder}/{contract_filename}.abi ./build_deploy

echo "*** done ***"

echo "Set conctract on telos..."

teclos set contract eosio ./build_deploy

echo "*** done ***"