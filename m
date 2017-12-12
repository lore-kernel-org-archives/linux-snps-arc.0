From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 12 Dec 2017 15:52:43 +0000
Subject: [U-Boot] Please pull ARC changes
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513093962.4945.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Tom,

This is just a one-line improvement for HSDK GPIO's Kconfig that was not included in
the previous pull-request as I was waiting for Simon's reviewed-by tag.


The following changes since commit 87f3dee22b174aa32db8213a3187aa809859c9e2:

? Merge git://git.denx.de/u-boot-uniphier (2017-12-11 17:06:04 -0500)

are available in the git repository at:

? git://git.denx.de/u-boot-arc.git?

for you to fetch changes up to d5fbcd57ed7cdcbaddf54a45e85b465bb85bfec5:

? gpio/hsdk: Depend on DM_GPIO instead of simple DM (2017-12-12 18:47:30 +0300)

----------------------------------------------------------------
Alexey Brodkin (1):
??????gpio/hsdk: Depend on DM_GPIO instead of simple DM

?drivers/gpio/Kconfig | 2 +-
?1 file changed, 1 insertion(+), 1 deletion(-)

-Alexey
