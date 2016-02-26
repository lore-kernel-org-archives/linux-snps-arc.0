From: pratyush.anand@gmail.com (Pratyush Anand)
Date: Fri, 26 Feb 2016 22:59:30 +0530
Subject: [PATCH v11 3/4] PCI: designware: Add default link up check if
 sub-driver doesn't override
In-Reply-To: <20160226163013.11964.84849.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160226162554.11964.96983.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160226163013.11964.84849.stgit@bhelgaas-glaptop2.roam.corp.google.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHM4w1mH9e+m7sPUFhD81pOBpnypJo=dLQUoeFaL1ZNUsOUd8Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Feb 26, 2016@10:00 PM, Bjorn Helgaas <bhelgaas@google.com> wrote:
> From: Joao Pinto <Joao.Pinto at synopsys.com>
>
> Add a default DesignWare "link_up" test for use when a sub-driver doesn't
> supply its own pcie_host_ops.link_up() method.
>
> [bhelgaas: changelog, split into its own patch]
> Signed-off-by: Joao Pinto <jpinto at synopsys.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas at google.com>

No harm to existing platform, so
Acked-by: Pratyush Anand <pratyush.anand at gmail.com>
