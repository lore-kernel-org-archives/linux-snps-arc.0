From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 7 Sep 2018 19:33:33 +0000
Subject: [GIT PULL] ARC updates for 4.19-rc3
References: <4cb8dd19-a252-10c1-8dea-5479ced463fb@synopsys.com>
 <CA+55aFyQiPApQeMOP9EG8Km+Y-aUBwxXc_8bqRyeSVMSy0nF_w@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B092C16@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/07/2018 12:15 PM, Linus Torvalds wrote:
> On Fri, Sep 7, 2018@11:21 AM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>>   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.19-rc3
> That "tags/arc-4.19-rc3" actually a real signed tag from you, but it
> doesn't point to any of your new work. In fact, it just points to my
> "Linux 4.15-rc1" commit from last year.
>
> Which is presumably also why your pull request didn't contain a diffstat.
>
> Hmm?

Sorry my bad. I did glance at the truncated output and wondered if this was some
git behavior chg.
But turns out I'd passed wrong branch to my script ! Now with right stuff. Thx.

------>
The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-4.19-rc3

for you to fetch changes up to dd45210b6dd4f1512eafcc41774154ebb762360f:

  ARC: don't check for HIGHMEM pages in arch_dma_alloc (2018-09-04 13:21:38 -0700)

----------------------------------------------------------------
ARC updates for 4.19-rc3

 - For for atomic_fetch_#op  [Will Deacon]

 - Enabling per device IOC [Eugeniy Paltsev]

 - Remove redundany gcc version checks [Masahiro Yamada]

 - Miscll platform config/DT updates [Alexey Brodkin]

----------------------------------------------------------------
Alexey Brodkin (3):
      ARC: configs: cleanup
      ARC: [plat-axs*/plat-hsdk]: Allow U-Boot to pass MAC-address to the kernel
      ARC: [plat-axs*]: Enable SWAP

Eugeniy Paltsev (5):
      ARC: cleanup show_faulting_vma()
      ARC: dma [IOC]: mark DMA devices connected as dma-coherent
      ARC: dma [IOC] Enable per device io coherency
      ARC: IOC: panic if both IOC and ZONE_HIGHMEM enabled
      ARC: don't check for HIGHMEM pages in arch_dma_alloc

Masahiro Yamada (1):
      arc: remove redundant GCC version checks

Vineet Gupta (1):
      ARC: sort Kconfig

Will Deacon (1):
      ARC: atomics: unbork atomic_fetch_##op()

 arch/arc/Kconfig                           | 10 ++--
 arch/arc/Makefile                          | 10 +---
 arch/arc/boot/dts/axc003.dtsi              | 26 ++++++++++
 arch/arc/boot/dts/axc003_idu.dtsi          | 26 ++++++++++
 arch/arc/boot/dts/axs10x_mb.dtsi           |  7 ++-
 arch/arc/boot/dts/hsdk.dts                 | 11 +++-
 arch/arc/configs/axs101_defconfig          |  3 --
 arch/arc/configs/axs103_defconfig          |  3 --
 arch/arc/configs/axs103_smp_defconfig      |  3 --
 arch/arc/configs/haps_hs_defconfig         |  2 -
 arch/arc/configs/haps_hs_smp_defconfig     |  2 -
 arch/arc/configs/hsdk_defconfig            |  1 -
 arch/arc/configs/nps_defconfig             |  1 -
 arch/arc/configs/nsim_700_defconfig        |  2 -
 arch/arc/configs/nsim_hs_defconfig         |  2 -
 arch/arc/configs/nsim_hs_smp_defconfig     |  2 -
 arch/arc/configs/nsimosci_defconfig        |  2 -
 arch/arc/configs/nsimosci_hs_defconfig     |  2 -
 arch/arc/configs/nsimosci_hs_smp_defconfig |  2 -
 arch/arc/configs/tb10x_defconfig           |  1 -
 arch/arc/configs/vdk_hs38_defconfig        |  2 -
 arch/arc/configs/vdk_hs38_smp_defconfig    |  1 -
 arch/arc/include/asm/atomic.h              |  2 +-
 arch/arc/include/asm/dma-mapping.h         | 13 +++++
 arch/arc/kernel/troubleshoot.c             | 13 ++---
 arch/arc/mm/cache.c                        | 36 +++++++------
 arch/arc/mm/dma.c                          | 82 +++++++++++++++---------------
 27 files changed, 154 insertions(+), 113 deletions(-)
 create mode 100644 arch/arc/include/asm/dma-mapping.h
