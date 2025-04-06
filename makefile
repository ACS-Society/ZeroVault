$(target):$(obj)
	$(GCC) $(C_FLAGS) $^ $(head) -o $@
	make: Entering directory '/root/code/kernel-5.10.0-60.18.0.50.oe2203'
	gcc   -o arch/x86/tools/relocs arch/x86/tools/relocs_32.o arch/x86/tools/relocs_64.o arch/x86/tools/relocs_common.o;
	echo 'echo 123; arch/x86/tools/relocs --abs-relocs vmlinux' > ./tmp