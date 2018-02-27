From: shawn.lin@rock-chips.com (Shawn Lin)
Date: Tue, 27 Feb 2018 09:46:39 +0800
Subject: [PATCH 1/2 v3] mmc: dw_mmc: Fix the DTO timeout overflow
 calculation for 32-bit systems
In-Reply-To: <d955cc19-1398-3c05-4742-32664480d07d@rock-chips.com>
References: <20180226143413.44134-1-Evgeniy.Didin@synopsys.com>
 <20180226143413.44134-2-Evgeniy.Didin@synopsys.com>
 <d955cc19-1398-3c05-4742-32664480d07d@rock-chips.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f370f35e-64c4-eaff-e8db-92137fbb29f6@rock-chips.com>
To: linux-snps-arc@lists.infradead.org


> 
> #define DIV_ROUND_DOWN_ULL(ll, d) \
>  ????({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
> 
> #define DIV_ROUND_UP_ULL(ll, d)??????? DIV_ROUND_DOWN_ULL((ll) + (d) - 
> 1, (d))
> 
> 
> It uses intermediate unsigned long long _tmp for your "multiply", namely
> MSEC_PER_SEC * drto_clks * drto_div, which could solves the problem.
> So I don't see why DIV_ROUND_UP_ULL can't work for you?

Take back.  I misunderstood your "multiply", sorry.

> 
> 
>> ????? /* add a bit spare time */
>>
> 
> 
> 
