From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 18:51:55 +0100
Subject: [PATCH 3/9] ARC: timer: gfrc: boot print alongside other timers
In-Reply-To: <fff6abb9-3e19-3865-2b1c-9616ebfba5a9@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-4-git-send-email-vgupta@synopsys.com>
 <20161103170941.GD1859@mai>
 <fff6abb9-3e19-3865-2b1c-9616ebfba5a9@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103175155.GJ1859@mai>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 03, 2016@10:47:19AM -0700, Vineet Gupta wrote:
> On 11/03/2016 10:09 AM, Daniel Lezcano wrote:
> > On Mon, Oct 31, 2016@03:48:10PM -0700, Vineet Gupta wrote:
> >> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> > 
> > Why not add a message in drivers/clocksource/clksrc-probe.c when a timer inits
> > successfully ? and then get rid of this code.
> 
> At boot I have bunch of cod which prints all the major hardware blocks and thus
> would like to print it. We also print if a feature is present but not supported
> etc. So I like to keep all of that here.
> 
> Also same code is used for /proc/cpuinfo.

Ok, I see. Thanks for the clarification.
