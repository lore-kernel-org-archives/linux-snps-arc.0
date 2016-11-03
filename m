From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Nov 2016 16:33:26 -0700
Subject: [PATCH v3 01/10] ARC: timer: rtc: implement read loop in "C" vs.
 inline asm
In-Reply-To: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
References: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478216015-18931-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

The current code doesn't even compile as somehow the inline assembly
can't see the register names defined as ARC_RTC_*
I'm pretty sure It worked when I first got it merged, but the tools were
definitely different then.

So better to write this in "C" anyways.

CC: stable at vger.kernel.org
Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/kernel/time.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arc/kernel/time.c b/arch/arc/kernel/time.c
index f927b8dc6edd..c10390d1ddb6 100644
--- a/arch/arc/kernel/time.c
+++ b/arch/arc/kernel/time.c
@@ -152,14 +152,17 @@ static cycle_t arc_read_rtc(struct clocksource *cs)
 		cycle_t  full;
 	} stamp;
 
-
-	__asm__ __volatile(
-	"1:						\n"
-	"	lr		%0, [AUX_RTC_LOW]	\n"
-	"	lr		%1, [AUX_RTC_HIGH]	\n"
-	"	lr		%2, [AUX_RTC_CTRL]	\n"
-	"	bbit0.nt	%2, 31, 1b		\n"
-	: "=r" (stamp.low), "=r" (stamp.high), "=r" (status));
+	/*
+	 * hardware has an internal state machine which tracks readout of
+	 * low/high and updates the CTRL.status if
+	 *  - interrupt/exception taken between the two reads
+	 *  - high increments after low has been read
+	 */
+	do {
+		stamp.low = read_aux_reg(AUX_RTC_LOW);
+		stamp.high = read_aux_reg(AUX_RTC_HIGH);
+		status = read_aux_reg(AUX_RTC_CTRL);
+	} while (!(status & _BITUL(31)));
 
 	return stamp.full;
 }
-- 
2.7.4
