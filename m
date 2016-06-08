From: maarten.lankhorst@linux.intel.com (Maarten Lankhorst)
Date: Wed, 8 Jun 2016 16:14:38 +0200
Subject: [PATCH 03/27] drm/arc: Actually bother with handling atomic
 events.
In-Reply-To: <1465388359-8070-3-git-send-email-daniel.vetter@ffwll.ch>
References: <1465388359-8070-1-git-send-email-daniel.vetter@ffwll.ch>
 <1465388359-8070-3-git-send-email-daniel.vetter@ffwll.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a29a4f82-1699-1c33-73ea-5b8043b53e35@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

Op 08-06-16 om 14:18 schreef Daniel Vetter:
> The drm core has a nice ready-made helper for exactly the simple case
> where it should fire on the next vblank.
>
> Note that arming the vblank event in _begin is probably too early, and
> might easily result in the vblank firing too early, before the new set
> of planes are actually disabled. But that's kinda a minor issue
> compared to just outright hanging userspace.
>
> v2: Be more robust and either arm, when the CRTC is on, or just send
> the event out right away.
>
> Cc: Carlos Palminha <palminha at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Signed-off-by: Daniel Vetter <daniel.vetter at intel.com>
Wouldn't it be better to do this in atomic_flush then?
