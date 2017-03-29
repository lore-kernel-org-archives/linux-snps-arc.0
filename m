From: davem@davemloft.net (David Miller)
Date: Wed, 29 Mar 2017 14:30:14 -0700 (PDT)
Subject: [PATCH] ezchip: nps_enet: check if napi has been completed
In-Reply-To: <1490784106-14489-1-git-send-email-vzakhar@synopsys.com>
References: <1490784106-14489-1-git-send-email-vzakhar@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170329.143014.2001816338079751776.davem@davemloft.net>
To: linux-snps-arc@lists.infradead.org

From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 29 Mar 2017 13:41:46 +0300

> After a new NAPI_STATE_MISSED state was added to NAPI we can get into
> this state and in such case we have to reschedule NAPI as some work is
> still pending and we have to process it. napi_complete_done() function
> returns false if we have to reschedule something (e.g. in case we were
> in MISSED state) as current polling have not been completed yet.
> 
> nps_enet driver hasn't been verifying the return value of
> napi_complete_done() and has been forcibly enabling interrupts. That is
> not correct as we should not enable interrupts before we have processed
> all scheduled work. As a result we were getting trapped in interrupt
> hanlder chain as we had never been able to disabale ethernet
> interrupts again.
> 
> So this patch makes nps_enet_poll() func verify return value of
> napi_complete_done() and enable interrupts only in case all scheduled
> work has been completed.
> 
> Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>

Applied.

Eric, if this is really required now, we have 148 broken drivers still.
