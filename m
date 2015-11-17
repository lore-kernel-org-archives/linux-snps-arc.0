From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 17 Nov 2015 14:59:32 +0100
Subject: [PATCH v2 18/19] ARC: [plat-eznps] replace sync with proper cpu
 barrier
In-Reply-To: <564B2C50.3080401@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-19-git-send-email-noamc@ezchip.com>
 <564B0BB1.8080709@synopsys.com>
 <20151117112343.GW3816@twins.programming.kicks-ass.net>
 <564B1182.7050107@synopsys.com>
 <20151117122208.GX3816@twins.programming.kicks-ass.net>
 <564B1F74.6090709@synopsys.com>
 <20151117124421.GY17308@twins.programming.kicks-ass.net>
 <564B2C50.3080401@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151117135932.GA3816@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 17, 2015@07:02:00PM +0530, Vineet Gupta wrote:
> > You should never report more than PERF_MAX_STACK_DEPTH thingies anyway,
> > so once you've done that many loops, you're good to bail, right?
> 
> Yeah, although I need to ensure if arch code needs to check that. Plus the
> unwinder is also used for things like ps wchan, /proc/<pid>/stack, crash dump etc.

Ah, ok. On x86 we have a separate unwinder for perf. Trying to touch
userspace memory from NMI context is a tad tricky.

(imagine the NMI interrupting a page-fault and then itself triggering a
page-fault again)

> > You're likely to call this code from interrupt/NMI context, there is no
> > ^C or scheduling going to help you there.
> 
> For perf case, but there are other uses of unwinder as described above.
> 
> So in light of above, do u think that the cond_resched() + signal_pending check is
> not needed and the bail if over N iters will be fine !

It can't hurt, but you want to engineer it to be robust for the most
constrained environment, so I would say the bail over N iters had
better be robust, otherwise you're screwed anyhow ;-)
