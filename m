From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Nov 2015 16:53:04 +0530
Subject: local64_cmpxchg() in arc_perf_event_update()
In-Reply-To: <20151117110749.GT3816@twins.programming.kicks-ass.net>
References: <1445286926.3913.13.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D210D@IN01WEMBXA.internal.synopsys.com>
 <20151117110749.GT3816@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <564B0E18.3040207@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 17 November 2015 04:37 PM, Peter Zijlstra wrote:
> On Tue, Nov 17, 2015@09:14:59AM +0000, Vineet Gupta wrote:
>> > Let's check with Peter as I'm not sure how exactly the read call will
>> > nest for same counter on same core ?
> Various possible ways, but the easiest is userspace doing a sys_read()
> on the counter while the NMI happens.
> 
> 

That means Alexey need to revert the hunk ?

 static void arc_perf_event_update(struct perf_event *event,
 				  struct hw_perf_event *hwc, int idx)
 {
-	uint64_t prev_raw_count, new_raw_count;
-	int64_t delta;
-
-	do {
-		prev_raw_count = local64_read(&hwc->prev_count);
-		new_raw_count = arc_pmu_read_counter(idx);
-	} while (local64_cmpxchg(&hwc->prev_count, prev_raw_count,
-				 new_raw_count) != prev_raw_count);
-
-	delta = (new_raw_count - prev_raw_count) &
-		((1ULL << arc_pmu->counter_size) - 1ULL);
+	uint64_t prev_raw_count = local64_read(&hwc->prev_count);
+	uint64_t new_raw_count = arc_pmu_read_counter(idx);
+	int64_t delta = new_raw_count - prev_raw_count;

+	/*
+	 * We don't afaraid of hwc->prev_count changing beneath our feet
+	 * because there's no way for us to re-enter this function anytime.
+	 */
+	local64_set(&hwc->prev_count, new_raw_count);
