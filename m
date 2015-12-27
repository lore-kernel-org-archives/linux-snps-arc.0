From: lkp@intel.com (kbuild test robot)
Date: Sun, 27 Dec 2015 22:55:23 +0800
Subject: [PATCH v5 04/20] clocksource: Add NPS400 timers driver
In-Reply-To: <1451222619-3610-5-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201512272200.4NfpC6DB%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
Hi Noam,

[auto build test ERROR on arc/for-next]
[also build test ERROR on v4.4-rc6 next-20151223]

url:    https://github.com/0day-ci/linux/commits/Noam-Camus/Adding-plat-eznps-to-ARC/20151227-220433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc for-next
config: i386-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   drivers/clocksource/timer-nps.c: In function 'nps_timer_event_setup':
>> drivers/clocksource/timer-nps.c:60:2: error: implicit declaration of function 'write_aux_reg' [-Werror=implicit-function-declaration]
     write_aux_reg(ARC_REG_TIMER0_LIMIT, cycles);
     ^
   drivers/clocksource/timer-nps.c: In function 'nps_timer_cpu_notify':
>> drivers/clocksource/timer-nps.c:106:3: error: implicit declaration of function 'enable_percpu_irq' [-Werror=implicit-function-declaration]
      enable_percpu_irq(nps_timer_irq, 0);
      ^
>> drivers/clocksource/timer-nps.c:111:3: error: implicit declaration of function 'disable_percpu_irq' [-Werror=implicit-function-declaration]
      disable_percpu_irq(nps_timer_irq);
      ^
   drivers/clocksource/timer-nps.c: In function 'nps_setup_clocksource':
   drivers/clocksource/timer-nps.c:148:6: error: 'NPS_MSU_BLKID' undeclared (first use in this function)
         NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
         ^
   drivers/clocksource/timer-nps.c:148:6: note: each undeclared identifier is reported only once for each function it appears in
   drivers/clocksource/timer-nps.c: In function 'nps_setup_clockevents':
>> drivers/clocksource/timer-nps.c:176:8: error: implicit declaration of function 'request_percpu_irq' [-Werror=implicit-function-declaration]
     ret = request_percpu_irq(irq, nps_timer_irq_handler,
           ^
   cc1: some warnings being treated as errors

vim +/write_aux_reg +60 drivers/clocksource/timer-nps.c

    54		.mask   = CLOCKSOURCE_MASK(32),
    55		.flags  = CLOCK_SOURCE_IS_CONTINUOUS,
    56	};
    57	
    58	static void nps_timer_event_setup(unsigned int cycles)
    59	{
  > 60		write_aux_reg(ARC_REG_TIMER0_LIMIT, cycles);
    61		write_aux_reg(ARC_REG_TIMER0_CNT, 0);   /* start from 0 */
    62	
    63		write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IE | TIMER_CTRL_NH);
    64	}
    65	
    66	static int nps_clkevent_set_next_event(unsigned long delta,
    67					       struct clock_event_device *dev)
    68	{
    69		nps_timer_event_setup(delta);
    70		return 0;
    71	}
    72	
    73	static int nps_clkevent_set_periodic(struct clock_event_device *dev)
    74	{
    75		/*
    76		 * At X Hz, 1 sec = 1000ms -> X cycles;
    77		 *                    10ms -> X / 100 cycles
    78		 */
    79		nps_timer_event_setup(nps_timer_rate / HZ);
    80		return 0;
    81	}
    82	
    83	static DEFINE_PER_CPU(struct clock_event_device, nps_clockevent_device) = {
    84		.name			= "nps_sys_timer",
    85		.features               = CLOCK_EVT_FEAT_ONESHOT |
    86					  CLOCK_EVT_FEAT_PERIODIC,
    87		.rating                 = 300,
    88		.set_next_event         = nps_clkevent_set_next_event,
    89		.set_state_periodic     = nps_clkevent_set_periodic,
    90	};
    91	
    92	static int nps_timer_cpu_notify(struct notifier_block *self,
    93					unsigned long action, void *hcpu)
    94	{
    95		struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
    96	
    97		evt->irq = nps_timer_irq;
    98		evt->cpumask = cpumask_of(smp_processor_id());
    99	
   100		/*
   101		 * Grab cpu pointer in each case to avoid spurious
   102		 * preemptible warnings
   103		 */
   104		switch (action & ~CPU_TASKS_FROZEN) {
   105		case CPU_STARTING:
 > 106			enable_percpu_irq(nps_timer_irq, 0);
   107			clockevents_config_and_register(evt, nps_timer_rate,
   108							0, ULONG_MAX);
   109			break;
   110		case CPU_DYING:
 > 111			disable_percpu_irq(nps_timer_irq);
   112			break;
   113		}
   114	
   115		return NOTIFY_OK;
   116	}
   117	
   118	static struct notifier_block nps_timer_cpu_nb = {
   119		.notifier_call = nps_timer_cpu_notify,
   120	};
   121	
   122	static irqreturn_t nps_timer_irq_handler(int irq, void *dev_id)
   123	{
   124		struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
   125		int irq_reenable = clockevent_state_periodic(evt);
   126	
   127		/*
   128		 * Any write to CTRL reg ACks the interrupt, we rewrite the
   129		 * Count when [N]ot [H]alted bit.
   130		 * And re-arm it if perioid by [I]nterrupt [E]nable bit
   131		 */
   132		write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | TIMER_CTRL_NH);
   133	
   134		evt->event_handler(evt);
   135	
   136		return IRQ_HANDLED;
   137	}
   138	
   139	static void __init nps_setup_clocksource(struct device_node *node,
   140						 struct clk *clk, int irq)
   141	{
   142		struct clocksource *clksrc = &nps_counter;
   143		int ret, cluster;
   144	
   145		for (cluster = 0; cluster < NPS_CLUSTER_NUM; cluster++)
   146			nps_msu_reg_low_addr[cluster] =
   147				nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
   148					 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
   149	
   150		ret = clk_prepare_enable(clk);
   151		if (ret)
   152			pr_err("Couldn't enable parent clock\n");
   153	
   154		nps_timer_rate = clk_get_rate(clk);
   155	
   156		ret = clocksource_register_hz(clksrc, nps_timer_rate);
   157		if (ret)
   158			pr_err("Couldn't register clock source.\n");
   159	}
   160	
   161	static void __init nps_setup_clockevents(struct device_node *node,
   162						 struct clk *clk, int irq)
   163	{
   164		struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
   165		int ret;
   166	
   167		register_cpu_notifier(&nps_timer_cpu_nb);
   168	
   169		evt->irq = irq;
   170		evt->cpumask = cpumask_of(smp_processor_id());
   171	
   172		clockevents_config_and_register(evt, nps_timer_rate, 0, ULONG_MAX);
   173	
   174		enable_percpu_irq(irq, 0);
   175	
 > 176		ret = request_percpu_irq(irq, nps_timer_irq_handler,
   177					 "timer", evt);
   178		if (ret)
   179			pr_err("Unable to register interrupt\n");

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 52554 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20151227/e70423e8/attachment-0001.obj>
