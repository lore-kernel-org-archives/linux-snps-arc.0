From: bhelgaas@google.com (Bjorn Helgaas)
Date: Fri, 26 Feb 2016 10:30:13 -0600
Subject: [PATCH v11 3/4] PCI: designware: Add default link up check if
 sub-driver doesn't override
In-Reply-To: <20160226162554.11964.96983.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160226162554.11964.96983.stgit@bhelgaas-glaptop2.roam.corp.google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160226163013.11964.84849.stgit@bhelgaas-glaptop2.roam.corp.google.com>
To: linux-snps-arc@lists.infradead.org

From: Joao Pinto <Joao.Pinto@synopsys.com>

Add a default DesignWare "link_up" test for use when a sub-driver doesn't
supply its own pcie_host_ops.link_up() method.

[bhelgaas: changelog, split into its own patch]
Signed-off-by: Joao Pinto <jpinto at synopsys.com>
Signed-off-by: Bjorn Helgaas <bhelgaas at google.com>
---
 drivers/pci/host/pcie-designware.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designware.c
index 1fd3ad3..fb1c16f7 100644
--- a/drivers/pci/host/pcie-designware.c
+++ b/drivers/pci/host/pcie-designware.c
@@ -70,6 +70,11 @@
 #define PCIE_ATU_FUNC(x)		(((x) & 0x7) << 16)
 #define PCIE_ATU_UPPER_TARGET		0x91C
 
+/* PCIe Port Logic registers */
+#define PLR_OFFSET			0x700
+#define PCIE_PHY_DEBUG_R1		(PLR_OFFSET + 0x2c)
+#define PCIE_PHY_DEBUG_R1_LINK_UP	0x00000010
+
 static struct pci_ops dw_pcie_ops;
 
 int dw_pcie_cfg_read(void __iomem *addr, int size, u32 *val)
@@ -401,10 +406,13 @@ int dw_pcie_wait_for_link(struct pcie_port *pp)
 
 int dw_pcie_link_up(struct pcie_port *pp)
 {
+	u32 val;
+
 	if (pp->ops->link_up)
 		return pp->ops->link_up(pp);
 
-	return 0;
+	val = readl(pp->dbi_base + PCIE_PHY_DEBUG_R1);
+	return val & PCIE_PHY_DEBUG_R1_LINK_UP;
 }
 
 static int dw_pcie_msi_map(struct irq_domain *domain, unsigned int irq,
