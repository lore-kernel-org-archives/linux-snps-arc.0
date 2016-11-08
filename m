From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 8 Nov 2016 16:59:15 +0000
Subject: Errors building kernel 4.9-rc4
In-Reply-To: <1fb9a5be-7ad2-d432-579d-28d849b6ce0b@synopsys.com>
References: <1fb6ab4d-0942-714e-06d7-e663bc20aa49@synopsys.com>
 <695506bc-3546-8469-0f3b-b47f013156b7@synopsys.com>
 <1fb9a5be-7ad2-d432-579d-28d849b6ce0b@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478624307.5131.89.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Tue, 2016-11-08@08:54 -0800, Vineet Gupta wrote:
> On 11/08/2016 02:51 AM, Luis Oliveira wrote:
> > 
> > Hi all,
> > 
> > Below is a list of errors while compiling a clean image of kernel 4.9-rc4.
> > 
> > Regards,
> > Luis
> 
> The issue is due to commit c3005475889c "ARC: build: retire old toggles" which
> removed supposedly obsolete toggles just to make way for removing them from the
> tools. However it seems they are no so obsolete as I thought they were.
> 
> I'm going to have that reverted for now and maybe do this next year when tools are
> immune to this change.
> 
> @Alexey, I tried 2016.03 and that seems to build fine with that patch - what
> version of gcc is Luis using in this buildroot ?

Saying 2016.03 are you referring to arc-2016.03 tools?

I see Luis uses "buildroot-arc-2016.02-rc2" supposedly from this tag:
https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot/tree/arc-2016.02-rc2

And in that tag?arc-2015.12 tools are used.

-Alexey
