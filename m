From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 18:28:47 +0100
Subject: [PATCH 0/9] Move ARC timer code into drivers/clocksource/
In-Reply-To: <1477954096-770-1-git-send-email-vgupta@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103172847.GH1859@mai>
To: linux-snps-arc@lists.infradead.org

On Mon, Oct 31, 2016@03:48:07PM -0700, Vineet Gupta wrote:
> Hi,
> 
> This series addresses the long pending move of ARC timer code into
> drivers/clocksource/.
> 
> - patches [1-4]/9 are improvements to arc code, paving way for later code motion.
> - patches [5-8]/9 refactor the arc headers to be shared between arc and drivers
> - patch 9/9 moves out the driver code/build/Kconfig bits
> 
> As review progresses/concludes, I'd like to merge [1-8] for this merge window and
> clocksource maintainers can pick up the actual switch for 4.10 or even 4.9 as they
> prefer.
> 

The different patches deserve a longer change description.
