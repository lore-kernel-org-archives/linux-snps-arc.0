From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Nov 2015 19:02:00 +0530
Subject: [PATCH v2 18/19] ARC: [plat-eznps] replace sync with proper cpu
 barrier
In-Reply-To: <20151117124421.GY17308@twins.programming.kicks-ass.net>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-19-git-send-email-noamc@ezchip.com>
 <564B0BB1.8080709@synopsys.com>
 <20151117112343.GW3816@twins.programming.kicks-ass.net>
 <564B1182.7050107@synopsys.com>
 <20151117122208.GX3816@twins.programming.kicks-ass.net>
 <564B1F74.6090709@synopsys.com>
 <20151117124421.GY17308@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <564B2C50.3080401@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 17 November 2015 06:14 PM, Peter Zijlstra wrote:
> On Tue, Nov 17, 2015@06:07:08PM +0530, Vineet Gupta wrote:
>> On Tuesday 17 November 2015 05:52 PM, Peter Zijlstra wrote:
>>>>> BTW since we are on the topic we have this loop in stack unwinder which can
>>>>> potentially cause RCU stalls, actual lockups etc. I was planning to add the
>>>>> following - does that seem fine to you.
>>> Worries me more than anything. How could you get stuck in there?
>>
>> No we not getting stuck in there - but this has potential to - if say unwind info
>> were corrupt (not seen that ever though).
> 
> Better put in a failsafe for that anyway, just out of sheer paranoia :-)

Indeed, loop for say 32 times at max or some such.


> You should never report more than PERF_MAX_STACK_DEPTH thingies anyway,
> so once you've done that many loops, you're good to bail, right?

Yeah, although I need to ensure if arch code needs to check that. Plus the
unwinder is also used for things like ps wchan, /proc/<pid>/stack, crash dump etc.

>> The old code won't even respond to say a Ctrl+C if it were stuck !
>> Plus the reschedule there will keeps sched happy when say unraveling deep stack
>> frames with perf ?
> 
> You're likely to call this code from interrupt/NMI context, there is no
> ^C or scheduling going to help you there.

For perf case, but there are other uses of unwinder as described above.

So in light of above, do u think that the cond_resched() + signal_pending check is
not needed and the bail if over N iters will be fine !
