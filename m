From: broonie@kernel.org (Mark Brown)
Date: Tue, 7 Jun 2016 18:30:45 +0100
Subject: [PATCH 1/2 v8] ASoC: dwc: Add PIO PCM extension
In-Reply-To: <09988b615638750c435d95f87906d7974f2b239c.1464601439.git.joabreu@synopsys.com>
References: <cover.1464601439.git.joabreu@synopsys.com>
 <09988b615638750c435d95f87906d7974f2b239c.1464601439.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160607173045.GE7510@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, May 30, 2016@10:53:15AM +0100, Jose Abreu wrote:

A few small things but this looks basically fine.

> +		if (isr[i] & 0x33)
> +			irq_valid = true;

This checks for a mask of 0x33 but...

> +
> +		/*
> +		 * Check if TX fifo is empty. If empty fill FIFO with samples
> +		 * NOTE: Only two channels supported
> +		 */
> +		if ((isr[i] & 0x10) && (i == 0) && dev->use_pio)
> +			dw_pcm_push_tx(dev);
> +
> +		/* Error Handling */
> +		if (isr[i] & 0x20)
> +			dev_err(dev->dev, "TX overrun (ch_id=%d)\n", i);
> +		if (isr[i] & 0x02)
> +			dev_err(dev->dev, "RX overrun (ch_id=%d)\n", i);

...only 0x32 seem to actually be handled, and then only sometimes.  It's
going to be clearer and more robust to just set the handled flag to true
when handling, that way we don't have to match up different numerical
masks.  Some defines would help legibility too.

> +	ret = snd_pcm_lib_malloc_pages(substream,
> +			params_buffer_bytes(hw_params));
> +	return (ret < 0) ? ret : 0;

Write normal if statements please, it helps legibility.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160607/a295cf1c/attachment.sig>
