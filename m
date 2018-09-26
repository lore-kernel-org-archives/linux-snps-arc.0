From: mhocko@kernel.org (Michal Hocko)
Date: Wed, 26 Sep 2018 11:24:04 +0200
Subject: [PATCH 03/30] mm: remove CONFIG_HAVE_MEMBLOCK
In-Reply-To: <1536927045-23536-4-git-send-email-rppt@linux.vnet.ibm.com>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-4-git-send-email-rppt@linux.vnet.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180926092404.GL6278@dhcp22.suse.cz>
To: linux-snps-arc@lists.infradead.org

On Fri 14-09-18 15:10:18, Mike Rapoport wrote:
> All architecures use memblock for early memory management. There is no need
> for the CONFIG_HAVE_MEMBLOCK configuration option.

git grep says
arch/csky/Kconfig:  select HAVE_MEMBLOCK

> Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>

Other than that
Acked-by: Michal Hocko <mhocko at suse.com>
-- 
Michal Hocko
SUSE Labs
