From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 1 Aug 2016 09:53:47 +0000
Subject: Build failure in linux mainline when building arcv2 images
In-Reply-To: <579C2C9E.6040904@roeck-us.net>
References: <579ACC26.9020106@roeck-us.net>
 <25e43ee1-5015-9dc3-777e-6101872f2ec4@synopsys.com>
 <579B5D79.8060907@roeck-us.net>
 <66774d12-285a-438f-c050-fba65601bd3c@synopsys.com>
 <20160729214854.GA21977@roeck-us.net>
 <1cc37edf-d48e-9b98-1bb6-f20e319cf12b@synopsys.com>
 <579C2C9E.6040904@roeck-us.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1470045132.28725.39.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,?Guenter,

On Fri, 2016-07-29@21:27 -0700, Guenter Roeck wrote:
> On 07/29/2016 03:46 PM, Vineet Gupta wrote:
> 
> > 
> > What you want is
> > 2016-05-19 09439560b9f9 toolchain: bump ARC tools to arc-2016.03 release
> > 
> > which seems to be present in released 2016.05, but when I checkout 2016.05 tag (or
> > aa6fd11feebff) that patch is not there !
> > 
> 
> A toolchain build off SHA 09439560b9f9 works.

Indeed we were a little-bit too late for BR 2016.05 release with
our toolchain bump so the patch in question only made its way in BR repo
right after BR release.

Anyways good to know your issue is resolved now.

Note with arc-2016.03 we still see a lot of issues here and there
because that's the first version that uses our rewritten from scratch binutils
(the base for binutils port upstreaming for ARC). And so in BR we continue to
update ARC tools to so-called engineering builds of our current development
branches of gcc and binutils. That information might be useful if you face any
other issues building stuff for ARC.

Or don't hesitate to email us so we'll try to point you to something that
should work :)

-Alexey
