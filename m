From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue,  4 Sep 2018 18:33:42 +0300
Subject: [PATCH 2/2] mtd: spi-nor: add support for sst26wf016, sst26wf032
In-Reply-To: <20180904153342.16742-1-Eugeniy.Paltsev@synopsys.com>
References: <20180904153342.16742-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180904153342.16742-3-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This commit adds support for the SST sst26wf016 and sst26wf032
flash IC.

NOTE:
this patch is basically following mine u-boot commit port:
http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a19e97157c3721ef9c4b15c68c1773467a3b4a98

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6f74c75c9ddc..e1562363862a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1333,6 +1333,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst26wf016",  INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "sst26wf032",  INFO(0xbf2622, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
-- 
2.14.4
