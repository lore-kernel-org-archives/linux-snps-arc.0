From: broonie@kernel.org (Mark Brown)
Date: Tue, 24 May 2016 17:41:51 +0100
Subject: [PATCH 3/4 v7] ASoC: dwc: Add PIO PCM extension
In-Reply-To: <d81055d826825874c9d76922d2275688b2586fa6.1463996627.git.joabreu@synopsys.com>
References: <cover.1463996627.git.joabreu@synopsys.com>
 <d81055d826825874c9d76922d2275688b2586fa6.1463996627.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160524164151.GM8206@sirena.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, May 23, 2016@11:02:24AM +0100, Jose Abreu wrote:

> +config SND_DESIGNWARE_PCM
> +	bool "PCM PIO extension for I2S driver"

Why can't this be built as a module?

> +
> +	return irq_valid ? IRQ_HANDLED : IRQ_NONE;

Please write a normal if statement, the ternery operator doesn't help
legibility.

>  static void i2s_start(struct dw_i2s_dev *dev,
>  		      struct snd_pcm_substream *substream)
>  {
>  	struct i2s_clk_config_data *config = &dev->config;
>  
>  	i2s_write_reg(dev->i2s_base, IER, 1);
> -	i2s_enable_irqs(dev, substream->stream, config->chan_nr);
> +
> +	if (dev->use_pio)
> +		i2s_enable_irqs(dev, substream->stream, config->chan_nr);
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>  		i2s_write_reg(dev->i2s_base, ITER, 1);

That seems wrong, or at least something that should be separate?
Previously we needed interrupts for DMA operation but now we enable
interrupts only if we don't use DMA.  It feels like we want to make the
change for DMA separately if only to make it clear for bisection, are we
100% sure that masking the interrupt won't also mask the DMA request
signals?

> +	irq = platform_get_irq(pdev, 0);
> +	if (irq >= 0) {
> +		dev_dbg(&pdev->dev, "using PIO mode\n");
> +		dev->use_pio = true;
> +
> +		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
> +				pdev->name, dev);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to request irq\n");
> +			return ret;
> +		}
> +	}

This also seems wrong.  We're forcing PIO if an interrupt is provided
rather than based on DMA being configured which means that if the
interrupt is wired up and happens to be described in DT we'll get worse
performance.  People should be able to just describe the system without
worrying about this, and we might find some other use for the interrupts
in future.  Indeed right now it would probably be reasonable to use the
error interrupts all the time if they're available.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160524/45119ed3/attachment.sig>
