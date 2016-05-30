From: maarten.lankhorst@linux.intel.com (Maarten Lankhorst)
Date: Mon, 30 May 2016 10:15:14 +0200
Subject: [Intel-gfx] [PATCH 15/26] drm/arc: Implement nonblocking commit
 correctly
In-Reply-To: <1464546923-13439-16-git-send-email-daniel.vetter@ffwll.ch>
References: <1464546923-13439-1-git-send-email-daniel.vetter@ffwll.ch>
 <1464546923-13439-16-git-send-email-daniel.vetter@ffwll.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <656c6841-1070-0535-1ff0-97b75fd6f7ba@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

Op 29-05-16 om 20:35 schreef Daniel Vetter:
> Committing with block it is not.
>
> Thanks to the fixed up vblank event handling we can just use the
> helper support for nonblocking commits now.
>
> Cc: Carlos Palminha <palminha at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Signed-off-by: Daniel Vetter <daniel.vetter at intel.com>
This breaks page flip on arc, it uses drm_atomic_helper_page_flip.
