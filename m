From: rppt@linux.ibm.com (Mike Rapoport)
Date: Sun, 26 May 2019 18:38:14 +0300
Subject: [RFC/RFT WIP] arc: add sparsemem support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1558885095-21540-1-git-send-email-rppt@linux.ibm.com>
To: linux-snps-arc@lists.infradead.org

Hi,

The patch below adds sparsemem support for ARC.

It's really a hack for now, as I'll need to sort out the generic MM bits to
allow creation of ZONE_HIGHMEM below ZONE_NORMAL on the same node.

The eventual intention is to completely replace DISCONTIGMEM with SPARSEMEM
provided the latter is at least as efficient.

I don't have access to ARC hardware I could only check the compilation and
the differences in the resulting vmlinux size. Apparently, I've managed to
have all three memory models buildable, at least with defconfig + override
for the memory model selection.

With the current changes sparsemem build creates a larger kernel,
especially with CONFIG_ARC_HAS_PAE40=y:

$ size -x discontigmem/vmlinux sparsemem/vmlinux
   text	   data	    bss	    dec	    hex	filename
0x348c5e	0xec5dc	0x3b658	4655250	 470892	discontigmem/vmlinux
0x3490cf	0xecde4	0x3bde0	4660371	 471c93	sparsemem/vmlinux

If the runtime results will favor sparsmem, it might be still worthwhile
using it instead of discontigmem.
Otherwise ARC is doomed to keep DISCONTIGMEM forever ;-)

I've defined the constants required for the SPARSEMEM based on the comments inside the code, if the actual parameters might be different, please let me know, I'll update the arch/arc/include/asm/sparsemem.h.

Currently, I presumed that for non-PAE the physical address size is 32 bits and there maybe up to two memory banks: at 0x8zz and at 0x0zz.

For the PAE case, the maximal physical address is 40 bits and the memory can be populated at 0x8zz or 0x1zzz.

--
Sincerely yours,
Mike.

Mike Rapoport (1):
  arc: add sparsemem support

 arch/arc/Kconfig                 |  9 +++++
 arch/arc/include/asm/sparsemem.h | 13 +++++++
 arch/arc/mm/init.c               | 84 ++++++++++++++++++++++++++++------------
 include/linux/mm.h               |  3 ++
 mm/page_alloc.c                  | 37 ++++++++++++++++++
 5 files changed, 121 insertions(+), 25 deletions(-)
 create mode 100644 arch/arc/include/asm/sparsemem.h

-- 
2.7.4
