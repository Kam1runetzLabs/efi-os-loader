#!/usr/bin/bash

# shellcheck disable=SC2164
cd ../src
nasm jumper.S -o jumper.bin
xxd -i jumper.bin > ../src/jumper.h

cd ../edk2
. edksetup.sh BaseTools

rm -rf MdeModulePkg/Application/CourseWork
mkdir MdeModulePkg/Application/CourseWork
cp -r ../src/* MdeModulePkg/Application/CourseWork

mv Conf/target.txt target_backup.txt
cp ../src/app-target.txt Conf/target.txt

build

rm Conf/target.txt
cp target_backup.txt Conf/target.txt
