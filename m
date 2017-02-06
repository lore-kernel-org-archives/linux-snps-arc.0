From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon,  6 Feb 2017 22:24:45 +0300
Subject: [PATCH] net: phy: dp83867: Fall-back to default values of clock delay
 and FIFO depth
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170206192445.35829-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Given there're default values mentioned in the PHY datasheet
fall-back gracefully to them instead of silently return an error
through the whole call-chain.

This allows to use minimalistic description in DT if no special
features are required.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Murali Karicheri <m-karicheri2 at ti.com>
Cc: Sekhar Nori <nsekhar at ti.com>
Cc: David S. Miller <davem at davemloft.net>
Cc: Grygorii Strashko <grygorii.strashko at ti.com>
Cc: Florian Fainelli <f.fainelli at gmail.com>
Cc: Mugunthan V N <mugunthanvnm at ti.com>
Cc: Andrew Lunn <andrew at lunn.ch>
---
 drivers/net/phy/dp83867.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index ca1b462..5d8c5ec 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -135,17 +135,20 @@ static int dp83867_of_init(struct phy_device *phydev)
 	if (ret &&
 	    (phydev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
 	     phydev->interface == PHY_INTERFACE_MODE_RGMII_RXID))
-		return ret;
+		dp83867->rx_id_delay = DP83867_RGMIIDCTL_2_00_NS;
 
 	ret = of_property_read_u32(of_node, "ti,tx-internal-delay",
 				   &dp83867->tx_id_delay);
 	if (ret &&
 	    (phydev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
 	     phydev->interface == PHY_INTERFACE_MODE_RGMII_TXID))
-		return ret;
+		dp83867->tx_id_delay = DP83867_RGMIIDCTL_2_00_NS;
 
-	return of_property_read_u32(of_node, "ti,fifo-depth",
-				   &dp83867->fifo_depth);
+	ret = of_property_read_u32(of_node, "ti,fifo-depth", &dp83867->fifo_depth);
+	if (ret)
+		dp83867->fifo_depth = DP83867_PHYCR_FIFO_DEPTH_4_B_NIB;
+
+	return 0;
 }
 #else
 static int dp83867_of_init(struct phy_device *phydev)
-- 
2.10.2
