From: broonie@kernel.org (Mark Brown)
Date: Tue, 29 Mar 2016 10:00:22 -0700
Subject: [PATCH 0/3 v2] Add I2S/ADV7511 audio support for ARC AXS10x boards
In-Reply-To: <cover.1459174494.git.joabreu@synopsys.com>
References: <cover.1459174494.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160329170022.GT2350@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, Mar 28, 2016@03:36:08PM +0100, Jose Abreu wrote:
> ARC AXS10x platforms consist of a mainboard with several peripherals.
> One of those peripherals is an HDMI output port controlled by the ADV7511
> transmitter.

I'm going to tell you the same thing I tell everyone else working on
HDMI audio integration: you all need to talk to each other and review
each other's code and unless there is a very good reason for it there
should be at least some code sharing.  For example take a look at the
patches Jyri Sarha has been posting recently.  I don't have detailed
knowledge of HDMI and the range of hardware that's out there for it but
I am seeing a number of different people posting patch serieses that
look a lot like each other and like they should be sharing things.

Please also try to keep your CC lists reasonable, the set of people
you've copied on this stuff is enormous and I'm having trouble seeing
why a lot of tehm are included.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160329/e963f8cf/attachment.sig>
