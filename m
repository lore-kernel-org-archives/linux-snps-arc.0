From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 Jun 2016 17:00:59 +0200
Subject: Build failures in -next due to 'locking/atomic, arch/arc:
 Implement atomic_fetch_{add,sub,and,andnot,or,xor}()'
In-Reply-To: <57640EB5.8090604@roeck-us.net>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <57640EB5.8090604@roeck-us.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <576410AB.6050204@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 17 June 2016 04:52 PM, Guenter Roeck wrote:
>>> Crud, I messed up the rebase against the backoff reverts. Lemme go do
>>> fixups.
>>
>> I've misplaced my arc compiler, but does this make it go again?
>>
> Looks like it, yes. Build still fails for another reason, but this problem is gone.
> I can not do any runtime tests, though, only build tests.
> 
> Guenter

We can do that once Peter adjusts his patch !

-Vineet
