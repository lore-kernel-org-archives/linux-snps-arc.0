From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 22 Dec 2016 16:26:37 -0800
Subject: [PATCH 0/2] Minor fixes for CCMs
In-Reply-To: <1482415750-5471-1-git-send-email-abrodkin@synopsys.com>
References: <1482415750-5471-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <81af855f-4847-5115-6f3e-49bb005b0a24@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/22/2016 06:09 AM, Alexey Brodkin wrote:
> It turned out current implementation of CCM support doesn't work at all.
> There're 2 isseus:
>  * Data/code which is supposed to be in DCCM or ICCM accordingly gets
>    merged in common .data and .text sections so CCMs won't be used
>  * Kerenl will panic on early boot because comparison of CCM sizes
>    is implemented incorrectly

FWIW, for current hsdk bringup I won't recommend to switch them on just yet !

>
> This short series fixes both issues above so CCMs are usable again.
> And both patches indeed should be back-ported to stable kernels.
>
> Alexey Brodkin (2):
>   arc: rename xCCM sections so they are not merged in global .data/.text
>   arc: Fix xCCM size check
>
>  arch/arc/include/asm/linkage.h | 6 +++---
>  arch/arc/kernel/setup.c        | 4 ++--
>  arch/arc/kernel/vmlinux.lds.S  | 8 ++++----
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
