From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 16 Oct 2018 17:01:38 +0000
Subject: [PATCH] clocksource/drivers/arc_timer: Utilize generic sched_clock
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B0AE356@US01WEMBX2.internal.synopsys.com>
References: <20181016074504.2042-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B0AE356@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646817407C@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta
> Sent: Tuesday, October 16, 2018 7:03 PM
> To: Alexey Brodkin <abrodkin at synopsys.com>; linux-kernel at vger.kernel.org
> Cc: linux-snps-arc at lists.infradead.org; Daniel Lezcano <daniel.lezcano at linaro.org>; Thomas Gleixner <tglx at linutronix.de>
> Subject: Re: [PATCH] clocksource/drivers/arc_timer: Utilize generic sched_clock
> 
> On 10/16/2018 12:45 AM, Alexey Brodkin wrote:
> > It turned out we used to use default implementation of sched_clock()
> > from kernel/sched/clock.c which was as precise as 1/HZ, i.e.
> > by default we had 10 msec granularity of time measurement.
> >
> > Now given ARC built-in timers are clocked with the same frequency as
> > CPU cores we may get much higher precision of time tracking.
> 
> Can you do LMBench runs with and w/o and see if there's any other changes. I'm
> hoping lat_ctx will be more consistent.

Sure, I have this, see below:
========================================================
             L M B E N C H  3 . 0   S U M M A R Y
                 ------------------------------------
		 (Alpha software, do not distribute)

Basic system parameters
--------------------------------------------------------------------------------------
        Host                 OS Description                             Mhz  tlb  cache  mem   scal
                                                                             pages line   par   load
                                                                                   bytes
----------------- ------------- --------------------------------------- ---- ----- ----- ------ ----
hz-2018.10.16.log Linux 4.18.14 hz-2018.10.16.log                        998     8   128 1.7500    1
sched_clock-2018. Linux 4.18.14 sched_clock-2018.10.16.log               997     8       1.7500    1

Processor, Processes - times in microseconds - smaller is better
------------------------------------------------------------------------------
Host                 OS  Mhz null null      open slct sig  sig  fork exec sh  
                             call  I/O stat clos TCP  inst hndl proc proc proc
--------- ------------- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
hz-2018.1 Linux 4.18.14  998 0.38 0.59 2.76 5.02 22.4 0.54 2.23 319. 1780 3347
sched_clo Linux 4.18.14  997 0.38 0.61 2.66 5.01 22.3 0.54 2.25 325. 1775 3315

Basic integer operations - times in nanoseconds - smaller is better
-------------------------------------------------------------------
Host                 OS  intgr intgr  intgr  intgr  intgr  
                          bit   add    mul    div    mod   
--------- ------------- ------ ------ ------ ------ ------ 
hz-2018.1 Linux 4.18.14 1.0100 1.1500          13.0 7.9900
sched_clo Linux 4.18.14 1.0100 1.1500          13.0 7.9900

Basic uint64 operations - times in nanoseconds - smaller is better
------------------------------------------------------------------
Host                 OS int64  int64  int64  int64  int64  
                         bit    add    mul    div    mod   
--------- ------------- ------ ------ ------ ------ ------ 
hz-2018.1 Linux 4.18.14    11.          10.2  126.2   96.5
sched_clo Linux 4.18.14    11.          10.2  126.2   96.6

Basic float operations - times in nanoseconds - smaller is better
-----------------------------------------------------------------
Host                 OS  float  float  float  float
                         add    mul    div    bogo
--------- ------------- ------ ------ ------ ------ 
hz-2018.1 Linux 4.18.14  184.5  181.5  375.0  935.3
sched_clo Linux 4.18.14  185.1  185.7  375.0  882.9

Basic double operations - times in nanoseconds - smaller is better
------------------------------------------------------------------
Host                 OS  double double double double
                         add    mul    div    bogo
--------- ------------- ------  ------ ------ ------ 
hz-2018.1 Linux 4.18.14  253.9  285.6 1490.0 2264.3
sched_clo Linux 4.18.14  255.0  283.6 1515.0 2284.3

Context switching - times in microseconds - smaller is better
-------------------------------------------------------------------------
Host                 OS  2p/0K 2p/16K 2p/64K 8p/16K 8p/64K 16p/16K 16p/64K
                         ctxsw  ctxsw  ctxsw ctxsw  ctxsw   ctxsw   ctxsw
