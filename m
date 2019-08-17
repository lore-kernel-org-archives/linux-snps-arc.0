From: paul.walmsley@sifive.com (Paul Walmsley)
Date: Sat, 17 Aug 2019 13:58:16 -0700 (PDT)
Subject: [PATCH 14/26] asm-generic: don't provide __ioremap
In-Reply-To: <20190817073253.27819-15-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-15-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
To: linux-snps-arc@lists.infradead.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> __ioremap is not a kernel API, but used for helpers with differing
> semantics in arch code.  We should not provide it in as-generic.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>

Reviewed-by: Paul Walmsley <paul.walmsley at sifive.com>
Tested-by: Paul Walmsley <paul.walmsley at sifive.com> # rv32, rv64 boot
Acked-by: Paul Walmsley <paul.walmsley at sifive.com> # arch/riscv


- Paul
