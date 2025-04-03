#! /usr/bin/bash

PREFIX=/home/jwcart2/local

export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/usr/lib:$PREFIX/usr/lib64:$PREFIX/usr/libexec:${LD_LIBRARY_PATH}

echo "Test_01"
#diff -u test_01.conf.opt.bin.conf.test1 test_01.conf.opt.bin.conf.test2 > test_01.conf.opt.bin.conf.tests.diff
#sediff test_01.conf.orig.bin.test1 test_01.conf.opt.bin.test1 > test_01.test1.sediff
#sediff test_01.conf.orig.bin.test2 test_01.conf.opt.bin.test2 > test_01.test2.sediff
#sediff test_01.conf.orig.bin.test3 test_01.conf.opt.bin.test3 > test_01.test3.sediff
sediff test_01.conf.orig.bin.test4 test_01.conf.opt.bin.test4 > test_01.test4.sediff
#sediff test_01.conf.orig.bin.test1 test_01.conf.orig.bin.test2 > test_01.orig.tests12.sediff
#sediff test_01.conf.opt.bin.test1 test_01.conf.opt.bin.test2 > test_01.opt.tests12.sediff

#sediff test_01.conf.orig.bin.test1 test_01.conf.orig.bin.test3 > test_01.orig.tests13.sediff
sediff test_01.conf.orig.bin.test1 test_01.conf.orig.bin.test4 > test_01.orig.tests14.sediff
#sediff test_01.conf.opt.bin.test1 test_01.conf.opt.bin.test3 > test_01.opt.tests13.sediff
sediff test_01.conf.opt.bin.test1 test_01.conf.opt.bin.test4 > test_01.opt.tests14.sediff
#sediff test_01.conf.orig.bin.test2 test_01.conf.orig.bin.test3 > test_01.orig.tests23.sediff
#sediff test_01.conf.opt.bin.test2 test_01.conf.opt.bin.test3 > test_01.opt.tests23.sediff
sediff test_01.conf.orig.bin.test2 test_01.conf.orig.bin.test4 > test_01.orig.tests24.sediff
sediff test_01.conf.opt.bin.test2 test_01.conf.opt.bin.test4 > test_01.opt.tests24.sediff

echo "Test_03"
#diff -u test_03.conf.opt.bin.conf.test1 test_03.conf.opt.bin.conf.test2 > test_03.conf.opt.bin.conf.tests.diff
#sediff test_03.conf.orig.bin.test1 test_03.conf.opt.bin.test1 > test_03.test1.sediff
#sediff test_03.conf.orig.bin.test2 test_03.conf.opt.bin.test2 > test_03.test2.sediff
#sediff test_03.conf.orig.bin.test3 test_03.conf.opt.bin.test3 > test_03.test3.sediff
sediff test_03.conf.orig.bin.test3 test_03.conf.opt.bin.test4 > test_03.test4.sediff
#sediff test_03.conf.orig.bin.test1 test_03.conf.orig.bin.test2 > test_03.orig.tests12.sediff
#sediff test_03.conf.orig.bin.test1 test_03.conf.orig.bin.test3 > test_03.orig.tests13.sediff
#sediff test_03.conf.orig.bin.test2 test_03.conf.orig.bin.test3 > test_03.orig.tests23.sediff
#sediff test_03.conf.opt.bin.test1 test_03.conf.opt.bin.test2 > test_03.opt.tests12.sediff
#sediff test_03.conf.opt.bin.test1 test_03.conf.opt.bin.test3 > test_03.opt.tests13.sediff
sediff test_03.conf.opt.bin.test1 test_03.conf.opt.bin.test4 > test_03.opt.tests14.sediff
#sediff test_03.conf.opt.bin.test2 test_03.conf.opt.bin.test3 > test_03.opt.tests23.sediff
sediff test_03.conf.opt.bin.test2 test_03.conf.opt.bin.test4 > test_03.opt.tests24.sediff
