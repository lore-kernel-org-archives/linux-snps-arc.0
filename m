From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 12 Sep 2016 10:58:01 -0700
Subject: [PATCH v3 0/2] Getting rid of CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
In-Reply-To: <201609111259.q67d9T4B%fengguang.wu@intel.com>
References: <201609111259.q67d9T4B%fengguang.wu@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1473703083-8625-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter / Tony.

Sorry for the rebase snafu with v2.

So kbuild service reported build failure of ia64 with v1 of the patch.
I've added an untested atomic64_dec_if_positive() to ia64, shamelessly
copied from s390 with some adjustments 64-bit long etc. Could you please
double check.

It builds fine with ia64 cross compiler.

Thx,
-Vineet

*** BLURB HERE ***

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
 arch/s390/Kconfig              |  1 -
 arch/sparc/Kconfig             |  1 -
 arch/tile/Kconfig              |  1 -
 arch/x86/Kconfig               |  1 -
 lib/Kconfig                    |  3 ---
 lib/atomic64_test.c            |  4 ----
 13 files changed, 16 insertions(+), 17 deletions(-)

-- 
2.7.4
