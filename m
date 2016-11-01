From: lkp@intel.com (kbuild test robot)
Date: Tue, 1 Nov 2016 08:01:00 +0800
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <1477954096-770-10-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201611010729.RHZWyA5l%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

[auto build test ERROR on linus/master]
[also build test ERROR on v4.9-rc3]
[cannot apply to arc/for-next]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
[Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
[Check https://git-scm.com/docs/git-format-patch for more information]

url:    https://github.com/0day-ci/linux/commits/Vineet-Gupta/Move-ARC-timer-code-into-drivers-clocksource/20161101-065452
config: ia64-allmodconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 6.2.0
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=ia64 

All error/warnings (new ones prefixed by >>):

>> drivers/clocksource/arc_timer.c:237:19: warning: 'struct clock_event_device' declared inside parameter list will not be visible outside of this definition or declaration
               struct clock_event_device *dev)
                      ^~~~~~~~~~~~~~~~~~
   drivers/clocksource/arc_timer.c:243:45: warning: 'struct clock_event_device' declared inside parameter list will not be visible outside of this definition or declaration
    static int arc_clkevent_set_periodic(struct clock_event_device *dev)
                                                ^~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:6:0,
                    from arch/ia64/include/asm/percpu.h:45,
                    from arch/ia64/include/asm/processor.h:77,
                    from arch/ia64/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:58,
                    from include/asm-generic/preempt.h:4,
                    from ./arch/ia64/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/interrupt.h:8,
                    from drivers/clocksource/arc_timer.c:18:
>> drivers/clocksource/arc_timer.c:253:30: error: variable 'arc_clockevent_device' has initializer but incomplete type
    static DEFINE_PER_CPU(struct clock_event_device, arc_clockevent_device) = {
                                 ^
   include/linux/percpu-defs.h:95:13: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     __typeof__(type) name
                ^~~~
>> drivers/clocksource/arc_timer.c:253:8: note: in expansion of macro 'DEFINE_PER_CPU'
    static DEFINE_PER_CPU(struct clock_event_device, arc_clockevent_device) = {
           ^~~~~~~~~~~~~~
>> drivers/clocksource/arc_timer.c:254:2: error: unknown field 'name' specified in initializer
     .name   = "ARC Timer0",
     ^
>> drivers/clocksource/arc_timer.c:254:12: warning: excess elements in struct initializer
     .name   = "ARC Timer0",
               ^~~~~~~~~~~~
   drivers/clocksource/arc_timer.c:254:12: note: (near initialization for 'arc_clockevent_device')
>> drivers/clocksource/arc_timer.c:255:2: error: unknown field 'features' specified in initializer
     .features  = CLOCK_EVT_FEAT_ONESHOT |
     ^
>> drivers/clocksource/arc_timer.c:255:15: error: 'CLOCK_EVT_FEAT_ONESHOT' undeclared here (not in a function)
     .features  = CLOCK_EVT_FEAT_ONESHOT |
                  ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/clocksource/arc_timer.c:256:7: error: 'CLOCK_EVT_FEAT_PERIODIC' undeclared here (not in a function)
          CLOCK_EVT_FEAT_PERIODIC,
          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/arc_timer.c:255:15: warning: excess elements in struct initializer
     .features  = CLOCK_EVT_FEAT_ONESHOT |
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/arc_timer.c:255:15: note: (near initialization for 'arc_clockevent_device')
>> drivers/clocksource/arc_timer.c:257:2: error: unknown field 'rating' specified in initializer
     .rating   = 300,
     ^
   drivers/clocksource/arc_timer.c:257:14: warning: excess elements in struct initializer
     .rating   = 300,
                 ^~~
   drivers/clocksource/arc_timer.c:257:14: note: (near initialization for 'arc_clockevent_device')
>> drivers/clocksource/arc_timer.c:258:2: error: unknown field 'set_next_event' specified in initializer
     .set_next_event  = arc_clkevent_set_next_event,
     ^
   drivers/clocksource/arc_timer.c:258:21: warning: excess elements in struct initializer
     .set_next_event  = arc_clkevent_set_next_event,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/arc_timer.c:258:21: note: (near initialization for 'arc_clockevent_device')
>> drivers/clocksource/arc_timer.c:259:2: error: unknown field 'set_state_periodic' specified in initializer
     .set_state_periodic = arc_clkevent_set_periodic,
     ^
   drivers/clocksource/arc_timer.c:259:24: warning: excess elements in struct initializer
     .set_state_periodic = arc_clkevent_set_periodic,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/arc_timer.c:259:24: note: (near initialization for 'arc_clockevent_device')
   drivers/clocksource/arc_timer.c: In function 'timer_irq_handler':
>> drivers/clocksource/arc_timer.c:268:9: error: invalid use of undefined type 'struct clock_event_device'
     struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
            ^~~~~~~~~~~~~~~~~~
>> drivers/clocksource/arc_timer.c:269:36: error: implicit declaration of function 'clockevent_state_periodic' [-Werror=implicit-function-declaration]
     int irq_reenable __maybe_unused = clockevent_state_periodic(evt);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clocksource/arc_timer.c:278:5: error: dereferencing pointer to incomplete type 'struct clock_event_device'
     evt->event_handler(evt);
        ^~
   drivers/clocksource/arc_timer.c: In function 'arc_timer_starting_cpu':
   drivers/clocksource/arc_timer.c:286:9: error: invalid use of undefined type 'struct clock_event_device'
     struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
            ^~~~~~~~~~~~~~~~~~
>> drivers/clocksource/arc_timer.c:290:2: error: implicit declaration of function 'clockevents_config_and_register' [-Werror=implicit-function-declaration]
     clockevents_config_and_register(evt, arc_timer_freq, 0, ARC_TIMER_MAX);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/arc_timer.c: In function 'arc_clockevent_setup':
   drivers/clocksource/arc_timer.c:306:9: error: invalid use of undefined type 'struct clock_event_device'
     struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
            ^~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:6:0,
                    from arch/ia64/include/asm/percpu.h:45,
                    from arch/ia64/include/asm/processor.h:77,
                    from arch/ia64/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:58,
                    from include/asm-generic/preempt.h:4,
                    from ./arch/ia64/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/interrupt.h:8,
                    from drivers/clocksource/arc_timer.c:18:
   drivers/clocksource/arc_timer.c: At top level:
>> drivers/clocksource/arc_timer.c:253:50: error: storage size of 'arc_clockevent_device' isn't known
    static DEFINE_PER_CPU(struct clock_event_device, arc_clockevent_device) = {
                                                     ^
   include/linux/percpu-defs.h:95:19: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     __typeof__(type) name
                      ^~~~
>> drivers/clocksource/arc_timer.c:253:8: note: in expansion of macro 'DEFINE_PER_CPU'
    static DEFINE_PER_CPU(struct clock_event_device, arc_clockevent_device) = {
           ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/arc_clockevent_device +253 drivers/clocksource/arc_timer.c

d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  231  
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  232  	write_aux_reg(ARC_REG_TIMER0_CTRL, TIMER_CTRL_IE | TIMER_CTRL_NH);
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  233  }
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  234  
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  235  
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  236  static int arc_clkevent_set_next_event(unsigned long delta,
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18 @237  				       struct clock_event_device *dev)
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  238  {
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  239  	arc_timer_event_setup(delta);
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  240  	return 0;
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  241  }
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  242  
aeec6cdad arch/arc/kernel/time.c          Viresh Kumar        2015-07-16  243  static int arc_clkevent_set_periodic(struct clock_event_device *dev)
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  244  {
c9a98e184 arch/arc/kernel/time.c          Vineet Gupta        2014-06-25  245  	/*
c9a98e184 arch/arc/kernel/time.c          Vineet Gupta        2014-06-25  246  	 * At X Hz, 1 sec = 1000ms -> X cycles;
c9a98e184 arch/arc/kernel/time.c          Vineet Gupta        2014-06-25  247  	 *		      10ms -> X / 100 cycles
c9a98e184 arch/arc/kernel/time.c          Vineet Gupta        2014-06-25  248  	 */
77c8d0d6b arch/arc/kernel/time.c          Vineet Gupta        2016-01-01  249  	arc_timer_event_setup(arc_timer_freq / HZ);
aeec6cdad arch/arc/kernel/time.c          Viresh Kumar        2015-07-16  250  	return 0;
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  251  }
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  252  
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18 @253  static DEFINE_PER_CPU(struct clock_event_device, arc_clockevent_device) = {
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18 @254  	.name			= "ARC Timer0",
aeec6cdad arch/arc/kernel/time.c          Viresh Kumar        2015-07-16 @255  	.features		= CLOCK_EVT_FEAT_ONESHOT |
aeec6cdad arch/arc/kernel/time.c          Viresh Kumar        2015-07-16 @256  				  CLOCK_EVT_FEAT_PERIODIC,
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18 @257  	.rating			= 300,
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18 @258  	.set_next_event		= arc_clkevent_set_next_event,
aeec6cdad arch/arc/kernel/time.c          Viresh Kumar        2015-07-16 @259  	.set_state_periodic	= arc_clkevent_set_periodic,
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  260  };
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  261  
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  262  static irqreturn_t timer_irq_handler(int irq, void *dev_id)
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  263  {
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  264  	/*
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  265  	 * Note that generic IRQ core could have passed @evt for @dev_id if
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  266  	 * irq_set_chip_and_handler() asked for handle_percpu_devid_irq()
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  267  	 */
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25 @268  	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
31aaee97f drivers/clocksource/arc_timer.c Vineet Gupta        2016-10-31 @269  	int irq_reenable __maybe_unused = clockevent_state_periodic(evt);
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  270  
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  271  	/*
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  272  	 * Any write to CTRL reg ACks the interrupt, we rewrite the
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  273  	 * Count when [N]ot [H]alted bit.
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  274  	 * And re-arm it if perioid by [I]nterrupt [E]nable bit
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  275  	 */
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  276  	write_aux_reg(ARC_REG_TIMER0_CTRL, irq_reenable | TIMER_CTRL_NH);
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25  277  
f8b34c3fd arch/arc/kernel/time.c          Vineet Gupta        2014-01-25 @278  	evt->event_handler(evt);
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  279  
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  280  	return IRQ_HANDLED;
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  281  }
d8005e6b9 arch/arc/kernel/time.c          Vineet Gupta        2013-01-18  282  
ecd8081f6 arch/arc/kernel/time.c          Anna-Maria Gleixner 2016-07-13  283  
ecd8081f6 arch/arc/kernel/time.c          Anna-Maria Gleixner 2016-07-13  284  static int arc_timer_starting_cpu(unsigned int cpu)
eec3c58ef arch/arc/kernel/time.c          Noam Camus          2016-01-01  285  {
eec3c58ef arch/arc/kernel/time.c          Noam Camus          2016-01-01  286  	struct clock_event_device *evt = this_cpu_ptr(&arc_clockevent_device);
eec3c58ef arch/arc/kernel/time.c          Noam Camus          2016-01-01  287  
eec3c58ef arch/arc/kernel/time.c          Noam Camus          2016-01-01  288  	evt->cpumask = cpumask_of(smp_processor_id());
eec3c58ef arch/arc/kernel/time.c          Noam Camus          2016-01-01  289  
ecd8081f6 arch/arc/kernel/time.c          Anna-Maria Gleixner 2016-07-13 @290  	clockevents_config_and_register(evt, arc_timer_freq, 0, ARC_TIMER_MAX);
eec3c58ef arch/arc/kernel/time.c          Noam Camus          2016-01-01  291  	enable_percpu_irq(arc_timer_irq, 0);
ecd8081f6 arch/arc/kernel/time.c          Anna-Maria Gleixner 2016-07-13  292  	return 0;
eec3c58ef arch/arc/kernel/time.c          Noam Camus          2016-01-01  293  }

:::::: The code at line 253 was first introduced by commit
:::::: d8005e6b95268cbb50db3773d5f180c32a9434fe ARC: Timers/counters/delay management

:::::: TO: Vineet Gupta <vgupta at synopsys.com>
:::::: CC: Vineet Gupta <vgupta at synopsys.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 45102 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20161101/6a1b541d/attachment-0001.gz>
