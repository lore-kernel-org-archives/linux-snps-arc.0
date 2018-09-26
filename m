From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 26 Sep 2018 01:53:55 -0000
Subject: kisskb: FAILED linus/axs103_smp_defconfig/arcv2 Wed Sep 26, 11:53
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180926015355.1.5885@5ca8034c38fe>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs103_smp_defconfig/arcv2 Wed Sep 26, 11:53

http://kisskb.ellerman.id.au/kisskb/buildresult/13525505/

Commit:   erge tag 'libnvdimm-fixes-4.19-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
          a38523185b40fd85d2afe5b5fbfb0952f7153e96
Compiler: arc-linux-gcc.br_real (Buildroot 2016.11-git-00613-ge98b4dd) 6.2.1 20160824

Possible errors
---------------

mktemp: failed to create file via template '/kisskb/build/tmp/cpiolist.XXXXXX': No such file or directory
make[2]: *** [usr/Makefile:58: usr/initramfs_data.cpio] Error 1
make[1]: *** [Makefile:1050: usr] Error 2
make: *** [Makefile:146: sub-make] Error 2

Possible warnings (1)
----------------------

kernel/dma/direct.c:46:5: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'unsigned int' [-Wformat=]
