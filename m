From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Wed, 15 May 2019 16:41:52 -0000
Subject: kisskb: OK linux-next/axs101_defconfig/arcompact Thu May 16, 02:41
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190515164152.1.40197@64d84000ca61>
To: linux-snps-arc@lists.infradead.org

OK linux-next/axs101_defconfig/arcompact Thu May 16, 02:41

http://kisskb.ellerman.id.au/kisskb/buildresult/13806022/

Commit:   Add linux-next specific files for 20190515
          239d779dc0623b606a2c9e63fa0bcf817a834151
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4 / GNU ld (GNU Binutils) 2.23.2

No errors found in log

Possible warnings (8)
----------------------

<stdin>:1388:2: warning: #warning syscall open_tree not implemented [-Wcpp]
<stdin>:1391:2: warning: #warning syscall move_mount not implemented [-Wcpp]
<stdin>:1394:2: warning: #warning syscall fsopen not implemented [-Wcpp]
<stdin>:1397:2: warning: #warning syscall fsconfig not implemented [-Wcpp]
<stdin>:1400:2: warning: #warning syscall fsmount not implemented [-Wcpp]
<stdin>:1403:2: warning: #warning syscall fspick not implemented [-Wcpp]
net/xfrm/xfrm_policy.c:3494:15: warning: array subscript is above array bounds [-Warray-bounds]
net/ipv4/tcp_input.c:4321:49: warning: array subscript is above array bounds [-Warray-bounds]
