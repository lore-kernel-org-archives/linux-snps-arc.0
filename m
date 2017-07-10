From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 10 Jul 2017 13:32:27 +0000
Subject: [PATCH 3/3 v7] ARC: hsdk: initial port for HSDK board
In-Reply-To: <20170710004121.m5sp3wlovh7e6wzq@rob-hp-laptop>
References: <20170703165109.31535-1-Eugeniy.Paltsev@synopsys.com>
 <20170703165109.31535-4-Eugeniy.Paltsev@synopsys.com>
 <20170710004121.m5sp3wlovh7e6wzq@rob-hp-laptop>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499693547.6394.17.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Rob,

On Sun, 2017-07-09@19:41 -0500, Rob Herring wrote:
> On Mon, Jul 03, 2017@07:51:09PM +0300, Eugeniy Paltsev wrote:
> > 
> > From: Alexey Brodkin <abrodkin at synopsys.com>

[snip]

> > +		ohci at 60000 {
> > +			compatible = "generic-ohci";
> 
> Still, these need to be more specific.

But I guess for that we first need to add your compatible values to
drivers/usb/host/{o|e}hci-platform.c, right?

-Alexey
