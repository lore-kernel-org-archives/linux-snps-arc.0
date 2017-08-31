From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 31 Aug 2017 11:28:40 +0000
Subject: [PATCH] ARC: reset: introduce AXS10x reset driver
In-Reply-To: <1502717875.2586.13.camel@synopsys.com>
References: <20170810164112.9894-1-Eugeniy.Paltsev@synopsys.com>
 <1502459172.2310.16.camel@pengutronix.de>
 <1502717875.2586.13.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1504178919.15555.22.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Philipp,

Do you have plans to add reset-simple driver into 4.14?
It would be nice to use it for AXS10x in 4.14.

Thanks.

On Mon, 2017-08-14@13:37 +0000, Eugeniy Paltsev wrote:
> On Fri, 2017-08-11@15:46 +0200, Philipp Zabel wrote:
> > Hi Eugeniy,
> > 
> > On Thu, 2017-08-10@19:41 +0300, Eugeniy Paltsev wrote:
> > > ARC AXS10x boards support custom IP-block which allows to control
> > > reset signals of selected peripherals. For example DW GMAC, etc...
> > > This block is controlled via memory-mapped register (AKA CREG)
> > > which
> > > represents up-to 32 reset lines.
> > > 
> > > As of today only the following lines are used:
> > > ?- DW GMAC - line 5
> > > 
> > > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > 
> > Could you check if the reset-simple driver that I posted today would
> > work for you?
> > 
> 
> Yes, it would. Thanks.
> 
> --?
> ?Eugeniy Paltsev
-- 
?Eugeniy Paltsev
