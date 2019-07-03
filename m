From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 3 Jul 2019 16:12:52 +0000
Subject: [PATCH] ARC: hide unused function unw_hdr_alloc
In-Reply-To: <20190703133940.1493249-1-arnd@arndb.de>
References: <20190703133940.1493249-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7584cf05-e3f9-7027-a08c-87efbfb0f608@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 7/3/19 6:39 AM, Arnd Bergmann wrote:
> As kernelci.org reports, 

Curious, how are you getting these reports ? I want to see as well.

> this function is not used in
> vdk_hs38_defconfig:
> 
> arch/arc/kernel/unwind.c:188:14: warning: 'unw_hdr_alloc' defined but not used [-Wunused-function]
> 
> Fixes: bc79c9a72165 ("ARC: dw2 unwind: Reinstante unwinding out of modules")
> Link: https://kernelci.org/build/id/5d1cae3f59b514300340c132/logs/
> Cc: stable at vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd at arndb.de>

Thx, do you want me to pick this up via arc tree.

Thx,
-Vineet
