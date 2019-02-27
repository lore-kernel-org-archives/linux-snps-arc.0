From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 27 Feb 2019 18:18:03 +0000
Subject: [PATCH v3 02/34] arc: mm: Add p?d_large() definitions
References: <20190227170608.27963-1-steven.price@arm.com>
 <20190227170608.27963-3-steven.price@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750146437D4C@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/27/19 9:06 AM, Steven Price wrote:
> walk_page_range() is going to be allowed to walk page tables other than
> those of user space. For this it needs to know when it has reached a
> 'leaf' entry in the page tables. This information will be provided by the
> p?d_large() functions/macros.
>
> For arc, we only have two levels, so only pmd_large() is needed.
>
> CC: Vineet Gupta <vgupta at synopsys.com>
> CC: linux-snps-arc at lists.infradead.org
> Signed-off-by: Steven Price <steven.price at arm.com>

Acked-by: vineet Gupta <vgupta at synopsys.com>

Thx,
-Vineet
