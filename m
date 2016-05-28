From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Sat, 28 May 2016 21:55:33 +0200
Subject: [PATCH] ldso: Force disable -mlong-calls when compiling ldso for
 ARC
In-Reply-To: <1464013898-27459-1-git-send-email-abrodkin@synopsys.com>
References: <1464013898-27459-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160528195533.GP22609@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,
Alexey Brodkin wrote,

> Even though by default for ARC uClibc gets compiled with
> disabled long-calls user may provide UCLIBC_EXTRA_CFLAGS
> with "-mlong-calls". With this option uClibc will be
> successfully compiled but later it will fail in runtime
> because dynamic loader cannot deal with relocations
> at least very early on its start.
> 
> In particular it will be seen as call to non-relocated
> symbol _dl_parse_dynamic_info() which ends-up as a segfault
> like this:
> ------------------------>8--------------------
> potentially unexpected fatal signal 11.
> Path: /bin/test
> CPU: 0 PID: 63 Comm: test Not tainted 4.5.2 #7
> task: 9f13f180 ti: 9f166000 task.ti: 9f166000
> 
> [ECR   ]: 0x00040000 => Insn could not be fetched
> [EFA   ]: 0x0000283c
> [BLINK ]: 0x2000407c
> [ERET  ]: 0x283c
>     @No matching VMA found
> [STAT32]: 0x8008009e : IE U
> BTA: 0x0000283c  SP: 0x5fef5ccc  FP: 0x00000000
> LPS: 0x20004080 LPE: 0x20004064 LPC: 0x00000000
> r00: 0x20006684 r01: 0x5fef5db0 r02: 0x00000000
> r03: 0x20000000 r04: 0x80808080 r05: 0x2f2f2f2f
> r06: 0x41464d00 r07: 0x00000080 r08: 0x000000dd
> r09: 0x00000000 r10: 0x00000073 r11: 0x80808080
> r12: 0x2000407c r13: 0x20000000 r14: 0x5fef5e74
> r15: 0x000ceb3c r16: 0x5fef5e7c r17: 0x5fef5d44
> r18: 0x000ceb0c r19: 0xffffffff r20: 0x000ceb1c
> r21: 0x00000000 r22: 0x00000000 r23: 0x000d08a5
> r24: 0x00000000 r25: 0x80808080
> 
> Segmentation fault
> ------------------------>8--------------------
> 
> Solution to this issue is simple we make sure dynamic
> loader never gets compiled with "-mlong-calls" by forcing
> "-mno-long-calls" on it.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Anton Kolesov <akolesov at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org

applied and pushed,
 Thanks
  Waldemar
