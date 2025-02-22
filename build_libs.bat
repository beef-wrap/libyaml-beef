::copy libyaml\src\libyaml.h libyaml.h
::copy libyaml\src\libyaml.c libyaml.c

clang -c -g -gcodeview -o libyaml-windows.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall libyaml\src\libyaml.c

mkdir libs
move libyaml-windows.lib libs

::del libyaml.h
::del libyaml.c