From: Tudor.Ambarus@microchip.com (Tudor.Ambarus@microchip.com)
Date: Tue, 20 Aug 2019 14:40:50 +0000
Subject: [PATCH v2] mtd: spi-nor: add support for sst26wf016b memory IC
In-Reply-To: <20190718140623.20862-1-Eugeniy.Paltsev@synopsys.com>
References: <20190718140623.20862-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c7d2b65a-b821-7a42-ba79-e8d0a80ce970@microchip.com>
To: linux-snps-arc@lists.infradead.org



On 07/18/2019 05:06 PM, Eugeniy Paltsev wrote:
> External E-Mail
> 
> 
> This commit adds support for the SST sst26wf016b flash memory IC.
> This IC was tested with  "snps,dw-apb-ssi" SPI controller.
> We don't test dual/quad reads however sst26wf016b flash's datasheet
> advertises both dual and quad reads (and support of corresponding
> commands)
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v1->v2:
>  * drop sst26wf032 support as untested
>  * add note about SPI controller used and dual/quad reads to commit
>    message.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Wrapped to 80 chars limit and
Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
