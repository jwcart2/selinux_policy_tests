#! /usr/bin/bash

PREFIX=/home/jim/local
SETOOLS=$PREFIX/usr/local/bin

export PYTHONUSERBASE=$PREFIX/usr/local

#python3 -m site $PREFIX/usr/local/lib64/python3.7/site-packages/setools
#python3 -m site

export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/usr/lib:$PREFIX/usr/lib64:$PREFIX/usr/libexec:${LD_LIBRARY_PATH}

echo "Test_01"
$PREFIX/usr/bin/checkpolicy -M -o test_01.conf.orig.bin test_01.conf
$PREFIX/usr/bin/checkpolicy -M -o test_01a.conf.orig.bin test_01a.conf
$PREFIX/usr/bin/checkpolicy -O -M -o test_01.conf.opt.bin test_01.conf
$PREFIX/usr/bin/checkpolicy -O -M -b -o test_01.bin.opt.bin test_01.conf.orig.bin
$PREFIX/usr/bin/checkpolicy -F -M -b -o test_01.conf.orig.bin.conf test_01.conf.orig.bin
$PREFIX/usr/bin/checkpolicy -F -M -b -o test_01.conf.opt.bin.conf test_01.conf.opt.bin

$PREFIX/usr/bin/checkpolicy -M -C -o test_01.cil test_01.conf
$PREFIX/usr/bin/secilc -N -M 1 -o test_01.cil.orig.bin test_01.cil
$PREFIX/usr/bin/secilc -O -N -M 1 -o test_01.cil.opt.bin test_01.cil

#diff -u test_01.conf.orig.bin.conf test_01.conf.opt.bin.conf > test_01.bin.conf.orig-opt.diff
#$SETOOLS/sediff -v test_01.conf.orig.bin test_01.cil.orig.bin > test_01.conf-cil.orig.sediff
#$SETOOLS/sediff -v test_01.conf.opt.bin test_01.cil.opt.bin > test_01.conf-cil.opt.sediff
#$SETOOLS/sediff -v test_01.cil.orig.bin test_01.cil.opt.bin > test_01.cil.orig-opt.sediff
#$SETOOLS/sediff -v test_01.conf.opt.bin test_01a.conf.orig.bin > test_01-01a.sediff
#$SETOOLS/sediff -v test_01.conf.orig.bin test_01.conf.opt.bin > test_01.conf.orig-opt.sediff
#$SETOOLS/sediff -v test_01.conf.orig.bin test_01.bin.opt.bin > test_01.conf-bin.orig-opt.sediff

#echo "Test_02"
#$PREFIX/usr/bin/checkpolicy -M -o test_02.conf.orig.bin test_02.conf
#$PREFIX/usr/bin/checkpolicy -O -M -o test_02.conf.opt.bin test_02.conf
#sediff test_02.conf.orig.bin test_02.conf.opt.bin > test_02-conf.sediff

#echo "Test_03"
$PREFIX/usr/bin/checkpolicy -o test_03.conf.orig.bin test_03.conf
$PREFIX/usr/bin/checkpolicy -O -o test_03.conf.opt.bin test_03.conf
$PREFIX/usr/bin/checkpolicy -F -b -o test_03.conf.orig.bin.conf test_03.conf.orig.bin
$PREFIX/usr/bin/checkpolicy -F -b -o test_03.conf.opt.bin.conf test_03.conf.opt.bin
#diff -u test_03.conf.orig.bin.conf test_03.conf.opt.bin.conf > test_03.bin.conf.orig-opt.diff
#sediff test_03.conf.orig.bin test_03.conf.opt.bin > test_03-conf.sediff

#echo "Test_04"
#$PREFIX/usr/bin/checkpolicy -M -o test_04.conf.orig.bin test_04.conf
#$PREFIX/usr/bin/checkpolicy -O -M -o test_04.conf.opt.bin test_04.conf
#sediff test_04.conf.orig.bin test_04.conf.opt.bin > test_04-conf.sediff

#echo "Test_05"
#$PREFIX/usr/bin/checkpolicy -M -o test_05.conf.orig.bin test_05.conf
#$PREFIX/usr/bin/checkpolicy -O -M -o test_05.conf.opt.bin test_05.conf
#sediff test_05.conf.orig.bin test_05.conf.opt.bin > test_05-conf.sediff
