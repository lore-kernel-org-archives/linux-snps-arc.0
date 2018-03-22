From: blackzert@gmail.com (Ilya Smith)
Date: Thu, 22 Mar 2018 19:36:36 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
To: linux-snps-arc@lists.infradead.org

Current implementation doesn't randomize address returned by mmap.
All the entropy ends with choosing mmap_base_addr at the process
creation. After that mmap build very predictable layout of address
space. It allows to bypass ASLR in many cases. This patch make
randomization of address on any mmap call.

---
v2: Changed the way how gap was chosen. Now we don't get all possible
gaps. Random address generated and used as a tree walking direction.
Tree walked with backtracking till suitable gap will be found.
When the gap was found, address randomly shifted from next vma start.

The vm_unmapped_area_info structure was extended with new field random_shift
what might be used to set arch-depended limit on shift to next vma start.
In case of x86-64 architecture this shift is 256 pages for 32 bit applications
and 0x1000000 pages for 64 bit.

To get the entropy pseudo-random is used. This is because on Intel x86-64
processors instruction RDRAND works very slow if buffer is consumed -
after about 10000 iterations.

This feature could be enabled by setting randomize_va_space with 4.

---
Performance:
After applying this patch single mmap took about 7% longer according to
following test:

    before = rdtsc();
    addr = mmap(0, SIZE, PROT_READ | PROT_WRITE, 
                 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
    after = rdtsc();
    diff = after - before;
    munmap(addr, SIZE)
    ...
    unsigned long long total = 0;
    for(int i = 0; i < count; ++i) {
        total += one_iteration();
    }
    printf("%lld\n", total);

Time is consumed by div instruction in computation of the address.

make kernel:
echo 2 > /proc/sys/kernel/randomize_va_space 
make mrproper && make defconfig && time make 
real    11m9.925s
user    10m17.829s
sys 1m4.969s

echo 4 > /proc/sys/kernel/randomize_va_space 
make mrproper && make defconfig && time make 
real    11m12.806s
user    10m18.305s
sys 1m4.281s


Ilya Smith (2):
  Randomization of address chosen by mmap.
  Architecture defined limit on memory region random shift.

 arch/alpha/kernel/osf_sys.c         |   1 +
 arch/arc/mm/mmap.c                  |   1 +
 arch/arm/mm/mmap.c                  |   2 +
 arch/frv/mm/elf-fdpic.c             |   1 +
 arch/ia64/kernel/sys_ia64.c         |   1 +
 arch/ia64/mm/hugetlbpage.c          |   1 +
 arch/metag/mm/hugetlbpage.c         |   1 +
 arch/mips/mm/mmap.c                 |   1 +
 arch/parisc/kernel/sys_parisc.c     |   2 +
 arch/powerpc/mm/hugetlbpage-radix.c |   1 +
 arch/powerpc/mm/mmap.c              |   2 +
 arch/powerpc/mm/slice.c             |   2 +
 arch/s390/mm/mmap.c                 |   2 +
 arch/sh/mm/mmap.c                   |   2 +
 arch/sparc/kernel/sys_sparc_32.c    |   1 +
 arch/sparc/kernel/sys_sparc_64.c    |   2 +
 arch/sparc/mm/hugetlbpage.c         |   2 +
 arch/tile/mm/hugetlbpage.c          |   2 +
 arch/x86/kernel/sys_x86_64.c        |   4 +
 arch/x86/mm/hugetlbpage.c           |   4 +
 fs/hugetlbfs/inode.c                |   1 +
 include/linux/mm.h                  |  17 ++--
 mm/mmap.c                           | 165 ++++++++++++++++++++++++++++++++++++
 23 files changed, 213 insertions(+), 5 deletions(-)

-- 
2.7.4
