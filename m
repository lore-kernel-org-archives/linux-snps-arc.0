From: paul.walmsley@sifive.com (Paul Walmsley)
Date: Sat, 17 Aug 2019 14:13:30 -0700 (PDT)
Subject: [PATCH 17/26] arch: rely on asm-generic/io.h for default ioremap_*
 definitions
In-Reply-To: <20190817073253.27819-18-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-18-hch@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.9999.1908171412560.4130@viisi.sifive.com>
To: linux-snps-arc@lists.infradead.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> Various architectures that use asm-generic/io.h still defined their
> own default versions of ioremap_nocache, ioremap_wt and ioremap_wc
> that point back to plain ioremap directly or indirectly.  Remove these
> definitions and rely on asm-generic/io.h instead.  For this to work
> the backup ioremap_* defintions needs to be changed to purely cpp
> macros instea of inlines to cover for architectures like openrisc
> that only define ioremap after including <asm-generic/io.h>.
> 
> Signed-off-by: Christoph Hellwig <hch at lst.de>

Reviewed-by: Paul Walmsley <paul.walmsley at sifive.com>
Tested-by: Paul Walmsley <paul.walmsley at sifive.com> # rv32, rv64 boot
Acked-by: Paul Walmsley <paul.walmsley at sifive.com> # arch/riscv


- Paul
