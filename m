From: mhocko@kernel.org (Michal Hocko)
Date: Wed, 26 Sep 2018 11:27:54 +0200
Subject: [PATCH 07/30] memblock: remove _virt from APIs returning virtual
 address
In-Reply-To: <1536927045-23536-8-git-send-email-rppt@linux.vnet.ibm.com>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-8-git-send-email-rppt@linux.vnet.ibm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180926092754.GN6278@dhcp22.suse.cz>
To: linux-snps-arc@lists.infradead.org

On Fri 14-09-18 15:10:22, Mike Rapoport wrote:
> The conversion is done using
> 
> sed -i 's at memblock_virt_alloc@memblock_alloc at g' \
> 	$(git grep -l memblock_virt_alloc)
> 
> Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>

As I've said earlier, I am not entirely thrilled by this change. It is
unnecessary churn. So if nothing else just add a note _why_ you think
this is better.
-- 
Michal Hocko
SUSE Labs
