From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 5 Jul 2017 09:05:09 +0000
Subject: [PATCH] arc: remove num-slots from arc platforms
In-Reply-To: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
References: <1499238645-29178-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1499245508.4224.13.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Shawn,

On Wed, 2017-07-05@15:10 +0800, Shawn Lin wrote:
> dwmmc driver deprecated num-slots and plan to get rid
> of it finally. Just move a step to cleanup it from DT.

Hm, that's interesting.
In our upcoming devboard (HSDK, see
http://lists.infradead.org/pipermail/linux-snps-arc/2017-July/002667.html)
we do use 2 slots of DW MobileStorage controller (even though it's not yet
mentioned in its .dts).

So the question is if multi-slot support gets removed from dwmmc driver or
it's just a .dts option gets obsoleted. In latter case I'm wondering how to
enable a second slot in dwmmc driver (will it just auto-probe it etc)?

-Alexey
