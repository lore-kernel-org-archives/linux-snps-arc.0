From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 11 Mar 2016 09:56:56 +0000
Subject: [PATCH 2/2] ARC: [*defconfig] No need to specify
 CONFIG_CROSS_COMPILE
In-Reply-To: <1457688441-31337-3-git-send-email-vgupta@synopsys.com>
References: <1457688441-31337-1-git-send-email-vgupta@synopsys.com>
 <1457688441-31337-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457690216.3255.1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2016-03-11@14:57 +0530, Vineet Gupta wrote:
> The problem is with CONFIG_CPU_BIG_ENDIAN=y we still needed .config
> fixup to override the the defconfig prefix to arceb-linux-
> 
> So remove these from defconfig and let user pass this via CROSS_COMPILE
> environment var or use the default for ENDIAN (per previous patch)
> 
> No other arch carries them in defconfigs anyways !
> 
> Cc: Noam Camus <noamc at ezchip.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Anton Kolesov <akolesov at synosys.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
