From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 Feb 2017 12:55:57 -0800
Subject: Need for ARC_HAS_COH_CACHES
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <6525b5df-3a3e-5d00-0ef3-819e734cab92@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

When we started off with NPS support, it seems dcache was not enabled. Thats why
we introduced ARC_HAS_COH_CACHES etc.
But it seems eznps selects this anyways.

There is no other requirement for this toggle - are you OK if I remove it.

-Vineet
