From: jason@lakedaemon.net (Jason Cooper)
Date: Mon, 11 Apr 2016 13:42:44 +0000
Subject: [PATCH v8 3/3] irqchip: add nps Internal and external irqchips
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E9D443@us01wembx1.internal.synopsys.com>
References: <1459707299-31564-1-git-send-email-noamca@mellanox.com>
 <1459707299-31564-4-git-send-email-noamca@mellanox.com>
 <570B9E46.7050402@arm.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E9D443@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160411134244.GE27057@io.lakedaemon.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Apr 11, 2016@01:35:58PM +0000, Vineet Gupta wrote:
> Thomas, how do you prefer to merge this for 4.7. There is a dependency on a soc
> header. Are you OK if I take the series via ARC tree.

fwiw, merge conflicts should be trivial/non-existant for irqchip.  I'm
see no problem with this going via the ARC tree.

Acked-by: Jason Cooper <jason at lakedaemon.net>

thx,

Jason.
