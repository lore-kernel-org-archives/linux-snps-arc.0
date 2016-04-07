From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 7 Apr 2016 17:57:51 +0100
Subject: [PATCH v8 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <1459707299-31564-3-git-send-email-noamca@mellanox.com>
References: <1459707299-31564-1-git-send-email-noamca@mellanox.com>
 <1459707299-31564-3-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160407165751.GC9188@linaro.org>
To: linux-snps-arc@lists.infradead.org

On Sun, Apr 03, 2016@09:14:58PM +0300, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> Add internal tick generator which is shared by all cores.
> Each cluster of cores view it through dedicated address.
> This is used for SMP system where all CPUs synced by same
> clock source.
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Cc: Rob Herring <robh+dt at kernel.org>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: John Stultz <john.stultz at linaro.org>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>
