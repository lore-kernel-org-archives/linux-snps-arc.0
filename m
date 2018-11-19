From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 19 Nov 2018 11:30:29 +0000
Subject: [PATCH v2] clocksource/drivers/arc_timer: Utilize generic
 sched_clock
In-Reply-To: <6bb98a9c-899e-ee9c-d630-da07382c1c16@linaro.org>
References: <20181017113020.7551-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B0B1A07@US01WEMBX2.internal.synopsys.com>
 <78ccbb4c-56d0-594b-4032-3eb19202847b@linaro.org>
 <2c46ab6e-f0a9-4857-9772-f3c714284e98@linaro.org>
 <dab866a50e66e73f6010de1487b06019887930c8.camel@synopsys.com>
 <40ada5b3-5824-51fd-501f-ef363f162047@linaro.org>
 <e31a11c42c21353963bd75c88493e8158316d469.camel@synopsys.com>
 <6bb98a9c-899e-ee9c-d630-da07382c1c16@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <550d684014e46c9f93f249dd61702cfb0e7efdda.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On Mon, 2018-11-19@10:58 +0100, Daniel Lezcano wrote:
> Hi Alexey,
> 
> On 19/11/2018 10:55, Alexey Brodkin wrote:
> > Hi Daniel,
> 
> [ ... ]
> 
> > > > In that case do I understand correctly that we may enable GENERIC_SCHED_CLOCK
> > > > for ARC even before proposed change for arc_timer.c gets merged - i.e. with no
> > > > special GENERIC_SCHED_CLOCK driver we'll safely fall-back to jiffie-based
> > > > sched clock which we anyways use now when GENERIC_SCHED_CLOCK is disabled, right?
> > > 
> > > The ARC's Kconfig part does not apply on tip/timers/core.
> > 
> > May I have a reference to that tree so I may check what gets in the way there
> > and then I'll just move "select GENERIC_SCHED_CLOCK" a bit below so there're no
> > clashes any longer.
> 
> sure, here it is:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.kernel.org_pub_scm_linux_kernel_git_tip_tip.git_log_-3Fh-3Dtimers_core&d=DwIDaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=r2hJtdjpPi2Y1yDo7wgo7nKu7MV8MU8gRPg3DD1mcyI&s=NOTZZBd25Vlk8-jmMUHxtpEhfxlkanXdvKN3-HQSc9w&e=

Well I did have it based on 4.18 for some reason thus were those clashes.
Rebased on top of Linus' up-to-date tree and re-sent v3.

-Alexey
