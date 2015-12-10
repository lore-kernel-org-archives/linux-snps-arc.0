From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Dec 2015 09:25:54 +0000
Subject: percpu irq APIs and perf
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D580B@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marc / Daniel / Jason,

I had a couple of questions about percpu irq API, hopefully you can help answer.

On ARM, how do u handle requesting per cpu IRQs - specifically usage of request_percpu_irq() / enable_percpu_irq() API.
It seems, for using them, we obviously need to explicitly set irq as percpu and as a consequence explicitly enable autoen (since former disables that). See arch/arc/kernel/irq.c: arc_request_percpu_irq() called by ARC per cpu timer setup.

    if (!cpu)  {
           irq_set_percpu_devid()   <--- disables AUTOEN
           irq_modify_status(IRQ_NOAUTOEN)  <-- to undo side-effect of above
           request_percpu_irq
    }
    enable_percpu_irq

I don't see pattern in general for drivers/clocksource/ and/or arm_arch_timer.c for PPI case.

Further there is an ordering requirement as in request_percpu_irq() needs to be called only for the first calling core, and enable_percpu_irq() on each one. If enable is done ahead of request it obviously fails.

For ARC I've historically used a wrapper arc_request_percpu_irq() [pseudo code above] - which has an inherent assumption (now realize fragile) that it will be called on core0 first thus guaranteeing the ordering above. This is true for timer, IPI etc but not for other late probed peripherals - specially perf.

Infact ARC perf probe open codes on_each_cpu() to ensure irq request is done locally first.

But this all falls apart, when perf probe happens on coreX (not core0), causing enable to be called ahead of request anyways. This is what I'm running into now.

I think the solution is to call request_percpu_irq() on whatever core hits first and call enable_percpu_irq() from a cpu up notifier. But I think the notifier won't run on boot cpu ?  Or is there a better way to clean up all this mess.

FWIW, I see this issue on 3.18 kernel but not latest 4.4-rcX because in 3.18 arc perf probe invariably happens on coreX (due to init task migration right after clocksource switch - something which doesn't happen on 4.4 likely due to recent timer core changes).

Thx,
-Vineet
