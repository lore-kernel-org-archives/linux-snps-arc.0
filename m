From: linux@roeck-us.net (Guenter Roeck)
Date: Wed, 12 Sep 2018 16:58:32 -0000
Subject: [PATCH] ARCv2: build: use mcpu=hs38 iso generic mcpu=archs
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180912165817.GA5118@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

Hi,

On Fri, Sep 07, 2018@03:13:10PM -0700, Vineet Gupta wrote:
> helps gcc with better instruction selections such as 64-bit multiply MPYD
> 
> before
> ------
> 82c34b58 <sched_clock>:
> 82c34b58:	ld	r2,[0x83068d00]
> 82c34b60:	add_s	r2,r2,0x7530
> 82c34b66:	mov_s	r0,0x989680
> 82c34b6c:	mpymu	r5,r2,r0
> 82c34b70:	mpy	r4,r2,r0
> 82c34b74:	mov_s	r0,r4
> 82c34b76:	j_s.d	[blink]
> 82c34b78:	mov_s	r1,r5
> 82c34b7a:	nop_s
> 
> after
> ------
> 82c34b7c <sched_clock>:
> 82c34b7c:	ld	r0,[0x83064d00]
> 82c34b84:	add_s	r0,r0,0x7530
> 82c34b8a:	mpydu	r0,r0,0x989680
> 82c34b92:	j_s	[blink]
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

This patch causes my arc2 test builds to fail

Building arc:axs103_defconfig ... failed
--------------
Error log:

standard input}: Assembler messages:
{standard input}:154: Error: inappropriate arguments for opcode 'st'
{standard input}:157: Error: Insn j_s has a jump/branch instruction j_s in its delay slot.
{standard input}:186: Error: inappropriate arguments for opcode 'st'
make[3]: *** [net/core/dev.o] Error 1
make[2]: *** [net/core] Error 2

Building arc:nsim_hs_smp_defconfig ... failed
--------------
Error log:
{standard input}: Assembler messages:
{standard input}:218: Error: inappropriate arguments for opcode 'st'
{standard input}:9329: Error: inappropriate arguments for opcode 'st'

Building arc:vdk_hs38_smp_defconfig ... failed
--------------
Error log:

{standard input}: Assembler messages:
{standard input}:9629: Error: inappropriate arguments for opcode 'st'
{standard input}:9883: Error: inappropriate arguments for opcode 'st'

I use a toolchain based on gcc 7.3.0 and binutils 2.30. What version
of gcc and binutils do I need for the builds to complete ?

Thanks,
Guenter
