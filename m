From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 10 Nov 2016 17:44:43 +0100
Subject: [PATCH v2 00/11] getting back -Wmaybe-uninitialized
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161110164454.293477-1-arnd@arndb.de>
To: linux-snps-arc@lists.infradead.org

Hi Linus,

It took a while for some patches to make it into mainline through
maintainer trees, but the 28-patch series is now reduced to 10, with
one tiny patch added at the end.  I hope this can still make it into
v4.9. Aside from patches that are no longer required, I did these changes
compared to version 1:

- Dropped "iio: maxim_thermocouple: detect invalid storage size in
  read()", which is currently in linux-next as commit 32cb7d27e65d.
  This is the only remaining warning I see for a couple of corner
  cases (kbuild bot reports it on blackfin, kernelci bot and
  arm-soc bot both report it on arm64)

- Dropped "brcmfmac: avoid maybe-uninitialized warning in
  brcmf_cfg80211_start_ap", which is currently in net/master
  merge pending.

- Dropped two x86 patches, "x86: math-emu: possible uninitialized
  variable use" and "x86: mark target address as output in 'insb' asm"
  as they do not seem to trigger for a default build, and I got
  no feedback on them. Both of these are ancient issues and seem
  harmless, I will send them again to the x86 maintainers once
  the rest is merged.
  
- Dropped "rbd: false-postive gcc-4.9 -Wmaybe-uninitialized" based on
  feedback from Ilya Dryomov, who already has a different fix queued up
  for v4.10. The kbuild bot reports this as a warning for xtensa.
 
- Replaced "crypto: aesni: avoid -Wmaybe-uninitialized warning" with a
  simpler patch, this one always triggers but my first solution would not
  be safe for linux-4.9 any more at this point. I'll follow up with
  the larger patch as a cleanup for 4.10.
  
- Replaced "dib0700: fix nec repeat handling" with a better one,
  contributed by Sean Young.

Please merge these directly if you are happy with the result.

As the minimum, I'd hope to see the first patch get in soon,
but the individual bugfixes are hopefully now all appropriate
as well. If you see any regressions with the final patch, just
leave that one out and let me know what problems remain.

	Arnd

Arnd Bergmann (10):
  Kbuild: enable -Wmaybe-uninitialized warning for "make W=1"
  NFSv4.1: work around -Wmaybe-uninitialized warning
  x86: apm: avoid uninitialized data
  nios2: fix timer initcall return value
  s390: pci: don't print uninitialized data for debugging
  [media] rc: print correct variable for z8f0811
  crypto: aesni: shut up -Wmaybe-uninitialized warning
  infiniband: shut up a maybe-uninitialized warning
  pcmcia: fix return value of soc_pcmcia_regulator_set
  Kbuild: enable -Wmaybe-uninitialized warnings by default

Sean Young (1):
  [media] dib0700: fix nec repeat handling

 Makefile                                 | 10 +++---
 arch/arc/Makefile                        |  4 ++-
 arch/nios2/kernel/time.c                 |  1 +
 arch/s390/pci/pci_dma.c                  |  2 +-
 arch/x86/crypto/aesni-intel_glue.c       |  4 +--
 arch/x86/kernel/apm_32.c                 |  5 ++-
 drivers/infiniband/core/cma.c            | 54 +++++++++++++++++---------------
 drivers/media/i2c/ir-kbd-i2c.c           |  2 +-
 drivers/media/usb/dvb-usb/dib0700_core.c |  5 +--
 drivers/pcmcia/soc_common.c              |  2 +-
 fs/nfs/nfs4session.c                     | 10 +++---
 scripts/Makefile.extrawarn               |  1 +
 scripts/Makefile.ubsan                   |  4 +++
 13 files changed, 61 insertions(+), 43 deletions(-)

-- 
2.9.0

Cc: Anna Schumaker <anna.schumaker at netapp.com>
Cc: "David S. Miller" <davem at davemloft.net>
Cc: Herbert Xu <herbert at gondor.apana.org.au>
Cc: Ilya Dryomov <idryomov at gmail.com>
Cc: Javier Martinez Canillas <javier at osg.samsung.com>
Cc: Jiri Kosina <jikos at kernel.org>
Cc: Jonathan Cameron <jic23 at kernel.org>
Cc: Ley Foon Tan <lftan at altera.com>
Cc: Luis R. Rodriguez <mcgrof at kernel.org>
Cc: Martin Schwidefsky <schwidefsky at de.ibm.com>
Cc: Mauro Carvalho Chehab <mchehab at kernel.org>
Cc: Michal Marek <mmarek at suse.com>
Cc: Russell King <linux at armlinux.org.uk>
Cc: Sean Young <sean at mess.org>
Cc: Sebastian Ott <sebott at linux.vnet.ibm.com>
Cc: Trond Myklebust <trond.myklebust at primarydata.com>
Cc: x86 at kernel.org
Cc: linux-kbuild at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
Cc: linux-snps-arc at lists.infradead.org
Cc: nios2-dev at lists.rocketboards.org
Cc: linux-s390 at vger.kernel.org
Cc: linux-crypto at vger.kernel.org
Cc: linux-media at vger.kernel.org
Cc: linux-nfs at vger.kernel.org
