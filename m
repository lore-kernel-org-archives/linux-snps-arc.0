From: maarten.lankhorst@linux.intel.com (Maarten Lankhorst)
Date: Mon, 30 May 2016 11:36:06 +0200
Subject: [Intel-gfx] [PATCH 15/26] drm/arc: Implement nonblocking commit
 correctly
In-Reply-To: <20160530092422.GF27098@phenom.ffwll.local>
References: <1464546923-13439-1-git-send-email-daniel.vetter@ffwll.ch>
 <1464546923-13439-16-git-send-email-daniel.vetter@ffwll.ch>
 <656c6841-1070-0535-1ff0-97b75fd6f7ba@linux.intel.com>
 <20160530092422.GF27098@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <29c1b351-eb21-b6a8-928d-608a6081038e@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

Op 30-05-16 om 11:24 schreef Daniel Vetter:
> On Mon, May 30, 2016@10:15:14AM +0200, Maarten Lankhorst wrote:
>> Op 29-05-16 om 20:35 schreef Daniel Vetter:
>>> Committing with block it is not.
>>>
>>> Thanks to the fixed up vblank event handling we can just use the
>>> helper support for nonblocking commits now.
>>>
>>> Cc: Carlos Palminha <palminha at synopsys.com>
>>> Cc: Alexey Brodkin <abrodkin at synopsys.com>
>>> Cc: linux-snps-arc at lists.infradead.org
>>> Signed-off-by: Daniel Vetter <daniel.vetter at intel.com>
>> This breaks page flip on arc, it uses drm_atomic_helper_page_flip.
> How exactly does this break page_flip? Note that the commit to implement
> generic nonblocking commit in drm_atomic_helper_commit is _before_ this
> patch in the series.
> -Daniel

This is patch 15/16, I found this in patch 21/26:

@@ -1147,8 +1206,11 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 {
 	int ret;
 
-	if (nonblock)
-		return -EBUSY;
