From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 27 May 2016 09:37:29 +0530
Subject: [PATCH 1/1] net: nps_enet: Disable interrupts before napi
 reschedule
In-Reply-To: <1464285174.4578.36.camel@synopsys.com>
References: <1464264006-26627-1-git-send-email-eladkan@mellanox.com>
 <1464285174.4578.36.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5747C801.8020808@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Elad, Noam,

On Thursday 26 May 2016 11:23 PM, Alexey Brodkin wrote:

> 
> We just bumped into the same problem (data exchange hangs on the very first "ping")
> with released Linux v4.6 and linux-next on our nSIM OSCI virtual platform.
> 
> I believe it was commit 05c00d82f4d1 ("net: nps_enet: bug fix - handle lost tx interrupts")
> that introduced the problem. At least reverting it I got networking working.
> 
> And indeed that patch fixes mentioned issue.
> In other words...
> 
> Tested-by: Alexey Brodkin <abrodkin at synopsys.com>

FWIW, we now actively use the same driver (and same systemc model) in one of our
our simulation platforms used for testing regressions. So please try to keep arc
mailing list on CC for any nps_enet driver patches so we are in loop and know what
is going on !

Thx,
-Vineet
