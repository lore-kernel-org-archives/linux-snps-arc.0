From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 28 Apr 2016 14:38:18 +0000
Subject: [PATCH 2/2] ARC: [axs10x] Specify reserved memory for frame buffer
In-Reply-To: <57221693.50401@synopsys.com>
References: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
 <1461767701-12208-3-git-send-email-abrodkin@synopsys.com>
 <572190F3.3020709@synopsys.com> <1461851171.3673.30.camel@synopsys.com>
 <57221693.50401@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461854287.3673.50.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2016-04-28@19:26 +0530, Vineet Gupta wrote:
> On Thursday 28 April 2016 07:16 PM, Alexey Brodkin wrote:
> > 
> > > 
> > > > 
> > > > Note that the IOC start alignment needs to follow
> > > > max(4k, size). What will be maximum size of frame buffer - 16M always !
> > What do you mean by that?
> For HS38, we intend to bypass the frame buffer traffic from IOC port. So the frame
> buffer start needs to be inside the IOC aperture base address. That value can't be
> arbitrary - it is atleast 4K aligned value and further also needs to be aligned to
> the size of aperture. So if the size is 16M it needs to be 16M aligned etc...

The point is we want to put frame buffer memory OUTSIDE IOC aperture.
So we allocate FB memory in the very end of DDR which is far away from IOC.

And in that case IOC alignment issues are out of the question here.

-Alexey
