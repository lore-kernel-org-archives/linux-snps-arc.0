From: davem@davemloft.net (David Miller)
Date: Wed, 08 Feb 2017 13:15:19 -0500 (EST)
Subject: [PATCH] net: phy: dp83867: Fall-back to default values of
 clock delay and FIFO depth
In-Reply-To: <20170206192445.35829-1-abrodkin@synopsys.com>
References: <20170206192445.35829-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170208.131519.1313210815958231832.davem@davemloft.net>
To: linux-snps-arc@lists.infradead.org

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon,  6 Feb 2017 22:24:45 +0300

> Given there're default values mentioned in the PHY datasheet
> fall-back gracefully to them instead of silently return an error
> through the whole call-chain.
> 
> This allows to use minimalistic description in DT if no special
> features are required.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

If these defaults are legitimate to use, then you should probably also
set them in the non-CONFIG_OF_MDIO case implementation of
dp83867_of_init().

But I'd like to see feedback and reviews from other PHY area experts
before I even consider that updated version of this change.

Thanks.
