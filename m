From: cl@linux.com (Christoph Lameter)
Date: Tue, 8 Mar 2016 09:00:57 -0600 (CST)
Subject: [PATCH] mm: slub: Ensure that slab_unlock() is atomic
In-Reply-To: <1457447457-25878-1-git-send-email-vgupta@synopsys.com>
References: <1457447457-25878-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1603080857360.4047@east.gentwo.org>
To: linux-snps-arc@lists.infradead.org

On Tue, 8 Mar 2016, Vineet Gupta wrote:

> This in turn happened because slab_unlock() doesn't serialize properly
> (doesn't use atomic clear) with a concurrent running
> slab_lock()->test_and_set_bit()

This is intentional because of the increased latency of atomic
instructions. Why would the unlock need to be atomic? This patch will
cause regressions.

Guess this is an architecture specific issue of modified
cachelines not becoming visible to other processors?
