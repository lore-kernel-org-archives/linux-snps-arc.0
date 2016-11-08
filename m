From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 8 Nov 2016 14:08:08 +0000
Subject: [PATCH v2] ARC: [plat-eznps] set default baud for early console
In-Reply-To: <1478611259-4477-1-git-send-email-noamca@mellanox.com>
References: <1478611259-4477-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478614041.5131.53.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Tue, 2016-11-08@15:20 +0200, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> For CONFIG_SERIAL_EARLYCON we need 800MHz for NPS SoC
> The early console driver uses BASE_BAUD and not using dtb.
> 
> The default of 50MHz is NOT good for NPS SoC.
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>

Could you please provide a changelog (v1 -> v2) so reviewers
may have a hint about changes you made if any.

Regards,
Alexey
