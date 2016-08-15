From: greg@kroah.com (greg@kroah.com)
Date: Mon, 15 Aug 2016 09:45:07 +0200
Subject: ARC stable backport request
In-Reply-To: <1471243259.3485.1.camel@synopsys.com>
References: <57458FE3.1070205@synopsys.com> <20160814153944.GG20560@kroah.com>
 <1471243259.3485.1.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160815074507.GA6359@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Aug 15, 2016@06:42:45AM +0000, Alexey Brodkin wrote:
> Hi Greg,
> 
> On Sun, 2016-08-14@17:39 +0200, Greg KH wrote:
> > On Wed, May 25, 2016@05:13:31PM +0530, Vineet Gupta wrote:
> > > 
> > > Hi,
> > > 
> > > Can we please backport a6416f57ce57fb390b "ARC: use ASL assembler mnemonic".
> > > Newer binutils don't like ASL instruction and fail to build kernels prior to v4.4
> > > which added this fix.
> > 
> > Fails to apply to 3.14-stable :(
> 
> Looks like it's there already. Isn't it?
> http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/arch/arc?h=linux-3.14.y&id=8ba2f5328c2c9859bb
> bf412e5804974483d66e9d

Doh!  Sorry for the noise, my fault...

greg k-h
