From: emil.l.velikov@gmail.com (Emil Velikov)
Date: Wed, 30 Mar 2016 10:58:42 +0100
Subject: [PATCH 1/3 v2] drm/i2c/adv7511: Add audio support
In-Reply-To: <15b1936d307912ba12df7fa09ec3a7a80ac5fcef.1459174494.git.joabreu@synopsys.com>
References: <cover.1459174494.git.joabreu@synopsys.com>
 <15b1936d307912ba12df7fa09ec3a7a80ac5fcef.1459174494.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CACvgo53rc2DhQdJUZJB5Lsj57vJGytU7GKqp-O_YZvzH7Df1XA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On 28 March 2016@15:36, Jose Abreu <Jose.Abreu@synopsys.com> wrote:
> This patch adds audio support for the ADV7511 HDMI transmitter
> using ALSA SoC.
>
> The code was ported from Analog Devices linux tree from
> commit 1770c4a1e32b ("Merge remote-tracking branch
> 'xilinx/master' into xcomm_zynq"), which is available at:
>         - https://github.com/analogdevicesinc/linux/
>
> The main core file was renamed from adv7511.c to adv7511_core.c
> so that audio and video compile into a single adv7511.ko module
> and to keep up with Analog Devices kernel tree.
>
> The audio can be disabled using menu-config so it is possible
> to use only video mode.
>
> The HDMI mode is automatically started at boot and the audio
> (when enabled) registers as a codec into ALSA.
>
> SPDIF DAI format was also added to ASoC as it is required
> by adv7511 audio.
>
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> ---
>
> No changes v1 -> v2.
>
>  drivers/gpu/drm/i2c/Kconfig         |   11 +
>  drivers/gpu/drm/i2c/Makefile        |    2 +
>  drivers/gpu/drm/i2c/adv7511.c       | 1024 -----------------------------------
>  drivers/gpu/drm/i2c/adv7511.h       |   41 ++
>  drivers/gpu/drm/i2c/adv7511_audio.c |  310 +++++++++++
>  drivers/gpu/drm/i2c/adv7511_core.c  | 1005 ++++++++++++++++++++++++++++++++++
Please keep the file rename separate (and use -M flag when generating
the patch) from the introduction of audio support. Having to check 1k
LOC movement alongside the introduction of new one is a bit...
suboptimal.

Regards,
Emil
