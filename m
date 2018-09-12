From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 12 Sep 2018 12:08:40 +0000
Subject: defconfig fails if CROSS_COMPILE is set while cross-gcc is not
 avaialble
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0854f35e92c95e552721dc6a46f4ee2bc4020bc1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello Masahiro-san,

Starting from kernel v4.17 it is no longer possible to install kernel headers
for ARC architecture if there's no cross-toolchain in PATH.

Note installation of headers is just one of use-cases when we might not
have cross-tools available but still want to run "make xxx_defconfig".
I.e. the problem is "make xxx_defconfig" with no cross-toolchain.

That's what I see:
----------------------------->8--------------------------
./scripts/gcc-version.sh: line 26: arc-linux-gcc: command not found
./scripts/gcc-version.sh: line 27: arc-linux-gcc: command not found
./scripts/gcc-version.sh: line 26: arc-linux-gcc: command not found
./scripts/gcc-version.sh: line 27: arc-linux-gcc: command not found
make: arc-linux-gcc: Command not found
/bin/sh: arc-linux-gcc: command not found
/bin/sh: arc-linux-gcc: command not found
*** Default configuration is based on 'nsim_700_defconfig'
./scripts/gcc-version.sh: line 26: arc-linux-gcc: command not found
./scripts/gcc-version.sh: line 27: arc-linux-gcc: command not found
./scripts/gcc-version.sh: line 29: arc-linux-gcc: command not found
./scripts/gcc-version.sh: line 26: arc-linux-gcc: command not found
./scripts/gcc-version.sh: line 27: arc-linux-gcc: command not found
./scripts/gcc-version.sh: line 29: arc-linux-gcc: command not found
init/Kconfig:17: syntax error
init/Kconfig:16: invalid option
./scripts/clang-version.sh: line 15: arc-linux-gcc: command not found
./scripts/gcc-plugin.sh: line 11: arc-linux-gcc: command not found
make[1]: *** [scripts/kconfig/Makefile:91: defconfig] Error 1
make: *** [Makefile:531: defconfig] Error 2
----------------------------->8--------------------------

That doesn't happen for ARM and other arches simply because for ARC
we define CROSS_COMPILE if it is not set by user, see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/Makefile#n9

Still if CROSS_COMPILE is set before execution of "make defconfig"
then the same problem happens for others.

I was able to find a series of commits which cause this problem,
here they are:
----------------------------->8--------------------------
59f53855babf - gcc-plugins: test plugin support in Kconfig and clean up Makefile
469cb7376c06 - kconfig: add CC_IS_CLANG and CLANG_VERSION
a4353898980c - kconfig: add CC_IS_GCC and GCC_VERSION
----------------------------->8--------------------------

What happen is "$(CC)" is passed as an argument and in its turn CC is
"$(CROSS_COMPILE)gcc", see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile#n385


So if I substitute "CC" with "HOSTCC" in a couple of places (see below)
the problem goes away. But I'm not really sure if what I do is correct.
I.e. when we're interested in CC for target and when only host CC is of
our interest.

Would be interesting to know your opinion here.

-Alexey

-------------------------------------->8---------------------------------------------
diff --git a/arch/Kconfig b/arch/Kconfig
index d1f2ed462ac8..53c8c7994e6b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -412,7 +412,7 @@ preferred-plugin-hostcc := $(if-success,[ $(gcc-version) -ge 40800 ],$(HOSTCXX),
 
 config PLUGIN_HOSTCC
        string
-       default "$(shell,$(srctree)/scripts/gcc-plugin.sh "$(preferred-plugin-hostcc)" "$(HOSTCXX)" "$(CC)")"
+       default "$(shell,$(srctree)/scripts/gcc-plugin.sh "$(preferred-plugin-hostcc)" "$(HOSTCXX)" "$(HOSTCC)")"
        help
          Host compiler used to build GCC plugins.  This can be $(HOSTCXX),
          $(HOSTCC), or a null string if GCC plugin is unsupported.
diff --git a/init/Kconfig b/init/Kconfig
index 2a48832fd40e..a0094ddb8244 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -13,7 +13,7 @@ config CC_IS_GCC
 
 config GCC_VERSION
        int
-       default $(shell,$(srctree)/scripts/gcc-version.sh -p $(CC) | sed 's/^0*//') if CC_IS_GCC
+       default $(shell,$(srctree)/scripts/gcc-version.sh -p $(HOSTCC) | sed 's/^0*//') if CC_IS_GCC
        default 0
 
 config CC_IS_CLANG
@@ -21,7 +21,7 @@ config CC_IS_CLANG
 
 config CLANG_VERSION
        int
-       default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
+       default $(shell,$(srctree)/scripts/clang-version.sh $(HOSTCC))
 
 config CONSTRUCTORS
        bool
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 86321f06461e..684cd645eeb1 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -109,7 +109,7 @@ as-instr = $(call try-run,\
        printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
-# Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
+# Usage: MY_CFLAGS += $(call __cc-option,$(HOSTCC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
 __cc-option = $(call try-run,\
        $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
 
@@ -143,11 +143,11 @@ cc-disable-warning = $(call try-run,\
 cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
 
 # cc-version
-cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
+cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(HOSTCC))
 
 # cc-fullversion
 cc-fullversion = $(shell $(CONFIG_SHELL) \
-       $(srctree)/scripts/gcc-version.sh -p $(CC))
+       $(srctree)/scripts/gcc-version.sh -p $(HOSTCC))
 
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index dad5583451af..3b28bf94cb24 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -27,4 +27,4 @@ cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
 ld-option = $(success,$(LD) -v $(1))
 
 # gcc version including patch level
-gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh -p $(CC) | sed 's/^0*//')
+gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh -p $(HOSTCC) | sed 's/^0*//')
-------------------------------------->8---------------------------------------------
