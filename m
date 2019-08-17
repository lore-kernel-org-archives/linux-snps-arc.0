From: mingo@kernel.org (Ingo Molnar)
Date: Sat, 17 Aug 2019 12:34:02 +0200
Subject: [PATCH 12/26] x86: clean up ioremap
In-Reply-To: <20190817073253.27819-13-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-13-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190817103402.GA7602@gmail.com>
To: linux-snps-arc@lists.infradead.org


* Christoph Hellwig <hch@lst.de> wrote:

> Use ioremap as the main implemented function, and defined
> ioremap_nocache to it as a deprecated alias.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>
> ---
>  arch/x86/include/asm/io.h | 8 ++------
>  arch/x86/mm/ioremap.c     | 8 ++++----
>  arch/x86/mm/pageattr.c    | 4 ++--
>  3 files changed, 8 insertions(+), 12 deletions(-)

Acked-by: Ingo Molnar <mingo at kernel.org>

Thanks,

	Ingo
