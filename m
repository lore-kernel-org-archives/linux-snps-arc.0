From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 16 Sep 2016 15:01:59 +0000
Subject: [PATCH RFC v1 00/29] ARC cores
In-Reply-To: <1473373930-31547-1-git-send-email-mrolnik@gmail.com>
References: <1473373930-31547-1-git-send-email-mrolnik@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1474038116.3042.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Michael,

On Fri, 2016-09-09@01:31 +0300, Michael Rolnik wrote:
> This series of patches adds ARC target to QEMU. It indends to support
> ????- ARCtangent-A5 processor
> ????- ARC 600 processor
> ????- ARC 700 processor
> 
> All instructions except ASLS are implemented. Not fully tested yet.
> However I was able to execute correctly recursive fibonacci calculation.
> Reset vector is assumed to be some hardcoded value which worked for my test.
> I am planning to get FreeRTOS for ARC, once I get it, I will able to verify
> and complete interrupt support.

That's both very unexpected and cool!

I tried your patches on top of current QEMU git master and it:
?a) Builds for ARC
?b) Very simple code really works!

I was able to single-step with GDB through program as simple as:
--------------------->8---------------------
.global _start
_start:
	mov	r0, 1
	mov	r1, 2
	mov	r1, r0
--------------------->8---------------------

That's what I saw in GDB:
--------------------->8---------------------
(gdb) disassemble?
Dump of assembler code for function _start:
=> 0x00000100 <+0>:	mov	r0,0x1
???0x00000104 <+4>:	mov	r1,0x2
???0x00000108 <+8>:	mov	r1,r0
End of assembler dump.
(gdb) p $r0
$1 = 0
(gdb) stepi
0x00000104 in _start ()
(gdb) p $r0
$2 = 1
(gdb) stepi
0x00000108 in _start ()
(gdb) p $r1
$3 = 2
(gdb) stepi
0x0000010c in ?? ()
(gdb) p $r1
$4 = 1
--------------------->8---------------------

So again this is very promising even though a lot is essentially missing from
this very first implementation.

Anyways IMHO it would be good to have these patches accepted so people may start
playing with that stuff adding missing things one by one.

Let me know if you need any help from my side.

Regards,
Alexey
