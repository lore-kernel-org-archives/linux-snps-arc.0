From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 May 2017 11:36:06 +0000
Subject: [PATCH 02/10] ARC: send ipi to all cpus sharing task mm in case
 of page fault
In-Reply-To: <1495679660-9598-3-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-3-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495712165.5393.38.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Thu, 2017-05-25@05:34 +0300, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> This patch is derived due to performance issue.
> The use case is a page fault that resides on more than the local cpu.
> Trying to broadcast all CPUs results on performance degradation.
> So we try to avoid this by sending only to the relevant CPUs.
> 
> Signed-off-by: Noam Camus <noamca at mellanox.com>

Really nice catch!

Reviewed-by: Alexey Brodkin <abrodkin at synopsys.com>
