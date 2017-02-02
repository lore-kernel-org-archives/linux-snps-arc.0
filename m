From: noamca@mellanox.com (Noam Camus)
Date: Thu, 2 Feb 2017 06:27:11 +0000
Subject: Need for ARC_HAS_COH_CACHES
In-Reply-To: <6525b5df-3a3e-5d00-0ef3-819e734cab92@synopsys.com>
References: <6525b5df-3a3e-5d00-0ef3-819e734cab92@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB6PR0501MB251887C8E3EB44880EBA5DA7AA4C0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

It is OK.
Please remove.

Noam

-----Original Message-----
From: Vineet Gupta [mailto:Vineet.Gupta1@synopsys.com] 
Sent: Wednesday, February 1, 2017 10:56 PM
To: Noam Camus <noamca at mellanox.com>
Cc: arcml <linux-snps-arc at lists.infradead.org>
Subject: Need for ARC_HAS_COH_CACHES

Hi Noam,

When we started off with NPS support, it seems dcache was not enabled. Thats why we introduced ARC_HAS_COH_CACHES etc.
But it seems eznps selects this anyways.

There is no other requirement for this toggle - are you OK if I remove it.

-Vineet
