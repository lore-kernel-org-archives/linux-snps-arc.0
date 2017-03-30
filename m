From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Thu, 30 Mar 2017 09:16:44 +0000
Subject: [PATCH] ezchip: nps_enet: check if napi has been completed
In-Reply-To: <CANn89iJ1+7CrF=hJj-_pLWV+EDXxhUZGOL+3je6zjE8dJDcr=A@mail.gmail.com>
References: <1490784106-14489-1-git-send-email-vzakhar@synopsys.com>
 <20170329.143014.2001816338079751776.davem@davemloft.net>
 <CANn89iJ1+7CrF=hJj-_pLWV+EDXxhUZGOL+3je6zjE8dJDcr=A@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1490865403.32756.21.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Eric,

On Wed, 2017-03-29@14:41 -0700, Eric Dumazet wrote:
> On Wed, Mar 29, 2017@2:30 PM, David Miller <davem@davemloft.net> wrote:
> Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
> > 
> > 
> > Applied.
> > 
> > Eric, if this is really required now, we have 148 broken drivers still.
> 
> Piece of cake :/
> 
> If we get more reports like that, we might implement a logic to
> prevent infinite loops.
> 
> It is not clear to me what exactly happened to this driver, since
> testing napi_complete_done() was not mandatory.

I am not sure what is happening with other drivers, but in case of ezchip?nps_enet driver after the following commit:
39e6c8208d7b6fb9d2047850fb3327db567b564b

if we got into NAPI_STATE_MISSED state the following happened:
in nps_enet_poll func we were calling napi_complete_done() (which reset MISSED state but left SCHED state) and after
that without any checks were enabling interrupts.

Then we obviously were getting into nps_enet_irq_hanlder() if irq was pending (it is very possbile state). If we look
inside this function we will see that it disables interrupts only in case napi_sched_prep() returns true. In its turn
napi_sched_prep() returns true only in case it changes state from non-SCHED to SCHED. But in our case as SCHED had been
already set it set MISSED state and then returned false. So at that point we had already been trapped: after exiting irq
hanlder we were getting into nps_enet_irq_hanlder() again and again as we couldn't rescind pending irq signal and
disable corresponding irq.?

-- 
Best regards,
Vlad Zakharov <vzakhar at synopsys.com>
