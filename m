From: noamc@ezchip.com (Noam Camus)
Date: Fri, 20 Nov 2015 11:59:32 +0000
Subject: [PATCH v2 03/19] clocksource: Add NPS400 timers driver
In-Reply-To: <alpine.DEB.2.11.1511071222340.4032@nanos>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-4-git-send-email-noamc@ezchip.com>
 <alpine.DEB.2.11.1511071222340.4032@nanos>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB114173F975B483AFE2C26995D61A0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Thomas Gleixner [mailto:tglx at linutronix.de] 
>Sent: Saturday, November 07, 2015 1:26 PM


>So that clocksource goes up to 1GHz. That means u32 fits ~4.29 seconds. Unless you are striving for NOHZ idle sleep times above that there is no point in doing that 64bit dance.
>
>The timekeeping code is perfectly fine with a 32bit value. You just have to set the proper mask.

We do it because we do indeed care very much for long NOHZ idle (and full) times on NPS, hence the song and dance.

-Noam
