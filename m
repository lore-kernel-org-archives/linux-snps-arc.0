From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Wed, 26 Apr 2017 12:56:21 +0000
Subject: [PATCH] ezchip: nps_enet: check if napi has been completed
In-Reply-To: <20170329.143014.2001816338079751776.davem@davemloft.net>
References: <1490784106-14489-1-git-send-email-vzakhar@synopsys.com>
 <20170329.143014.2001816338079751776.davem@davemloft.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1493211381.20370.23.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi David, all,

On Wed, 2017-03-29@14:30 -0700, David Miller wrote:
> From: Vlad Zakharov <Vladislav.Zakharov at synopsys.com>
> Date: Wed, 29 Mar 2017 13:41:46 +0300
> 
> > 
> > After a new NAPI_STATE_MISSED state was added to NAPI we can get into
> > this state and in such case we have to reschedule NAPI as some work is
> > still pending and we have to process it. napi_complete_done() function
> > returns false if we have to reschedule something (e.g. in case we were
> > in MISSED state) as current polling have not been completed yet.
> > 
> > nps_enet driver hasn't been verifying the return value of
> > napi_complete_done() and has been forcibly enabling interrupts. That is
> > not correct as we should not enable interrupts before we have processed
> > all scheduled work. As a result we were getting trapped in interrupt
> > hanlder chain as we had never been able to disabale ethernet
> > interrupts again.
> > 
> > So this patch makes nps_enet_poll() func verify return value of
> > napi_complete_done() and enable interrupts only in case all scheduled
> > work has been completed.
> > 
> > Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
> 
> Applied.
> 
> Eric, if this is really required now, we have 148 broken drivers still.

Could you please backport this patch to stable tree (starting from 4.10) as it is pretty important and fixes nps_enet
driver?

It became actual after Eric's commit?39e6c8208d7b (net: solve a NAPI race) which has already been backported to 4.10.

Thanks.

-- 
Best regards,
Vlad Zakharov <vzakhar at synopsys.com>
