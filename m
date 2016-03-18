From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 18 Mar 2016 14:41:03 +0100
Subject: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc 4.8
In-Reply-To: <56EBFC41.7010803@synopsys.com>
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
 <4819806.6rjMriPpyK@wuerfel> <56EBFC41.7010803@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <12216502.1fD0EQ8zlH@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Friday 18 March 2016 18:31:53 Vineet Gupta wrote:
> 
> > On a related note, I have submitted a patch that turns CONFIG_CC_OPTIMIZE_FOR_SIZE
> > into a choice statement, so we actually get the -Wmaybe-uninitialized warnings
> > in an allyesconfig or allmodconfig build. It would be trivial to extend that
> > to give the choice between -Os, -O2 and -O3, and then pick -O3 in a defconfig,
> > over the -O2 default.
> 
> Is it posted already. I couldn't find it with quick googling.
> 
> 
https://lkml.org/lkml/2016/2/12/315

	Arnd
