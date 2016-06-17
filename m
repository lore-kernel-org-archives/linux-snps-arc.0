From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 17 Jun 2016 07:36:56 -0700
Subject: Build failures in -next due to 'locking/atomic, arch/arc: Implement
 atomic_fetch_{add,sub,and,andnot,or,xor}()'
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57640B08.4090007@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

I am seeing build failures in -next when trying to build arc / arcv2 targets.

arch/arc/include/asm/atomic.h:74:2: error: ?SCOND_FAIL_RETRY_VAR_DEF? undeclared
arch/arc/include/asm/atomic.h:87:2: error: expected ?:? or ?)? before ?SCOND_FAIL_RETRY_ASM?

Problems seem to be caused by 'locking/atomic, arch/arc: Implement
atomic_fetch_{add,sub,and,andnot,or,xor}()'. Both SCOND_FAIL_RETRY_VAR_DEF and
SCOND_FAIL_RETRY_ASM are undefined.

Guenter
