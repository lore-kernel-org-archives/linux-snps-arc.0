From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 23:52:33 +0000
Subject: [PATCH 00/21] glibc port to ARC processors
In-Reply-To: <db17a8c2-fdbf-4956-f710-ad4a9d9b6501@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182243320.30183@digraph.polyomino.org.uk>
 <db17a8c2-fdbf-4956-f710-ad4a9d9b6501@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182349510.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> At any rate, the generated code will likely be different for -Os and otherwise,
> does that mean entries get added conditionally to localplt.data etc ?

Entries *can* have a "?" to indicate they are optional (although avoiding 
the PLT reference is better - see how include/string.h does asm 
redirection of mempcpy and stpcpy, or likewise in 
sysdeps/wordsize-32/divdi3-symbol-hacks.h, for example).

> ARC historically has supported both LE/BE, but we are kind of moving 
> away from BE and as far as I know, there's no-one actively working with 
> BE (except 1 specific customer with legact cores). It is safe to assume 
> we won't support BE and this is sort of easier said for ARC processors 
> as they have many many hardware config knobs and not all are supported 
> for Linux usecase, so BE can be considered as such.

In that case, there should be a #error in bits/endian.h, or a 
configure-time error, or something like that, to make clear the glibc port 
does not support BE.

-- 
Joseph S. Myers
joseph at codesourcery.com
