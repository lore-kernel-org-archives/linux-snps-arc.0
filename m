From: maarten.lankhorst@linux.intel.com (Maarten Lankhorst)
Date: Wed, 8 Jun 2016 16:27:05 +0200
Subject: [PATCH 11/27] drm/arc: Implement nonblocking commit correctly
In-Reply-To: <1465388359-8070-11-git-send-email-daniel.vetter@ffwll.ch>
References: <1465388359-8070-1-git-send-email-daniel.vetter@ffwll.ch>
 <1465388359-8070-11-git-send-email-daniel.vetter@ffwll.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <adca6ee7-bcb0-6ec3-ab7e-cd9a1e6764a4@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

Op 08-06-16 om 14:19 schreef Daniel Vetter:
> Committing with block it is not.
>
> Thanks to the fixed up vblank event handling we can just use the
> helper support for nonblocking commits now.
>
> Cc: Carlos Palminha <palminha at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Signed-off-by: Daniel Vetter <daniel.vetter at intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst at linux.intel.com>
