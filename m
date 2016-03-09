From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 9 Mar 2016 16:42:43 +0530
Subject: [PATCH] mm: slub: Ensure that slab_unlock() is atomic
In-Reply-To: <20160309103143.GF25010@twins.programming.kicks-ass.net>
References: <1457447457-25878-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1603080857360.4047@east.gentwo.org>
 <56DEF3D3.6080008@synopsys.com>
 <alpine.DEB.2.20.1603081438020.4268@east.gentwo.org>
 <56DFC604.6070407@synopsys.com>
 <20160309101349.GJ6344@twins.programming.kicks-ass.net>
 <20160309103143.GF25010@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56E0052B.3080304@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wednesday 09 March 2016 04:01 PM, Peter Zijlstra wrote:
> On Wed, Mar 09, 2016@11:13:49AM +0100, Peter Zijlstra wrote:
>> ---
>> Subject: bitops: Do not default to __clear_bit() for __clear_bit_unlock()
>>
>> __clear_bit_unlock() is a special little snowflake. While it carries the
>> non-atomic '__' prefix, it is specifically documented to pair with
>> test_and_set_bit() and therefore should be 'somewhat' atomic.
>>
>> Therefore the generic implementation of __clear_bit_unlock() cannot use
>> the fully non-atomic __clear_bit() as a default.
>>
>> If an arch is able to do better; is must provide an implementation of
>> __clear_bit_unlock() itself.
>>
> 
> FWIW, we could probably undo this if we unified all the spinlock based
> atomic ops implementations (there's a whole bunch doing essentially the
> same), and special cased __clear_bit_unlock() for that.
> 
> Collapsing them is probably a good idea anyway, just a fair bit of
> non-trivial work to figure out all the differences and if they matter
> etc..

Indeed I thought about this when we first did the SMP port. The only issue was
somewhat more generated code with the hashed spinlocks (vs. my dumb 2 spin locks -
which as I see now will also cause false sharing - likely ending up in the same
cache line), but I was more of a micro-optimization freak then than I'm now :-)

So yeah I agree !
