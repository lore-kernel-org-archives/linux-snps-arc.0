From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 30 Jan 2019 10:15:09 -0800
Subject: [PATCH v2 00/15] glibc port to ARC processors
In-Reply-To: <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1901300220520.24454@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <980d8411-e4b9-24c0-3340-c112d6d6c349@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/29/19 6:29 PM, Joseph Myers wrote:
> In the absence of clear consensus regarding consideration of new ports to 
> undocumented architectures (which would need to result in consensus on 
> suitable rules on the subject to go in 
> <https://sourceware.org/glibc/wiki/NewPorts>), and in the absence of 
> suitable public architecture and ABI documentation, I don't intend to 
> attempt review of this or subsequent versions of the port submission.

That would be really unfortunate. Your prior reviews of RFC and v1 have been
immensely helpful, it would be a shame to not continue to get this privilege goinf
fwd.

Having said that, wheels were already set in motion after your initial request in
December. The ARCv2 ABI spec was opened up quickly (and mea culpa for not
referencing it v2 submission). It is now publicly accessibly at [1]

The public version of PRM is being worked on, but it will take time to come to
fruition. I hope you appreciate these things take time, considering where we came
from - and it seems you found a workaround anyways ;-)


> (I 
> am supposing that the documentation available at 
> <http://me.bios.io/ARC_disassembly> - which in any case does not include 
> an ABI reference - is for an architecture version too old to be sufficient 
> for understanding and maintaining the port code as may be needed in the 
> course of glibc maintenance.)

Not really. It sure pertains to the predecessor ARCompact ISA, but in ARCv2 the
bulk of changes were to Interrupt architecture, micro-architecture optimizations,
SMP support etc, which are not relevant for glibc or general userspace coding.
While the encodings etc did change, much of the baseline instruction set is pretty
much the same, so ARCv2 assembly or generated code easily maps to ARCompact.

I do hope this is enough for you to reconsider reviewing the code.

Thx,
-Vineet

[1]
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/wiki/files/ARCv2_ABI.pdf
