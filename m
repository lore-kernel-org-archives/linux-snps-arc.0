From: davem@davemloft.net (David Miller)
Date: Wed, 16 Jan 2019 09:21:47 -0800 (PST)
Subject: [PATCH 15/21] sparc: add checks for the return value of
 memblock_alloc*()
In-Reply-To: <1547646261-32535-16-git-send-email-rppt@linux.ibm.com>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-16-git-send-email-rppt@linux.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190116.092147.2222967221278304230.davem@davemloft.net>
To: linux-snps-arc@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>
Date: Wed, 16 Jan 2019 15:44:15 +0200

> Add panic() calls if memblock_alloc*() returns NULL.
> 
> Most of the changes are simply addition of
> 
>         if(!ptr)
>                 panic();
> 
> statements after the calls to memblock_alloc*() variants.
> 
> Exceptions are pcpu_populate_pte() and kernel_map_range() that were
> slightly refactored to accommodate the change.
> 
> Signed-off-by: Mike Rapoport <rppt at linux.ibm.com>

Acked-by: David S. Miller <davem at davemloft.net>
