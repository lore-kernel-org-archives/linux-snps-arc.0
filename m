From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 17:55:58 -0800
Subject: [PATCH 00/21] glibc port to ARC processors
In-Reply-To: <alpine.DEB.2.21.1812182349510.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182243320.30183@digraph.polyomino.org.uk>
 <db17a8c2-fdbf-4956-f710-ad4a9d9b6501@synopsys.com>
 <alpine.DEB.2.21.1812182349510.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0f83e63b-dc21-0809-9295-1dde08ab3cc7@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:52 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> At any rate, the generated code will likely be different for -Os and otherwise,
>> does that mean entries get added conditionally to localplt.data etc ?
> 
> Entries *can* have a "?" to indicate they are optional

OK.

> (although avoiding 
> the PLT reference is better - see how include/string.h does asm 
> redirection of mempcpy and stpcpy, or likewise in 
> sysdeps/wordsize-32/divdi3-symbol-hacks.h, for example).

In libc.so, the extra PLT entry for memcpy

| 00106034  00047837 R_ARC_JMP_SLOT    00066d5c   memcpy@@GLIBC_2.27 + 0
|
...

|   1bec8:	ld	r12,[pcl,0xea16c] ;106034 <memcpy@@GLIBC_2.27+0x9f2d8>
|   1bed0:	j.d	[r12]
|   1bed4:	mov	r12,pcl

is due to linkage of a generic libgcc routine fp-bit.c

| 000d79c4 <_fpadd_parts>:
|...
|   d7a1a:	bl	-768848	;1bec8 <.plt+0xd0>
|

that in turn is likely due to struct assignment in the routine

|static const fp_number_type *
|_fpadd_parts (fp_number_type * a,
|	      fp_number_type * b,
|	      fp_number_type * tmp)
|{
|   ...
|      if (iszero (a))
|	{
|	  *tmp = *a;

So this is classic case of gcc -Os in action, generating a memcpy vs. in-place
LD/ST based copy.

So I guess we just add "?" to localplt.data

>> ARC historically has supported both LE/BE, but we are kind of moving 
>> away from BE and as far as I know, there's no-one actively working with 
>> BE (except 1 specific customer with legact cores). It is safe to assume 
>> we won't support BE and this is sort of easier said for ARC processors 
>> as they have many many hardware config knobs and not all are supported 
>> for Linux usecase, so BE can be considered as such.
> 
> In that case, there should be a #error in bits/endian.h, or a 
> configure-time error, or something like that, to make clear the glibc port 
> does not support BE.

OK, I'll add that.
