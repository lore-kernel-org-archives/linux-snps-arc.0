From: greg@kroah.com (Greg KH)
Date: Sun, 14 Aug 2016 17:39:44 +0200
Subject: ARC stable backport request
In-Reply-To: <57458FE3.1070205@synopsys.com>
References: <57458FE3.1070205@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160814153944.GG20560@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Wed, May 25, 2016@05:13:31PM +0530, Vineet Gupta wrote:
> Hi,
> 
> Can we please backport a6416f57ce57fb390b "ARC: use ASL assembler mnemonic".
> Newer binutils don't like ASL instruction and fail to build kernels prior to v4.4
> which added this fix.

Fails to apply to 3.14-stable :(
