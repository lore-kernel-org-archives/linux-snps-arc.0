From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Thu, 31 Mar 2016 10:37:20 +0100
Subject: [PATCH 2/3 v2] ASoC: dwc: Add I2S HDMI audio support
In-Reply-To: <20160329182222.GC2350@sirena.org.uk>
References: <cover.1459174494.git.joabreu@synopsys.com>
 <538be366488bf0d7633d702f2d0bab16707b7a47.1459174494.git.joabreu@synopsys.com>
 <20160329173158.GB2350@sirena.org.uk> <56FAC355.1040705@synopsys.com>
 <20160329182222.GC2350@sirena.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56FCEFD0.8090509@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Mark,

On 29-03-2016 19:22, Mark Brown wrote:
> On Tue, Mar 29, 2016@07:03:01PM +0100, Jose Abreu wrote:
>
>> The major part of this patch is the adding of an ALSA platform driver so that
>> audio comes out of the box in AXS boards but we also added functionalities to
>> the i2s driver and performed one bug fix related with the mask/unmask of
>> interrupts. I will split the patches but they will depend on each other.
> If you want to add a new platform driver you need to add a new platform
> driver, not shove the code into an existing driver for a seperate IP.
>

I can separate the platform driver into a new file but they will have to be
compiled into the same module as the new additions to the i2s driver depend on
functions of the platform driver (see i2s_irq_handler()). Or should I divide
this into two modules and add a Kconfig option to the platform driver? Besides
this I first wanted the driver to be compiled into the same module so that it is
compatible with kernel 3.18 where simple audio card requires that platform
driver == cpu driver.

Best regards,
Jose Miguel Abreu
