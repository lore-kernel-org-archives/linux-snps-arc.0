From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 4 Nov 2016 18:11:13 +0000
Subject: [PATCH v2 02/10] ARC: timer: gfrc, rtc: deuglify big endian code
In-Reply-To: <1478208701-30923-3-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646785A952@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

A couple of misspellings in the commit message below.

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Friday, November 04, 2016 12:32 AM
> To: Daniel Lezcano <daniel.lezcano at linaro.org>
> Cc: Noam Camus <noamca at mellanox.com>; tglx at linutronix.de; linux-snps-arc at lists.infradead.org; linux-kernel at vger.kernel.org;
> Alexey.Brodkin at synopsys.com; Vineet Gupta <vgupta at synopsys.com>
> Subject: [PATCH v2 02/10] ARC: timer: gfrc, rtc: deuglify big endian code
> 
> A standard "C" shift will be handled appropriately by the compiler
> dependin gon the endian used fo rbuild. So we don't need the

"depending on", "used for build".

-Alexey
