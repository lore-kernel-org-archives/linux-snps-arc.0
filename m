From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 28 Jun 2018 17:37:56 -0700
Subject: [PATCH] ARC: Fix __swp_offset() implementation
In-Reply-To: <20180628235914.20706-1-abrodkin@synopsys.com>
References: <20180628235914.20706-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1406e091-d288-c5d6-5340-1bbca25d39c2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/28/2018 04:59 PM, Alexey Brodkin wrote:
> We encode offset from swapcache page in __swp_entry() this way, see [1]:
> | /* Encode swap {type,off} tuple into PTE
> |  * We reserve 13 bits for 5-bit @type, keeping bits 12-5 zero, ensuring that
> |  * PAGE_PRESENT is zero in a PTE holding swap "identifier"
> |  */
> | #define __swp_entry(type, off)	((swp_entry_t) { \
> | 					((type) & 0x1f) | ((off) << 13) })
>
> But decode in __swp_offset() as:
> | #define __swp_offset(pte_lookalike)	((pte_lookalike).val << 13)
> which is obviously wrong, we should ">> 13" instead.
>
> This basically fixes swap usage on ARC finally.

Nice. Wish all fixes were so simple ;-)

I've added this to for-curr and will also make its way to stable, but lets clean
up this mess of hardcoded 13 properly as a cleanup patch. There are good
references to look at : arm, riscv etc

Thx,
-Vineet
