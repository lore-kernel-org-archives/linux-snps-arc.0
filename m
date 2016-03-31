From: broonie@kernel.org (Mark Brown)
Date: Thu, 31 Mar 2016 09:56:42 -0700
Subject: [PATCH 2/3 v2] ASoC: dwc: Add I2S HDMI audio support
In-Reply-To: <56FCEFD0.8090509@synopsys.com>
References: <cover.1459174494.git.joabreu@synopsys.com>
 <538be366488bf0d7633d702f2d0bab16707b7a47.1459174494.git.joabreu@synopsys.com>
 <20160329173158.GB2350@sirena.org.uk>
 <56FAC355.1040705@synopsys.com>
 <20160329182222.GC2350@sirena.org.uk>
 <56FCEFD0.8090509@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160331165642.GG2350@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, Mar 31, 2016@10:37:20AM +0100, Jose Abreu wrote:
> On 29-03-2016 19:22, Mark Brown wrote:

> > If you want to add a new platform driver you need to add a new platform
> > driver, not shove the code into an existing driver for a seperate IP.

> I can separate the platform driver into a new file but they will have to be
> compiled into the same module as the new additions to the i2s driver depend on
> functions of the platform driver (see i2s_irq_handler()). Or should I divide

No, that's not at all acceptable.  The Designware IP is not specific to
your system, you can't make it depend on your platform driver.  The
kernel needs to work on other people's systems too.  You need to work
through and/or extend the abstractions the framework provides to
separate the drivers for different IPs.

> this into two modules and add a Kconfig option to the platform driver? Besides
> this I first wanted the driver to be compiled into the same module so that it is
> compatible with kernel 3.18 where simple audio card requires that platform
> driver == cpu driver.

That's not OK upstream, we're working on the current kernel not on
random old kernels.  We don't carry compatibility code to enable current
kernel code to be run on years old kernels.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160331/22fcdcbc/attachment.sig>
