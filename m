From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 26 Sep 2016 14:23:04 -0700
Subject: [PATCH] ARC: CONFIG_NODES_SHIFT fix default values
In-Reply-To: <1474455108-13550-1-git-send-email-noamca@mellanox.com>
References: <1474455108-13550-1-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fac3834b-8690-b67e-e003-ad0dd3724aa4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/21/2016 03:51 AM, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> Seem like values assigned as absolute number and not and
> shift value, i.e. should be 0 for one node (2^0) and 1 for
> couple of nodes (2^1)
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>

Good catch ! Added to for-next.

Thx,
-Vineet
