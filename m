From: hch@lst.de (Christoph Hellwig)
Date: Sat, 15 Dec 2018 11:47:20 +0100
Subject: [PATCH 3/6] sparc: remove the sparc32_dma_ops indirection
In-Reply-To: <20181215063018.GA11415@roeck-us.net>
References: <20181208174115.16237-1-hch@lst.de>
 <20181208174115.16237-4-hch@lst.de> <20181215063018.GA11415@roeck-us.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181215104720.GA1575@lst.de>
To: linux-snps-arc@lists.infradead.org

On Fri, Dec 14, 2018@10:30:18PM -0800, Guenter Roeck wrote:
> and so on, until qemu is terminated. This is seen with all sparc32
> qemu emulations. Reverting the patch fixes the problem.

Hi Guenter,

can you check which of the three new ops is used in this case?  Or
provide the qemu config and rootfs?
