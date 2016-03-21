From: linux@roeck-us.net (Guenter Roeck)
Date: Mon, 21 Mar 2016 13:00:35 -0700
Subject: Build error due to commit 458aa76d132dc ("mm/thp/migration: switch
 from flush_tlb_range to flush_pmd_tlb_range")
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160321200035.GA31544@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

Hi,

Your commit 458aa76d132dc1 ("mm/thp/migration: switch from flush_tlb_range
to flush_pmd_tlb_range") causes a build error when building
arcv2:vdk_hs38_smp_defconfig.

include/asm-generic/pgtable.h:799:45: note: in expansion of macro ?BUILD_BUG?
 #define flush_pmd_tlb_range(vma, addr, end) BUILD_BUG()
                                              ^
./arch/arc/include/asm/tlbflush.h:37:13: note:
	in expansion of macro ?flush_pmd_tlb_range?

The build triggers the newly introduced BUILD_BUG().

When building the image without the BUILD_BUG(), ie with no definition
of flush_pmd_tlb_range(), the problem is gone. This suggests that the
function is not needed for this build.

I could submit a patch to remove the BUILD_BUG(), but maybe you had a reason
for introducing it. Can you elaborate why you introduced the BUILD_BUG() ?

Thanks,
Guenter

---
Bisect log:

# bad: [ce69f4538ef366cdd8932097331549be902365f9] unicore32: mm: Add missing parameter to arch_vma_access_permitted
# good: [f7813ad5cbfd1fab2899914281b72a1ba0805c80] Merge tag 'for-linus-4.6' of git://git.code.sf.net/p/openipmi/linux-ipmi
git bisect start 'HEAD' 'f7813ad'
# good: [fb781c8e2a370d67acf7b8a8826e6f5e3ae1d7c6] clk: rockchip: add node-id for rk3036 emac hclk
git bisect good fb781c8e2a370d67acf7b8a8826e6f5e3ae1d7c6
# bad: [33b3d2e88c9efd701b6153ca4714d4aa6e9f5af0] Merge tag 'armsoc-soc' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
git bisect bad 33b3d2e88c9efd701b6153ca4714d4aa6e9f5af0
# bad: [d5e2d00898bdfed9586472679760fc81a2ca2d02] Merge tag 'powerpc-4.6-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect bad d5e2d00898bdfed9586472679760fc81a2ca2d02
# bad: [6b5f04b6cf8ebab9a65d9c0026c650bb2538fd0f] Merge branch 'for-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
git bisect bad 6b5f04b6cf8ebab9a65d9c0026c650bb2538fd0f
# bad: [f9310b2f9a19b7f16c7b1c1558f8b649b9b933c1] sscanf: implement basic character sets
git bisect bad f9310b2f9a19b7f16c7b1c1558f8b649b9b933c1
# bad: [fec89c109f3a7737fe3a7bf0f40d1fb7709d353b] thp: rewrite freeze_page()/unfreeze_page() with generic rmap walkers
git bisect bad fec89c109f3a7737fe3a7bf0f40d1fb7709d353b
# good: [0a6b76dd23fa08c5fd7b68acdb55018a37afd4aa] mm: workingset: make shadow node shrinker memcg aware
git bisect good 0a6b76dd23fa08c5fd7b68acdb55018a37afd4aa
# bad: [fe896d1878949ea92ba547587bc3075cc688fb8f] mm: introduce page reference manipulation functions
git bisect bad fe896d1878949ea92ba547587bc3075cc688fb8f
# bad: [7eb50292d7f74ccb89155960d62b2697f2536b28] mm/Kconfig: remove redundant arch depend for memory hotplug
git bisect bad 7eb50292d7f74ccb89155960d62b2697f2536b28
# good: [39a1aa8e194ab67983de3b9d0b204ccee12e689a] mm: deduplicate memory overcommitment code
git bisect good 39a1aa8e194ab67983de3b9d0b204ccee12e689a
# bad: [458aa76d132dc1c3c60be0f0db99bcc0ce1767fc] mm/thp/migration: switch from flush_tlb_range to flush_pmd_tlb_range
git bisect bad 458aa76d132dc1c3c60be0f0db99bcc0ce1767fc
# good: [bcf6691797f425b301f629bb783b7ff2d0bcfa5a] mm, tracing: refresh __def_vmaflag_names
git bisect good bcf6691797f425b301f629bb783b7ff2d0bcfa5a
# first bad commit: [458aa76d132dc1c3c60be0f0db99bcc0ce1767fc] mm/thp/migration: switch from flush_tlb_range to flush_pmd_tlb_range
