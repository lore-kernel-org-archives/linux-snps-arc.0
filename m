From: kirill.shutemov@linux.intel.com (Kirill A. Shutemov)
Date: Thu, 10 Oct 2019 11:56:09 +0300
Subject: [PATCH 0/3] eldie generated code for folded p4d/pud
In-Reply-To: <20191009222658.961-1-vgupta@synopsys.com>
References: <20191009222658.961-1-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191010085609.xgwkrbzea253wmfg@black.fi.intel.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Oct 09, 2019@10:26:55PM +0000, Vineet Gupta wrote:
> Hi,
> 
> This series elides extraneous generate code for folded p4d/pud.
> This came up when trying to remove __ARCH_USE_5LEVEL_HACK from ARC port.
> The code saving are not a while lot, but still worthwhile IMHO.

Agreed.

Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>

-- 
 Kirill A. Shutemov
