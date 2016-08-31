From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 31 Aug 2016 12:05:14 -0700
Subject: [PATCH] arc: perf: Enable generic "cache-references" and
 "cache-misses" events
In-Reply-To: <6074e252-6e18-bb01-4de1-023bd7e82f03@synopsys.com>
References: <1472125647-518-1-git-send-email-abrodkin@synopsys.com>
 <6074e252-6e18-bb01-4de1-023bd7e82f03@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5f65fa04-8d33-e525-115d-4e6991a7668e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/26/2016 10:31 AM, Vineet Gupta wrote:
> On 08/25/2016 04:49 AM, Alexey Brodkin wrote:
>> ...
>>  	[PERF_COUNT_ARC_EDTLB] = "edtlb",	/* D-TLB Miss */
>>  	[PERF_COUNT_ARC_EITLB] = "eitlb",	/* I-TLB Miss */
>> +
>> +	[PERF_COUNT_HW_CACHE_REFERENCES] = "imemrdc",	/* Instr: mem read cached */
>> +	[PERF_COUNT_HW_CACHE_MISSES] = "dclm",		/* D-cache Load Miss */
> I think this is duplicating a mistake we already have. I vaguely remember when
> doing some hackbench profiling last year with range based profiling confined to
> memset routine and saw that L1-dcache-misses was counting zero. This is because it
> only counts LD misses while memset only does ST.
>
> Performance counter stats for '/sbin/hackbench':
>
>      0 L1-dcache-misses
>      0 L1-dcache-load-misses
>      1846082 L1-dcache-store-misses
>
>
> @PeterZ do you concur that is wrong and we ought to setup 2 counters to do this
> correctly ?

Hi Peter / Will,

Can you provide some guidance here. So I looked at what others do -
ARMV7_PERFCTR_L1_DCACHE_REFILL counts both load and store misses, while ARC has 2
separate conditions for load or stores. Is there an existing mechanism to "group"
/ "add" them to give a cumulative PERF_COUNT_HW_CACHE_MISSES - is that what perf
event grouping is ?

Quoting from perf wiki @ https://perf.wiki.kernel.org/index.php/Tutorial

"It can be interesting to try and pack events in a way that guarantees that event
A and B are always measured together. Although the perf_events kernel interface
provides support for event grouping, the current perf tool does *not*."

Thx,
-Vineet
