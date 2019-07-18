From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 18 Jul 2019 17:06:23 +0300
Subject: [PATCH v2] mtd: spi-nor: add support for sst26wf016b memory IC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190718140623.20862-1-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This commit adds support for the SST sst26wf016b flash memory IC.
This IC was tested with  "snps,dw-apb-ssi" SPI controller.
We don't test dual/quad reads however sst26wf016b flash's datasheet
advertises both dual and quad reads (and support of corresponding
commands)

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
Changes v1->v2:
 * drop sst26wf032 support as untested
 * add note about SPI controller used and dual/quad reads to commit
   message.

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7f512b..0beed856bad8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1945,6 +1945,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
-- 
2.21.0
