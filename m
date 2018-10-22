From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 22 Oct 2018 13:47:09 +0000
Subject: [PATCH v2 0/2] MTD: spi-nor: add support for sst26wf016,
 sst26wf032
In-Reply-To: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
References: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1540216028.19916.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi!

Maybe you have any comments or remarks about this patch?And if you don't could you please apply it. Thanks!

On Mon, 2018-09-10@14:46 +0300, Eugeniy Paltsev wrote:
> Add support for the SST sst26wf016 and sst26wf032 flash IC:
> 
> sst26wf*** flash series block protection implementation differs from other
> SST series, so we add implementation for sst26wf*** lock/unlock/is_locked
> functions.
> 
> Add sst26wf016 and sst26wf032 flash IC info to spi_flash_ids list.
> 
> NOTE:
> these patches is basically following mine u-boot commits port:
> http://git.denx.de/?p=u-boot.git;a=commitdiff;h=3d4fed87a5fa3ffedf64ff2811cd95c5ac4503ac
> http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a19e97157c3721ef9c4b15c68c1773467a3b4a98
> 
> Changes v1->v2:
>  * Check return value of {read | write}_reg callbacks.
> 
> Eugeniy Paltsev (2):
>   mtd: spi-nor: Add support of sst26wf* flash ICs protection ops
>   mtd: spi-nor: add support for sst26wf016, sst26wf032
> 
>  drivers/mtd/spi-nor/spi-nor.c | 179 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |   4 +
>  2 files changed, 183 insertions(+)
> 
-- 
 Eugeniy Paltsev
