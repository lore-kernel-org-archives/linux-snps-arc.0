From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 29 Jan 2019 17:32:06 +0000
Subject: [PATCH 1/2] ARCv2: Enable unaligned access in early ASM code
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075014642D45B@US01WEMBX2.internal.synopsys.com>
References: <20190116112951.10641-1-Eugeniy.Paltsev@synopsys.com>
 <3c341dd9-f360-640e-a3c9-3291300d02ae@synopsys.com>
 <1548782756.29008.20.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014642D45B@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548783126.29008.22.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2019-01-29@09:28 -0800, Vineet Gupta wrote:
> On 1/29/19 9:26 AM, Eugeniy Paltsev wrote:
> > > I presume there is no specific reason to include this conditionally.
> > > irqflags.h already includes the right version.
> > 
> > Agree.
> > I've just forgotten about common irqflags.h
> 
> No need for this series. Given Alexey's request, I've pushed the minimal patch.
> You do need to rebase the other unalinged access series on top, however wait for
> me to comment on that.

Ok.

> -Vineet
> 
-- 
 Eugeniy Paltsev
