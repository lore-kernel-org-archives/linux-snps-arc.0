From: joseph@codesourcery.com (Joseph Myers)
Date: Fri, 21 Dec 2018 14:32:18 +0000
Subject: [PATCH 00/21] glibc port to ARC processors
In-Reply-To: <0f83e63b-dc21-0809-9295-1dde08ab3cc7@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182243320.30183@digraph.polyomino.org.uk>
 <db17a8c2-fdbf-4956-f710-ad4a9d9b6501@synopsys.com>
 <alpine.DEB.2.21.1812182349510.30183@digraph.polyomino.org.uk>
 <0f83e63b-dc21-0809-9295-1dde08ab3cc7@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812211426060.30727@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Fri, 21 Dec 2018, Vineet Gupta wrote:

> is due to linkage of a generic libgcc routine fp-bit.c

I'd suggest moving from fp-bit to soft-fp in libgcc (soft-fp is a lot 
faster, see the 2006 GCC Summit proceedings, though of course you may wish 
to do your own benchmarking on ARC), which would probably avoid that issue 
(though if very concerned about about code size, soft-fp is a bit larger).  
But the "?" in localplt.data would still make sense as long as the GCC 
versions using fp-bit there are supported for building the ARC glibc port.

-- 
Joseph S. Myers
joseph at codesourcery.com
