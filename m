From: mhocko@kernel.org (Michal Hocko)
Date: Wed, 26 Sep 2018 11:38:46 +0200
Subject: [PATCH 29/30] mm: remove include/linux/bootmem.h
In-Reply-To: <1536927045-23536-30-git-send-email-rppt@linux.vnet.ibm.com>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-30-git-send-email-rppt@linux.vnet.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180926093846.GS6278@dhcp22.suse.cz>
To: linux-snps-arc@lists.infradead.org

On Fri 14-09-18 15:10:44, Mike Rapoport wrote:
> Move remaining definitions and declarations from include/linux/bootmem.h
> into include/linux/memblock.h and remove the redundant header.
> 
> The includes were replaced with the semantic patch below and then
> semi-automated removal of duplicated '#include <linux/memblock.h>
> 
> @@
> @@
> - #include <linux/bootmem.h>
> + #include <linux/memblock.h>
> 
> Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>

Acked-by: Michal Hocko <mhocko at suse.com>
-- 
Michal Hocko
SUSE Labs
