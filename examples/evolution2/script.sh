gcc $1
clang -I ../../include -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone $1
