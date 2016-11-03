From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 23:13:08 +0100
Subject: [PATCH v2 06/10] ARC: timer: Build gfrc, rtc under same option
 (64-bit timers)
In-Reply-To: <1478208701-30923-7-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-7-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103221308.GO1859@mai>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 03, 2016@02:31:37PM -0700, Vineet Gupta wrote:
> The original distinction was done as they were deveoped at different

s/deveoped/developed/

> times and primarily becuse they are specific to UP (RTC) and SMP (GFRC).

s/becuse/because/

> 
> But given that driver now handles that at runtime, (i.e. not allowing
> RTC as clocksource in SMP), we can simplify things a bit.
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