--------- ------------- ------ ------ ------ ------ ------ ------- -------
hz-2018.1 Linux 4.18.14 3.4400 6.7700 0.7300 9.6300   68.1    15.3   115.0
sched_clo Linux 4.18.14 3.5100 7.1300 5.7900 7.9200   71.8    17.6   124.5

*Local* Communication latencies in microseconds - smaller is better
---------------------------------------------------------------------
Host                 OS 2p/0K  Pipe AF     UDP  RPC/   TCP  RPC/ TCP
                        ctxsw       UNIX         UDP         TCP conn
--------- ------------- ----- ----- ---- ----- ----- ----- ----- ----
hz-2018.1 Linux 4.18.14 3.440  14.6 16.0  31.5        48.0        94.
sched_clo Linux 4.18.14 3.510  15.5 13.4  31.5        49.4       158.

*Remote* Communication latencies in microseconds - smaller is better
---------------------------------------------------------------------
Host                 OS   UDP  RPC/  TCP   RPC/ TCP
                               UDP         TCP  conn
--------- ------------- ----- ----- ----- ----- ----
hz-2018.1 Linux 4.18.14                             
sched_clo Linux 4.18.14                             

File & VM system latencies in microseconds - smaller is better
-------------------------------------------------------------------------------
Host                 OS   0K File      10K File     Mmap    Prot   Page   100fd
                        Create Delete Create Delete Latency Fault  Fault  selct
--------- ------------- ------ ------ ------ ------ ------- ----- ------- -----
hz-2018.1 Linux 4.18.14   11.0 7.8438   54.3   12.8   221.0 0.475 1.16420 8.607
sched_clo Linux 4.18.14   10.8 7.7240   54.1   12.9   223.0 0.505 1.16280 8.475

*Local* Communication bandwidths in MB/s - bigger is better
-----------------------------------------------------------------------------
Host                OS  Pipe AF    TCP  File   Mmap  Bcopy  Bcopy  Mem   Mem
                             UNIX      reread reread (libc) (hand) read write
--------- ------------- ---- ---- ---- ------ ------ ------ ------ ---- -----
hz-2018.1 Linux 4.18.14 224. 456. 111.  248.0  404.8  384.6  232.4 405. 454.4
sched_clo Linux 4.18.14 220. 458. 145.  241.6  404.6  384.3  232.3 404. 453.9

Memory latencies in nanoseconds - smaller is better
    (WARNING - may not be correct, check graphs)
------------------------------------------------------------------------------
Host                 OS   Mhz   L1 $   L2 $    Main mem    Rand mem    Guesses
--------- -------------   ---   ----   ----    --------    --------    -------
hz-2018.1 Linux 4.18.14   998 3.0820   24.3       210.5       371.0
sched_clo Linux 4.18.14   997 3.0820   24.3       210.6       371.2
========================================================

> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index dec0dd88ec15..3268dad4effe 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -290,6 +290,7 @@ config CLKSRC_MPS2
> >
> >  config ARC_TIMERS
> >  	bool "Support for 32-bit TIMERn counters in ARC Cores" if COMPILE_TEST
> > +	depends on GENERIC_SCHED_CLOCK
> 
> It needs to select, not depends on

Well from what I may see git grepping:
 1) Architcture selects GENERIC_SCHED_CLOCK
 2) Clocksource driver depends on GENERIC_SCHED_CLOCK

> > @@ -88,6 +89,11 @@ static u64 arc_read_gfrc(struct clocksource *cs)
> >  	return (((u64)h) << 32) | l;
> >  }
> >
> > +static u64 arc_gfrc_clock_read(void)
> 
> Needs to be notrace like other such routines.

Ok will add this.

> >
> > +
> >  static struct clocksource arc_counter_timer1 = {
> >  	.name   = "ARC Timer1",
> >  	.rating = 300,
> > @@ -209,6 +229,8 @@ static int __init arc_cs_setup_timer1(struct device_node *node)
> >  	write_aux_reg(ARC_REG_TIMER1_CNT, 0);
> >  	write_aux_reg(ARC_REG_TIMER1_CTRL, TIMER_CTRL_NH);
> >
> > +	sched_clock_register(arc_timer1_clock_read, 64, arc_timer_freq);
> 
> TIMER1 is 32 bits wide.

Yep , blind copy-pasting is not good, will change it.

-Alexey 
