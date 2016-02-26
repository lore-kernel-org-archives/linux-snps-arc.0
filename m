From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 26 Feb 2016 13:59:20 +0530
Subject: [PATCH] ARC Build system tweak
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456475361-7754-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Michal,

Here's a ARC build system quirk that we are trying to change.
I would appreciate if you could take a glance and suggest if that is silly
or better way. Would we be inducing more shell invocations now for build ?
Also I could not find an existing construct in /scripts/Kbuild.include
so opencoded the pre-processor check.

Thx,
-Vineet

Vineet Gupta (1):
  ARC: build: Better way to detect ISA compatible toolchain

 arch/arc/Makefile              | 14 ++++++++++++++
 arch/arc/include/asm/arcregs.h |  6 ------
 2 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.5.0
