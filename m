From: noamca@mellanox.com (Noam Camus)
Date: Fri, 11 Mar 2016 05:07:09 +0000
Subject: [PATCH] arc: use little endian accesses
In-Reply-To: <1457636268.457.34.camel@synopsys.com>
References: <1457544064-16167-1-git-send-email-ltrimas@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8EDF9@us01wembx1.internal.synopsys.com>
 <1457595846.2868.10.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8F1A0@us01wembx1.internal.synopsys.com>,
 <1457636268.457.34.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR05MB1625869B55C8FB5657477812AAB50@HE1PR05MB1625.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

> From: Lada Trimasova <Lada.Trimasova at synopsys.com>
> Sent: Thursday, March 10, 2016 8:57 PM

> And for example, let's see what happens when we use "readl" in  function "serial8250_early_in" in driver/tty/serial/8250.

Is your DTS entry includes for serial node following entries:
reg-io-width = <4>
native-endian;

if answer is yes you should expect (in case of big endian compilation) that:
port->iotype would be equal to UPIO_MEM32BE, hence no readl() use for this case.

This is how it works for me here, it sounds like your case is similar.

Regards,
Noam
