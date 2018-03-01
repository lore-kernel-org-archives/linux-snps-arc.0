From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 1 Mar 2018 15:13:10 +0000
Subject: Do we need to disable preemption in flush_tlb_range()?
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1519917189.13866.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

Just noticed that in comments for smp_call_function_many() it is said that
preemption must be disabled during its execution. And that function gets executed
among other ways like that:
-------------------------->8-----------------------
  flush_tlb_range()
    -> on_each_cpu_mask()
         -> smp_call_function_many()
-------------------------->8-----------------------

I'm not seeing right now any real problem with current implementation but
some architectures do that thus the question.

-Alexey
