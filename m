From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 7 Dec 2015 14:09:41 +0000
Subject: [PATCH] ARC: [axs10x] cap ethernet phy to 100 Mbit/sec
References: <1449487297-10093-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D4DB7@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Monday 07 December 2015 04:52 PM, Alexey Brodkin wrote:

Current ARC SDP boards cannot reliably handle 1Gbit
Ethernet connections due to limitations in hardware.

To make sure networking is stable on the board we're
limiting phy to 100 Mbit.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com><mailto:abrodkin at synopsys.com>
Cc: Vineet Gupta <vgupta at synopsys.com><mailto:vgupta at synopsys.com>

LGTM - added to for-curr for 4.4 !

Thx,
-Vineet
