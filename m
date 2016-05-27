From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 27 May 2016 18:02:13 +0530
Subject: [PATCH] ldso: Force disable -mlong-calls when compiling ldso for
 ARC
In-Reply-To: <1464013898-27459-1-git-send-email-abrodkin@synopsys.com>
References: <1464013898-27459-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57483E4D.6010607@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 23 May 2016 08:01 PM, Alexey Brodkin wrote:
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
> ---
>  ldso/ldso/Makefile.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/ldso/ldso/Makefile.in b/ldso/ldso/Makefile.in
> index d85646a..dde6a53 100644
> --- a/ldso/ldso/Makefile.in
> +++ b/ldso/ldso/Makefile.in
> @@ -34,6 +34,10 @@ CFLAGS-$(DODEBUG)-ldso/ldso := -O2 -g
>  
>  CFLAGS-ldso.c := -DLDSO_ELFINTERP=\"$(TARGET_ARCH)/elfinterp.c\"
>  
> +ifeq ($(TARGET_ARCH),arc)
> +CFLAGS-ldso.c += -mno-long-calls
> +endif
> +
>  LDFLAGS-$(UCLIBC_FORMAT_DSBT_ELF)-$(UCLIBC_LDSO_NAME).so := -Wl,--dsbt-index=1
>  ifneq ($(SUPPORT_LD_DEBUG),y)
>  LDFLAGS-$(UCLIBC_LDSO_NAME).so := $(LDFLAGS)
> 

This change is fine, but changelog could be improved based on some commentary below.

so uClibc ldso - atleast as it builds/works for ARC, doesn't have any PLT calls
for it's own code. Most of it is built as a single compilation unit and in the
final link all function calls are resolved to be within the dso thus eliding need
for any PLT calls. Hence there is no code to fixup PLT as it doesn't exist for
ldso (which probably other arches do).

But one of the side effects of building with -fPIC -mlong-calls is that gcc/gas
start generating PLT calls.

So while we used to get before
6006     3e5e:       0f76 ff2f               bl.d    25d0 <_dl_parse_dynamic_info>

Now becomes
5894     41fa:       2730 7f8c 0000 2a8c     ld      r12,[pcl,0x2a8c]
5895     4202:       7c60                              jl_s.d  [r12]

This is fine for normal dso's as GOT slot for functions will be fixed up lazily or
now , but not for ldso itself. Hence the need for building ldso explciitly with
-mno-long-calls

HTH,
-Vineet
