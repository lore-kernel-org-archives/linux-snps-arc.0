From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 12 Sep 2016 10:47:10 -0700
Subject: [PATCH v2 0/2] Getting rid of CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1473702432-8116-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter / Tony.

So kbuild service reported build failure of ia64 with my prev patch.
I've added an untested atomic64_dec_if_positive() to ia64, shamelessly
copied from s390 with some adjustments 64-bit long etc. Could you please
double check.

It builds fine with ia64 cross compiler.

Thx,
-Vineet

Vineet Gupta (2):
  ia64: implement atomic64_dec_if_positive
  atomic64: No need for CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE

 arch/alpha/Kconfig             |  1 -
 arch/arm/Kconfig               |  1 -
 arch/arm64/Kconfig             |  1 -
 arch/ia64/include/asm/atomic.h | 16 ++++++++++++++++
 arch/mips/Kconfig              |  1 -
 arch/parisc/Kconfig            |  1 -
 arch/powerpc/Kconfig           |  1 -
 arch/s390/Kconfig              |  2 +-
 arch/sparc/Kconfig             |  1 -
 arch/tile/Kconfig              |  2 +-
 arch/x86/Kconfig               |  2 +-
 lib/Kconfig                    |  3 ---
 lib/atomic64_test.c            |  4 ----
 13 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.7.4
