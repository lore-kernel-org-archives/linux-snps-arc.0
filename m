From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 25 Aug 2017 17:22:41 +0000
Subject: [PATCHi v2] arc: Mask individual IRQ lines during core INTC init
In-Reply-To: <afd8ed16-638d-c176-b84e-503ee0ece668@synopsys.com>
References: <1503670961-16781-1-git-send-email-abrodkin@synopsys.com>
 <afd8ed16-638d-c176-b84e-503ee0ece668@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503681760.10779.75.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2017-08-25@10:13 -0700, Vineet Gupta wrote:
> On 08/25/2017 07:22 AM, Alexey Brodkin wrote:
> > 
> > From: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
> > 
> > ARC cores on reset have all interrupt lines of built-in INTC enabled.
> > Which means once we globally enable interrupts (very early on boot)
> > faulty hardware blocks may trigger an interrupt that Linux kernel
> > cannot handle yet as corresponding handler is not yet installed.
> > 
> > In that case system falls in "interrupt storm" and basically never
> > does anything useful except entering and exiting generic IRQ handling
> > code.
> > 
> > One real example of that kind of problematic hardware is DW GMAC which
> > also has interrupts enabled on reset and if Ethernet PHY informs GMAC
> > about link state, GMAC immediately reports that upstream to ARC core
> > and here we are.
> > 
> > Now with that change we mask all individual IRQ lines making entire
> > system more fool-proof.
> > 
> > [This patch was motivated by Adaptrum platform support]
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Eugeniy Paltsev <paltsev at synopsys.com>
> > Tested-by: Alexandru Gagniuc <alex.g at adaptrum.com>
> > Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> 
> v1 was merged in mainline this week - please provide a fixup patch on top of?
> mainline / for-curr !

Ooops, didn't see that.
Will do shortly.

-Alexey
