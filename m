From: noamc@ezchip.com (Noam Camus)
Date: Mon, 2 Nov 2015 13:08:55 +0000
Subject: [PATCH v1 14/20] ARC: [plat-eznps] Use dedicated SMP barriers
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44CFD86@IN01WEMBXA.internal.synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-15-git-send-email-noamc@ezchip.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44CFD86@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB11415B127736FDE0CC131D5ED62C0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

From: Vineet Gupta [mailto:Vineet.Gupta1@synopsys.com] 
Sent: Monday, November 02, 2015 10:03 AM

> Do u need this even for mandatory barriers whose semantics are not related to SMP at all ? I think you need them only for smb_*
Yes I do.
For example it is used to proceed access to our Global Interrupt Manager (GIM) when we want to make sure that driver of some device committed all read/writes before we are acknowledging the GIM.
We are not falling to use "sync" since we prefer to have HW thread schedule in the meantime we wait for load/store to be done.

- Noam
