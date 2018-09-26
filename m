From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 26 Sep 2018 01:54:07 -0000
Subject: kisskb: FAILED linus/axs101_defconfig/arcompact Wed Sep 26, 11:53
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180926015407.1.81623@5ca8034c38fe>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs101_defconfig/arcompact Wed Sep 26, 11:53

http://kisskb.ellerman.id.au/kisskb/buildresult/13525506/

Commit:   erge tag 'libnvdimm-fixes-4.19-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
          a38523185b40fd85d2afe5b5fbfb0952f7153e96
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

mktemp: failed to create file via template '/kisskb/build/tmp/cpiolist.XXXXXX': No such file or directory
make[2]: *** [usr/Makefile:58: usr/initramfs_data.cpio] Error 1
make[1]: *** [Makefile:1050: usr] Error 2
make: *** [Makefile:146: sub-make] Error 2

No warnings found in log.
