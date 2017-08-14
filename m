From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 14 Aug 2017 13:37:56 +0000
Subject: [PATCH] ARC: reset: introduce AXS10x reset driver
In-Reply-To: <1502459172.2310.16.camel@pengutronix.de>
References: <20170810164112.9894-1-Eugeniy.Paltsev@synopsys.com>
 <1502459172.2310.16.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1502717875.2586.13.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Fri, 2017-08-11@15:46 +0200, Philipp Zabel wrote:
> Hi Eugeniy,
> 
> On Thu, 2017-08-10@19:41 +0300, Eugeniy Paltsev wrote:
> > ARC AXS10x boards support custom IP-block which allows to control
> > reset signals of selected peripherals. For example DW GMAC, etc...
> > This block is controlled via memory-mapped register (AKA CREG)
> > which
> > represents up-to 32 reset lines.
> > 
> > As of today only the following lines are used:
> > ?- DW GMAC - line 5
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> 
> Could you check if the reset-simple driver that I posted today would
> work for you?
> 
Yes, it would. Thanks.

-- 
?Eugeniy Paltsev
