From: pratyush.anand@gmail.com (Pratyush Anand)
Date: Fri, 26 Feb 2016 22:54:52 +0530
Subject: [PATCH v11 2/4] PCI: designware: Add generic
 dw_pcie_wait_for_link()
In-Reply-To: <20160226163004.11964.55387.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160226162554.11964.96983.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160226163004.11964.55387.stgit@bhelgaas-glaptop2.roam.corp.google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHM4w1kR+ug2aD_AZ_zMMwPODm07yMwahbBT3QKzFeN1WP6j_Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Feb 26, 2016@10:00 PM, Bjorn Helgaas <bhelgaas@google.com> wrote:
> From: Joao Pinto <Joao.Pinto at synopsys.com>
>
> Several DesignWare-based drivers (dra7xx, exynos, imx6, keystone, qcom, and
> spear13xx) had similar loops waiting for the link to come up.
>
> Add a generic dw_pcie_wait_for_link() for use by all these drivers so the
> waiting is done consistently, e.g., always using usleep_range() rather than
> mdelay() and using similar timeouts and retry counts.
>
> Note that this changes the Keystone link training/wait for link strategy,
> so we initiate link training, then wait longer for the link to come up
> before re-initiating link training.
>
> [bhelgaas: changelog, split into its own patch, update pci-keystone.c, pcie-qcom.c]
> Signed-off-by: Joao Pinto <jpinto at synopsys.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas at google.com>

5 retries should be sufficient for keystone, still it would be good to
have a tested-by for it.
Other than that code seems fine to me.

Acked-by: Pratyush Anand <pratyush.anand at gmail.com>
