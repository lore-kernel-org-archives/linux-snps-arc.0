From: greg@kroah.com (Greg KH)
Date: Tue, 2 Aug 2016 09:00:58 +0200
Subject: ARC stable backport request
In-Reply-To: <57458FE3.1070205@synopsys.com>
References: <57458FE3.1070205@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160802070058.GB10877@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Wed, May 25, 2016@05:13:31PM +0530, Vineet Gupta wrote:
> Hi,
> 
> Can we please backport a6416f57ce57fb390b "ARC: use ASL assembler mnemonic".
> Newer binutils don't like ASL instruction and fail to build kernels prior to v4.4
> which added this fix.

Didn't apply to 3.14-stable :(
