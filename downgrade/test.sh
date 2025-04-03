#!/usr/bin/bash

#PREFIX=/home/jwcart2/local
PREFIX=/home/jim/local

OLD_LIBRARY_PATH=${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=$PREFIX/lib:$PREFIX/usr/lib:${LD_LIBRARY_PATH}


rm *.tree
rm *.bin
rm *.mod
rm *.lnk
rm *.pp

echo "secil2tree: test_01.cil.tree"
$PREFIX/usr/bin/secil2tree -o test_01.cil.tree test_01.cil

echo "secil2conf: test_01.cil.conf"
$PREFIX/usr/bin/secil2conf -o test_01.cil.conf test_01.cil


echo "Testing CIL Policies"

for V in 33 32 31
do
	echo "Testing Policy Version: $V"

	echo "secilc: test_01.cil"
	$PREFIX/usr/bin/secilc -c $V -o test_01.$V.cil.bin test_01.cil

	echo "checkpolicy: test_01.$V.cil.bin.cil"
	$PREFIX/usr/bin/checkpolicy -C -b -o test_01.$V.cil.bin.cil test_01.$V.cil.bin

	echo "checkpolicy: test_01.$V.cil.bin.conf"
	$PREFIX/usr/bin/checkpolicy -F -b -o test_01.$V.cil.bin.conf test_01.$V.cil.bin


	echo "checkpolicy: test_01.$V.cil.conf.bin"
	$PREFIX/usr/bin/checkpolicy -c $V -o test_01.$V.cil.conf.bin test_01.cil.conf
done

echo "Testing Conf Policies"

for V in 33 32 31
do
	echo "Testing Policy Version: $V"

	echo "checkpolicy: test_01.conf"
	$PREFIX/usr/bin/checkpolicy -c $V -o test_01.$V.conf.bin test_01.conf

	echo "checkpolicy: test_01.$V.conf.bin.cil"
	$PREFIX/usr/bin/checkpolicy -C -b -o test_01.$V.conf.bin.cil test_01.$V.conf.bin

	echo "checkpolicy: test_01.$V.conf.bin.conf"
	$PREFIX/usr/bin/checkpolicy -F -b -o test_01.$V.conf.bin.conf test_01.$V.conf.bin
done

echo "Testing Mod Policies"

for V in 21 20 19
do
	echo "Testing Module Version: $V"

	echo "checkmodule: base_01.mod"
	$PREFIX/usr/bin/checkmodule -c $V -o base_01.mod base_01.te

	echo "checkmodule: mod_02.mod"
	$PREFIX/usr/bin/checkmodule -c $V -m -o mod_02.mod mod_02.te

	echo "semodule_package: base_01.pp"
	$PREFIX/usr/bin/semodule_package -o base_01.pp -m base_01.mod

	echo "semodule_package: mod_02.pp"
	$PREFIX/usr/bin/semodule_package -o mod_02.pp -m mod_02.mod

	echo "semodule_link: test_01.pp.lnk"
	$PREFIX/usr/bin/semodule_link -o test_01.pp.lnk base_01.pp mod_02.pp

	for V2 in 33 32 31
	do
		echo "Testing Policy Version: $V2 (from Module version: $V)"
		echo "semodule_expand: test_01.pp.bin"
		$PREFIX/usr/bin/semodule_expand -c $V2 test_01.pp.lnk test_01.pp.bin

		echo "checkpolicy: test_01.$V.conf.bin.cil"
		$PREFIX/usr/bin/checkpolicy -C -b -o test_01.pp.bin.cil test_01.pp.bin

		echo "checkpolicy: test_01.$V.conf.bin.conf"
		$PREFIX/usr/bin/checkpolicy -F -b -o test_01.pp.bin.conf test_01.pp.bin
	done
done
