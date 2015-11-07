From: tglx@linutronix.de (Thomas Gleixner)
Date: Sun, 8 Nov 2015 00:52:33 +0100 (CET)
Subject: [PATCH v2 04/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <DB5PR02MB1141A8FD2BC4427FBAF2C286D6170@DB5PR02MB1141.eurprd02.prod.outlook.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-5-git-send-email-noamc@ezchip.com>,
 <alpine.DEB.2.11.1511071227030.4032@nanos>
 <DB5PR02MB1141A8FD2BC4427FBAF2C286D6170@DB5PR02MB1141.eurprd02.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.11.1511080051380.4032@nanos>
To: linux-snps-arc@lists.infradead.org

Noam,

On Sat, 7 Nov 2015, Noam Camus wrote:
> >From: Thomas Gleixner <tglx at linutronix.de>
> >> +     write_aux_reg(AUX_IENABLE, ienb);
> 
> >I can see how that works for per cpu interrupts, but what happens if
> >two cpus run that concurrent for two different interrupts?
> 
> Each CPU got its own HW copy of auxiliary register IENABLE, so
> concurrent access won't be a trouble.

Please put a comment into the code explaining it.

Thanks,

	tglx
