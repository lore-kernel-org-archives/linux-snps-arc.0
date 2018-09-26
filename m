From: rppt@linux.vnet.ibm.com (Mike Rapoport)
Date: Wed, 26 Sep 2018 14:48:37 +0300
Subject: [PATCH 02/30] mm: remove CONFIG_NO_BOOTMEM
In-Reply-To: <20180926092239.GK6278@dhcp22.suse.cz>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-3-git-send-email-rppt@linux.vnet.ibm.com>
 <20180926092239.GK6278@dhcp22.suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180926114836.GD4628@rapoport-lnx>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 26, 2018@11:22:39AM +0200, Michal Hocko wrote:
> On Fri 14-09-18 15:10:17, Mike Rapoport wrote:
> > All achitectures select NO_BOOTMEM which essentially becomes 'Y' for any
> > kernel configuration and therefore it can be removed.
> 
> git grep suggests that DEFERRED_STRUCT_PAGE_INIT still depends on
> NO_BOOTMEM but I have a vague feeling that I've seen a patch to address
> that. It would be great to have it folded to this one.

Yes, Alexander has already fixed that at [1]

[1] https://lkml.org/lkml/2018/9/25/1073
 
> > Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
> 
> Acked-by: Michal Hocko <mhocko at suse.com>
> -- 
> Michal Hocko
> SUSE Labs
> 

-- 
Sincerely yours,
Mike.
