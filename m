From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Wed, 25 May 2016 11:49:12 +0100
Subject: [PATCH 3/4 v7] ASoC: dwc: Add PIO PCM extension
In-Reply-To: <20160525101801.GT8206@sirena.org.uk>
References: <cover.1463996627.git.joabreu@synopsys.com>
 <d81055d826825874c9d76922d2275688b2586fa6.1463996627.git.joabreu@synopsys.com>
 <20160524164151.GM8206@sirena.org.uk> <57448A42.9050606@synopsys.com>
 <20160524175144.GO8206@sirena.org.uk> <57457A63.5060702@synopsys.com>
 <20160525101801.GT8206@sirena.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57458328.8080900@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Mark,


On 25-05-2016 11:18, Mark Brown wrote:
> On Wed, May 25, 2016@11:11:47AM +0100, Jose Abreu wrote:
>
>> I think I will take the second option. Something like this:
>> "
>>     ret = snd_dmaengine_pcm_register(...)
>>     if (ret == -EPROBE_DEFER)
>>         return ret;
>>     else
>>         pio_register(...);
>> "?
> Sure.  You should print a diagnostic if you fail to get the DMA, for any
> real system it's going to be a bug.

Ok, will do that. I noticed the last I2S patch that you merged
("ASoC: dwc: Add helper functions to disable/enable irqs") is not
in for-next yet. Should I base my work on 'topic/dwc' branch?

Best regards,
Jose Miguel Abreu
