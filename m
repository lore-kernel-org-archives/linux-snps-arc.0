From: gregkh@linuxfoundation.org (Greg KH)
Date: Thu, 14 Jul 2016 07:42:18 +0900
Subject: ARC stable backport request for 4.4 and 4.2
In-Reply-To: <5786A82F.2040303@synopsys.com>
References: <5786A82F.2040303@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160713224218.GC12156@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Jul 13, 2016@01:44:31PM -0700, Vineet Gupta wrote:
> Hi,
> 
> Could you please backport the following upstream commits for v4.4 and v4.2
> 
> 4d0cb15fccd1db9 ("ARCv2: Check for LL-SC livelock only if LLSC is enabled")
> b31ac42697bef4a ("ARCv2: LLSC: software backoff is NOT needed starting HS2.1c")

Applied to 4.4-stable, thanks.

greg k-h
