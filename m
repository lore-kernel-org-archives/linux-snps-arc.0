From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Wed, 04 Oct 2017 12:09:38 +0200
Subject: [PATCH v2] ARC: reset: introduce AXS10x reset driver
In-Reply-To: <1505753484.9807.18.camel@pengutronix.de>
References: <20170914142842.12225-1-Eugeniy.Paltsev@synopsys.com>
 <1505736441.9807.8.camel@pengutronix.de>
 <ce7885ab-b87e-ca07-234f-b63811afd86c@synopsys.com>
 <1505753484.9807.18.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1507111778.11691.9.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Mon, 2017-09-18@18:51 +0200, Philipp Zabel wrote:
> > Will it be OK for you to apply the corresponding DT update for
> > platform - that way?
> > I don't have to keep track of when ur branch hits mainline etc.
> > 
> > The chances of any ensuing conflicts are pretty rare - and easy to resolve if at all.
> > 
> > If so, Eugeniy can send the patch ur way !
> 
> Maybe it is better to do this the other way around? I can put this patch
> on a stable reset/arc branch for you to merge before applying the reset
> DT updates.

Have you come to a decision on this?

Just in case, I have removed the AXS10x driver from the reset/next
branch and put it on its own branch:

  git://git.pengutronix.de/git/pza/linux.git reset/arc

This branch is immutable and I'll merge it into reset/next before
submitting the branch for v4.15-rc1.

regards
Philipp
