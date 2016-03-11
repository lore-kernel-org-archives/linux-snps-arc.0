From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 11 Mar 2016 09:56:37 +0000
Subject: [PATCH 1/2] ARC: [BE] Select correct CROSS_COMPILE prefix
In-Reply-To: <1457688441-31337-2-git-send-email-vgupta@synopsys.com>
References: <1457688441-31337-1-git-send-email-vgupta@synopsys.com>
 <1457688441-31337-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457690197.3255.0.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2016-03-11@14:57 +0530, Vineet Gupta wrote:
> This allows CONFIG_CPU_BIG_ENDIAN=y to build correctly out of the box,
> w/o any other tweaks.
> 
> Cc: Noam Camus <noamc at ezchip.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Anton Kolesov <akolesov at synosys.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
