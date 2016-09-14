From: vgupta@synopsys.com (Vineet Gupta)
Date: Wed, 14 Sep 2016 10:53:48 -0700
Subject: [PATCH] arc: perf: Enable generic "cache-references" and
 "cache-misses" events
In-Reply-To: <6074e252-6e18-bb01-4de1-023bd7e82f03@synopsys.com>
References: <1472125647-518-1-git-send-email-abrodkin@synopsys.com>
 <6074e252-6e18-bb01-4de1-023bd7e82f03@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e9ee8ab7-815b-f213-d61b-30dcf1cbf61f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/26/2016 10:30 AM, Vineet Gupta wrote:
> On 08/25/2016 04:49 AM, Alexey Brodkin wrote:
>> ...
>>  	[PERF_COUNT_ARC_EDTLB] = "edtlb",	/* D-TLB Miss */
>>  	[PERF_COUNT_ARC_EITLB] = "eitlb",	/* I-TLB Miss */
>> +
>> +	[PERF_COUNT_HW_CACHE_REFERENCES] = "imemrdc",	/* Instr: mem read cached */
>> +	[PERF_COUNT_HW_CACHE_MISSES] = "dclm",		/* D-cache Load Miss */
> 
> I think this is duplicating a mistake we already have. I vaguely remember when
> doing some hackbench profiling last year with range based profiling confined to
> memset routine and saw that L1-dcache-misses was counting zero. This is because it
> only counts LD misses while memset only does ST.

So given that this is the best we got, I'm going to merge this anyways.

-Vineet

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
> 
> -Vineet
> 
