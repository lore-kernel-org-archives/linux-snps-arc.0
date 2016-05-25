From: broonie@kernel.org (Mark Brown)
Date: Wed, 25 May 2016 11:18:01 +0100
Subject: [PATCH 3/4 v7] ASoC: dwc: Add PIO PCM extension
In-Reply-To: <57457A63.5060702@synopsys.com>
References: <cover.1463996627.git.joabreu@synopsys.com>
 <d81055d826825874c9d76922d2275688b2586fa6.1463996627.git.joabreu@synopsys.com>
 <20160524164151.GM8206@sirena.org.uk>
 <57448A42.9050606@synopsys.com>
 <20160524175144.GO8206@sirena.org.uk>
 <57457A63.5060702@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160525101801.GT8206@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, May 25, 2016@11:11:47AM +0100, Jose Abreu wrote:

> I think I will take the second option. Something like this:
> "
>     ret = snd_dmaengine_pcm_register(...)
>     if (ret == -EPROBE_DEFER)
>         return ret;
>     else
>         pio_register(...);
> "?

Sure.  You should print a diagnostic if you fail to get the DMA, for any
real system it's going to be a bug.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160525/d63a99cd/attachment.sig>
