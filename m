From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 30 Nov 2017 09:46:26 -0800
Subject: [PATCH] ARC: Enable machine_desc->init_per_cpu for non-SMP configs
In-Reply-To: <20171129082145.23327-1-abrodkin@synopsys.com>
References: <20171129082145.23327-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ee663800-7f72-c310-2a65-d8b52a811f15@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/29/2017 12:21 AM, Alexey Brodkin wrote:
> As of today we assumed that "machine_desc->init_per_cpu" calls
> are only usable on SMP systems when we want to run some piece of
> code on early boot for each and every core, I guess assumption was
> we have "machine_desc->init_early" for single-core cases where
> the one and only master core can do all the things.
> 
> But it turned out for platforms which might be both UP and SMP it
> might be benificial to use "init_per_cpu" for both UP and SMP cases
> with which we achieve 2 things simultaneously:
>   1) Exactly the same one code will be used for UP&SMP for
>      things required to be done on each an every core regardless if it's
>      a master and the only core in UP system or any other slave core in SMP
>      setup.
>   1) There will be no "ifdef CONFIG_SMP" around "init_per_cpu".
> 

Seems fine to me. However this needs to go with the actual platform change which 
needs it.

-Vineet
