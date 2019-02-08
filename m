From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 8 Feb 2019 10:11:47 -0800
Subject: [PATCH v2 0/3] Replace opencoded set_mask_bits
In-Reply-To: <1548275584-18096-1-git-send-email-vgupta@synopsys.com>
References: <1548275584-18096-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c8f00c90-2e09-e825-1a1f-056294cafbea@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/23/19 12:33 PM, Vineet Gupta wrote:
> Hi,
> 
> Repost of [1] rebased on 5.0-rc3 + accumulated Acked-by/Reviewed-by.
> No code changes since v1.
> 
> Please consider applying.
> 
> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-January/005201.html
> 
> Thx,
> -Vineet

Ping ! @Peter, @Arnd are you happy with this. If so, Andrew can you please add
this via mm tree or do i need to pester the respective maintainers !

Thx,
-Vineet

> 
> Vineet Gupta (3):
>   coredump: Replace opencoded set_mask_bits()
>   fs: inode_set_flags() replace opencoded set_mask_bits()
>   bitops.h: set_mask_bits() to return old value
> 
>  fs/exec.c              | 7 +------
>  fs/inode.c             | 8 +-------
>  include/linux/bitops.h | 2 +-
>  3 files changed, 3 insertions(+), 14 deletions(-)
> 
