From: noamc@ezchip.com (Noam Camus)
Date: Mon, 2 Nov 2015 12:16:28 +0000
Subject: [PATCH v1 18/20] ARC: [plat-eznps] define IPI_IRQ
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44CFD60@IN01WEMBXA.internal.synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-19-git-send-email-noamc@ezchip.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44CFD60@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB1141C5F251A61AEBE227AC32D62C0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

> From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
> Sent: Monday, November 02, 2015 9:53 AM

> Again this break bisectability - it needs to be placed before you use this #define in patch 3/20.
> Anyhow since you are doing stuff via DT, why not get this value from DT itself instead of hard coding.

OK I will change order.
However last commit should protect us since without it nothing will be compiled.

-Noam
