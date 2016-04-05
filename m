From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 5 Apr 2016 18:35:05 +0000
Subject: [PATCH 4/5 v5] arc: Add our own implementation of fb_pgprotect()
In-Reply-To: <1459164999-11850-5-git-send-email-abrodkin@synopsys.com>
References: <1459164999-11850-1-git-send-email-abrodkin@synopsys.com>,
 <1459164999-11850-5-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646778119B@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> From: Alexey Brodkin [abrodkin at synopsys.com]
> Sent: Monday, March 28, 2016 2:36 PM
> To: dri-devel at lists.freedesktop.org
> Cc: linux-kernel at vger.kernel.org; Alexey Brodkin; Vineet Gupta; linux-snps-arc at lists.infradead.org
> Subject: [PATCH 4/5 v5] arc: Add our own implementation of fb_pgprotect()
> 
> During mmaping of frame-buffer pages to user-space
> fb_protect() is called to set proper page settings.
> 
> In case of ARC we need to mark pages that are mmaped to
> user as uncached because of 2 reasons:
>  * Huge amount of data if passing through data cache will
>    thrash cache a lot making cache almost useless for other
>     less traffic hungry processes.
>  * Data written by user in FB will be immediately available for
>    hardware (such as PGU etc) without requirements to flush data
>    cache regularly.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org

Could you please pick up this patch in your tree so in DRM-related series won't be external dependencies any longer?

-Alexey
