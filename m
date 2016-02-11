From: schwidefsky@de.ibm.com (Martin Schwidefsky)
Date: Thu, 11 Feb 2016 11:22:23 +0100
Subject: [PATCH 1/2] mm,thp: refactor generic deposit/withdraw routines
 for wider usage
In-Reply-To: <1455182907-15445-2-git-send-email-vgupta@synopsys.com>
References: <1455182907-15445-1-git-send-email-vgupta@synopsys.com>
 <1455182907-15445-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160211112223.0acc8237@mschwide>
To: linux-snps-arc@lists.infradead.org

On Thu, 11 Feb 2016 14:58:26 +0530
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> Generic pgtable_trans_huge_deposit()/pgtable_trans_huge_withdraw()
> assume pgtable_t to be struct page * which is not true for all arches.
> Thus arc, s390, sparch end up with their own copies despite no special
> hardware requirements (unlike powerpc).

s390 does have a special hardware requirement. pgtable_t is an address
for a 2K block of memory. It is *not* equivalent to a struct page *
which refers to a 4K block of memory. That has been the whole point
to introduce pgtable_t.

> It seems massaging the code a bit can make it reusbale.

Imho the new code for asm-generic looks fine, as long as the override
with __HAVE_ARCH_PGTABLE_DEPOSIT/__HAVE_ARCH_PGTABLE_WITHDRAW continues
to work I do not mind.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
