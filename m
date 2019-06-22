From: Tudor.Ambarus@microchip.com (Tudor.Ambarus@microchip.com)
Date: Sat, 22 Jun 2019 10:18:50 +0000
Subject: [PATCH] mtd: spi-nor: add support for sst26wf016, sst26wf032
 memory
In-Reply-To: <20190607154308.20899-1-Eugeniy.Paltsev@synopsys.com>
References: <20190607154308.20899-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <aab6510e-9608-584e-1556-613bb0be482e@microchip.com>
To: linux-snps-arc@lists.infradead.org

Hi, Eugeniy,

On 06/07/2019 06:43 PM, Eugeniy Paltsev wrote:
> External E-Mail
> 
> 
> This commit adds support for the SST sst26wf016 and sst26wf032
> flash memory IC.

Please specify if you tested both flashes, with 1-1-1, 1-1-2 and 1-1-4 reads.
Let us know which controller you used. I ask for these to be sure that we don't
add flashes that are broken from day one.

> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 73172d7f512b..224275461a2c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1945,6 +1945,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
>  	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>  	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
> +	{ "sst26wf016",  INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

I confirm that the above is correct.

> +	{ "sst26wf032",  INFO(0xbf2622, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

There are sst26wf032 flashes that don't support SPINOR_OP_READ_1_1_2 (0x3b) and
SPINOR_OP_READ_1_1_4 (0x6b), check
https://pdf1.alldatasheet.com/datasheet-pdf/view/392063/SST/SST26WF032.html. You
can't add SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ if 0x3b and 0x6b commands are
not supported. Check spi_nor_init_params().

Cheers,
ta
