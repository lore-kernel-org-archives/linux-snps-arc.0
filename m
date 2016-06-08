From: maarten.lankhorst@linux.intel.com (Maarten Lankhorst)
Date: Wed, 8 Jun 2016 16:13:16 +0200
Subject: [PATCH 02/27] drm/arc: Nuke event_list
In-Reply-To: <1465388359-8070-2-git-send-email-daniel.vetter@ffwll.ch>
References: <1465388359-8070-1-git-send-email-daniel.vetter@ffwll.ch>
 <1465388359-8070-2-git-send-email-daniel.vetter@ffwll.ch>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c41de735-ac30-49b6-7498-c559313637f6@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

Op 08-06-16 om 14:18 schreef Daniel Vetter:
> This is just used for cleanup in preclose, and with the reworked event
> handling code this is now done properly by the core.
>
> Nuke it!
>
> But it also shows that arc totally fails at sending out drm events for
> flips. Next patch will hack that up.
>
> v2: Rebase it!
Reviewed-by: Maarten Lankhorst <maarten.lankhorst at linux.intel.com>
