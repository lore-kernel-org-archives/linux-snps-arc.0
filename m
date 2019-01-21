From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 21 Jan 2019 14:32:30 -0800
Subject: [PATCH 17/21] ARC: testsuite fix: stdlib/tst-makecontext
In-Reply-To: <87ftuu799k.fsf@igel.home>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-18-git-send-email-vgupta@synopsys.com>
 <87ftuu799k.fsf@igel.home>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7a48255a-139c-c3fc-bf05-4800744cafb2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 2:36 PM, Andreas Schwab wrote:
>>  ENTRY(__startcontext)
>>  
>> +	cfi_register (blink, r15)
>> +
> You should precede that with a dummy .cfi_label (see
> sysdeps/riscv/start.S) to force the CFI into the FDE instead of the
> CIE.  Also, can you use cfi_undefined instead?

Yes that works as well.


 ENTRY (__startcontext)

-       cfi_register (blink, r15)
+       .cfi_label .Ldummy
+       cfi_undefined (blink)


00035e14 <__startcontext>:
   35e14:	jl	[r13]
   35e18:	mov	r0,r14
   35e1c:	breq.nt	r0,0,8	;35e24 <__startcontext+0x10>
   35e20:	bl	-168	;35d78 <setcontext>
   35e24:	b	-38248	;2c8bc <exit>

New
----
0000058c 00000010 00000590 FDE cie=00000000 pc=00035e14..00035e28
  DW_CFA_undefined: r31
  DW_CFA_nop

Old
----
00035df4 <__startcontext>:
   35df4:	jl	[r13]
   35df8:	mov	r0,r14
   35dfc:	breq.nt	r0,0,8	;35e04 <__startcontext+0x10>
   35e00:	bl	-168	;35d58 <setcontext>
   35e04:	b	-38248	;2c89c <exit>

0000058c 00000014 00000000 CIE
  Version:               1
  Augmentation:          "zR"
  Code alignment factor: 1
  Data alignment factor: -4
  Return address column: 31
  Augmentation data:     1b
  DW_CFA_def_cfa: r28 ofs 0
  DW_CFA_register: r31 in r15
  DW_CFA_nop

000005a4 00000010 0000001c FDE cie=0000058c pc=00035df4..00035e08
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
