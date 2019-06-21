From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 21 Jun 2019 15:39:27 +0000
Subject: [PATCH] ARC: ARCv2: jump label: implement jump label patching
In-Reply-To: <9192bd26-5f34-dcbf-8552-2f474866a31e@synopsys.com>
References: <20190614164049.31626-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A252CCC3@us01wembx1.internal.synopsys.com>
 <20190619081227.GL3419@hirez.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA2307501A252E40B@us01wembx1.internal.synopsys.com>
 <20190620075224.GT3419@hirez.programming.kicks-ass.net>
 <9192bd26-5f34-dcbf-8552-2f474866a31e@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120D86E5774F93769320B59A1E70@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces at lists.infradead.org> On Behalf Of Vineet Gupta
> Sent: Thursday, June 20, 2019 11:50 PM
> To: Peter Zijlstra <peterz at infradead.org>
> Cc: linux-arch at vger.kernel.org; Ard Biesheuvel <ard.biesheuvel at linaro.org>; Alexey Brodkin
> <abrodkin at synopsys.com>; linux-kernel at vger.kernel.org; Jason Baron <jbaron at akamai.com>; Paolo Bonzini
> <pbonzini at redhat.com>; linux-snps-arc at lists.infradead.org; Eugeniy Paltsev
> <Eugeniy.Paltsev at synopsys.com>
> Subject: Re: [PATCH] ARC: ARCv2: jump label: implement jump label patching

[snip]

> Insn encoding is always middl eendina - irrespective of endianness.

Apparently only in little-endian mode instructions are encoded as middle-endian,
see:
-------------->8-------------
# cat endian.S

.global myfunc
myfunc:
        mov r0, r1
-------------->8-------------

Little-endian:
-------------->8-------------
# arc-linux-gcc -c -mcpu=archs endian.S -EL
# arc-linux-objdump -d endian.o

endian.o:     file format elf32-littlearc

Disassembly of section .text:
00000000 <myfunc>:
   0:   200a 0040               mov     r0,r1

# arc-linux-readelf -x .text endian.o
Hex dump of section '.text':
  0x00000000 0a204000                            . @.
-------------->8-------------

Big-endian:
-------------->8-------------
# arc-linux-gcc -c -mcpu=archs endian.S -EB
# arc-linux-objdump -d endian.o

endian.o:     file format elf32-bigarc

Disassembly of section .text:
00000000 <myfunc>:
   0:   200a 0040               mov     r0,r1

# arc-linux-readelf -x .text endian.o

Hex dump of section '.text':
  0x00000000 200a0040                             ..@
-------------->8-------------

-Alexey
