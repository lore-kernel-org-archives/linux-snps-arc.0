From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 14 Mar 2018 19:15:11 +0000
Subject: Do we need to disable preemption in flush_tlb_range()?
In-Reply-To: <1519917189.13866.6.camel@synopsys.com>
References: <1519917189.13866.6.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1521054910.11552.44.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Ping!

On Thu, 2018-03-01@18:13 +0300, Alexey Brodkin wrote:
> Hi Vineet,
> 
> Just noticed that in comments for smp_call_function_many() it is said that
> preemption must be disabled during its execution. And that function gets executed
> among other ways like that:
> -------------------------->8-----------------------
>   flush_tlb_range()
>     -> on_each_cpu_mask()
>          -> smp_call_function_many()
> -------------------------->8-----------------------
> 
> I'm not seeing right now any real problem with current implementation but
> some architectures do that thus the question.
> 
> -Alexey
